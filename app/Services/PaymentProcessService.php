<?php

namespace App\Services;

use App\Enums\changeEnums;
use App\Helpers\AuthHelper;
use App\Traits\LocationTrait;
use App\Traits\ModelHelper;

class PaymentProcessService
{
    use ModelHelper, LocationTrait;

    public function __construct(
        private ProductService $productService,
        private DeliveryMethodService $deliveryMethodService,
        private DeliveryAttributeService $deliveryAttributeService,
        private UserAddressService $userAddressService,
        private UserService $userService,


    ) {
    }
    public function paymentProcess($request)
    {

        $user = AuthHelper::userAuth();
        $user = $this->userService->find($user->id);
        if($request->has('user_address_id')){

            $selectedAddress = $this->userAddressService->find($request->user_address_id);
            [$invoice,$deliveryMethods] = $this->calculateInvoice(
            $request->products,
            $this->deliveryMethodService->getAll(),
            $selectedAddress->latitude,
            $selectedAddress->longitude
        );
        }
        else{
            [$invoice,$deliveryMethods] = $this->calculateInvoice(
                $request->products,
                $this->deliveryMethodService->getAll()
            );
        }
        $data = [
            'user_address'        => $user->addresses()->orderBy('is_favourite','desc')->get(),
            'delivery_methods'    => $deliveryMethods,
            'delivery_attributes' => $this->deliveryAttributeService->getAll(),
            'changes'             =>ChangeEnums::getAllValues(),
            'invoice'             => $invoice,
        ];
        return $data;


    }
    public function calculateInvoice($products, $deliveryMethods = null , $latitude = null , $longitude = null,$delivery_method_id = null)
    {
        $total = 0;
        $totalTax = 0;

        $sellerLocations = [];


        foreach ($products as $product) {

            $currentProduct = $this->productService->find($product['product_id']);

            $seller = $currentProduct->seller;

            if ($seller && isset($seller->latitude) && isset($seller->longitude)) {
                $sellerLocations[] = ['lat' => $seller->latitude, 'lon' => $seller->longitude];
            }

            $productTotal = $currentProduct->price * $product['quantity'];
            $total = $total + $productTotal;

            $taxPercentage = $currentProduct->tax ?? 0;
            $productTax = ($taxPercentage / 100) * $productTotal;
            $totalTax = $totalTax + $productTax;

        }
        $userLocation = ['lat' => $latitude, 'lon' => $longitude];
        $totalDistance = $this->calculateTotalDistance($userLocation, $sellerLocations) / 1000;
        $seletedDeliveryMethod = null;

        if($deliveryMethods != null){
            foreach($deliveryMethods as $deliveryMethod){
                $totalPrice = $deliveryMethod->price * $totalDistance;
                $deliveryMethod->setAttribute('total_price', (int)$totalPrice);
                if(request()->has('delivery_method_id')){

                    if($deliveryMethod->id == request()->delivery_method_id){
                        $seletedDeliveryMethod = $deliveryMethod;
                    }
                }
                else if($delivery_method_id != null){
                    $seletedDeliveryMethod = $deliveryMethod;
                }
            }
        }
        $deliveryPrice = ($seletedDeliveryMethod ? $seletedDeliveryMethod->total_price : 0);
        $data = [
            'subtotal'       => $total,
            'coupon_price'   => 0,
            'delivery_price' => (int)$deliveryPrice,
            'tax'            => $totalTax,
            'total'          => (int)($total + $totalTax + $deliveryPrice),
            // 'totalDistance'  => $totalDistance,
        ];

        return [$data,$deliveryMethods];
    }


}
