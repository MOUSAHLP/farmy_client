<?php

namespace App\Services;

use App\Enums\OrderProductsStatus;
use App\Enums\OrderStatus;
use App\Exceptions\EditOrderException;
use App\Helpers\AuthHelper;
use App\Http\Resources\ProductResource;
use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Order;

class OrderService
{
    use ModelHelper;

    public function __construct(
        private ProductService $productService,
        private PaymentProcessService $paymentProcessService,
        private UserService $userService
    ) {
    }
    public function getAll()
    {
        $order =  Order::with([
            'user', 'deliveryMethod', 'paymentMethod', 'userAddress', 'city', 'orderDetails'
        ]);
        if(request()->has('status')){
            $order->where('status',request()->status);
        }
        return $order->get();
    }
    public function getAllByUser()
    {
        $userId = AuthHelper::userAuth()->id;
        $user = $this->userService->find($userId);
        if(request()->has('status')){
            $user->orders()->with([
            'user', 'deliveryMethod', 'paymentMethod', 'userAddress', 'city', 'orderDetails'
        ])->where('status',request()->status)->orderBy('id','asc');
        }

        // return $user->orders;
      return $user->orders()->orderBy('id','desc')->get();
    }

    public function find($orderId)
    {
        $order = Order::with([
            'user', 'deliveryMethod', 'paymentMethod', 'userAddress', 'city', 'orderDetails','orderDetails.product',

        ])->findOrFail($orderId);
        $products = $order->orderDetails->map(function ($orderDetail) {
            return new ProductResource($orderDetail->product);
        });



        [$invoice ,$deliveryMethods]  = $this->paymentProcessService->calculateInvoice(
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

        $validatedData = $this->prepareOrderData($validatedData);
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

        if(isset($validatedData->delivery_attributes)){
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
    public function prepareOrderData($data)
    {
        $data['user_id'] =  AuthHelper::userAuth()->id;
        $data['status'] = OrderStatus::Pending;
        $data['date'] = now();

        $data['products'] = array_map(function ($product) {

            $product['price']  = $this->productService->find($product['product_id'])->price;

            $product['status'] = OrderProductsStatus::Pending;

            return $product;
        }, $data['products']);

         $data2 =$this->paymentProcessService->calculateInvoice($data['products']);
         $data['total'] =  $data2[0]['total'];

        return $data;

    }

    public function handleDeliveryAttributesUpdate($order, $validatedData){
        if ($order->deliveryAttributes != null) {
            $deliveryAttributeIds = collect($validatedData['delivery_attributes'])->pluck('delivery_attribute_id')->toArray();

            $order->deliveryAttributes()->detach($deliveryAttributeIds);
        }
        $order->deliveryAttributes()->attach($validatedData['delivery_attributes']);
    }
}