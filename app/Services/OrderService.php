<?php

namespace App\Services;

use App\Enums\OrderProductsStatus;
use App\Enums\OrderStatus;
use App\Enums\RewardRoutes;
use App\Exceptions\EditOrderException;
use App\Helpers\AuthHelper;
use App\Http\Resources\ProductResource;
use App\Traits\RewardRequests;
use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Order;

class OrderService
{
    use ModelHelper, RewardRequests;

    public function __construct(
        private ProductService $productService,
        private PaymentProcessService $paymentProcessService,
        private DeliveryMethodService $deliveryMethodService,
        private UserService $userService,
        private UserAddressService $userAddressService,

    ) {
    }
    public function getAll()
    {
        $order =  Order::with([
            'user', 'deliveryMethod', 'paymentMethod', 'userAddress', 'city', 'orderDetails'
        ]);
        if (request()->has('status')) {
            $order->where('status', request()->status);
        }
        return $order->get();
    }

    public function getAllByUser()
    {
        $userId = AuthHelper::userAuth()->id;
        $user = $this->userService->find($userId);
        if (request()->has('status')) {
            $user->orders()->with([
                'user', 'deliveryMethod', 'paymentMethod', 'userAddress', 'city', 'orderDetails'
            ])->where('status', request()->status)->orderBy('id', 'asc');
        }

        // return $user->orders;
        return $user->orders()->orderBy('id', 'desc')->get();
    }


    public function getUserAllInvoices()
    {
        $userId = AuthHelper::userAuth()->id;

        return Order::where("user_id", $userId)->where("status", OrderStatus::Deliverd)->orderBy('id', 'desc')->get();
    }

    public function find($orderId)
    {
        $order = Order::with([
            'user', 'deliveryMethod', 'paymentMethod', 'userAddress', 'city', 'orderDetails', 'orderDetails.product',

        ])->findOrFail($orderId);
        $products = $order->orderDetails->map(function ($orderDetail) {
            return new ProductResource($orderDetail->product);
        });



        [$invoice, $deliveryMethods]  = $this->paymentProcessService->calculateInvoice(
            $order->orderDetails,
            collect([$order->deliveryMethod]),
            $order->userAddress->latitude,
            $order->userAddress->longitude,
            $order->deliveryMethod->id,
        );
        $order->setAttribute('invoice', $invoice);
        // $order->orderDetails = $products;
        return $order;
    }


    public function create($validatedData)
    {
        DB::beginTransaction();

        // check if there is a coupon
        [$coupon, $message] = $this->getAndUseCoupon();
        //dd($this->getCoupon($request));
        if ($coupon == null) {
            return [
                "error" => true,
                "message" => $message
            ];
        }

        $validatedData = $this->prepareOrderData($validatedData, $coupon);
        $order = Order::create($validatedData);

        $order->orderDetails()->createMany($validatedData['products']);

        $order->deliveryAttributes()->attach($validatedData['delivery_attributes']);

        DB::commit();

        return $order;
    }

    public function update($validatedData, $orderId)
    {
        $order = Order::findOrFail($orderId);

        // if ($order->stats == OrderStatus::Pending) {
        //     throw new EditOrderException();
        // }
        DB::beginTransaction();

        $validatedData = $this->prepareOrderData($validatedData);

        $order->orderDetails()->delete();
        $order->orderDetails()->createMany($validatedData['products']);

        if (isset($validatedData->delivery_attributes)) {
            $this->handleDeliveryAttributesUpdate($order, $validatedData);
        }


        $order->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($orderId)
    {
        $order = $this->find($orderId);

        DB::beginTransaction();

        $order->delete();

        DB::commit();

        return true;
    }
    public function updateStatus($validatedData, $orderId)
    {
        $order = Order::find($orderId);

        DB::beginTransaction();

        $order->update([
            'status' => $validatedData['status'],
        ]);

        DB::commit();

        return true;
    }

    public function updateRate($validatedData, $orderId)
    {
        $order = Order::find($orderId);
        DB::beginTransaction();

        $order->update([
            'rate' => $validatedData['rate'],
        ]);

        DB::commit();

        return true;
    }

    public function prepareOrderData($data, $coupon = null)
    {
        $data['user_id'] =  AuthHelper::userAuth()->id;
        $data['status'] = OrderStatus::Pending;
        $data['date'] = now();

        $data['products'] = array_map(function ($product) {

            $product['price']  = $this->productService->find($product['product_id'])->price;

            $product['status'] = OrderProductsStatus::Pending;

            return $product;
        }, $data['products']);


        $selectedAddress = $this->userAddressService->find($data['user_address_id']);


        $data2 = $this->paymentProcessService->calculateInvoice(
            $data['products'],
            $this->deliveryMethodService->getAll(),
            $selectedAddress->latitude,
            $selectedAddress->longitude,
            $data['delivery_method_id'],
            $coupon
        );
        $data['coupon_discount'] =  $data2[0]['coupon_price'];
        $data['delivery_fee'] =  $data2[0]['delivery_price'];
        $data['sub_total'] =  $data2[0]['subtotal'];
        $data['total'] =  $data2[0]['total'];

        return $data;
    }

    public function handleDeliveryAttributesUpdate($order, $validatedData)
    {
        if ($order->deliveryAttributes != null) {
            $deliveryAttributeIds = collect($validatedData['delivery_attributes'])->pluck('delivery_attribute_id')->toArray();

            $order->deliveryAttributes()->detach($deliveryAttributeIds);
        }
        $order->deliveryAttributes()->attach($validatedData['delivery_attributes']);
    }

    public function getAndUseCoupon()
    {
        if (request()->has('coupon_code')) {
            $response = $this->rewardPostRequest(RewardRoutes::use_coupon, [
                "user_id" => AuthHelper::userAuth()->id,
                "coupon_code" => request()->coupon_code
            ]);
        } else if (request()->has('coupon_id')) {
            $response = $this->rewardPostRequest(RewardRoutes::buy_and_use_coupon, [
                "user_id" => AuthHelper::userAuth()->id,
                "coupon_id" => request()->coupon_id
            ]);
        } else {
            return null;
        }
        if ($response->statusCode == 400) {
            return [
                null,
                $response->message,
            ];
        }
        $message = $response->message;
        $coupon = (array) $response->data->coupon;

        return [
            $coupon,
            $message,
        ];
    }
}
