<?php

namespace App\Services;

use App\Enums\changeEnums;
use App\Enums\CouponTypes;
use App\Helpers\AuthHelper;
use App\Traits\LocationTrait;
use App\Traits\ModelHelper;
use App\Enums\RewardRoutes;
use App\Traits\RewardRequests;
use Exception;

class PaymentProcessService
{
    use ModelHelper, LocationTrait, RewardRequests;

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

        // check if there is a coupon
        [$coupon, $can_use, $message] = $this->getCoupon();
        if ($coupon == null && $can_use == false) {
            return [
                "error" => true,
                "message" => $message
            ];
        }

        if ($request->has('user_address_id')) {
            $selectedAddress = $this->userAddressService->find($request->user_address_id);
            [$invoice, $deliveryMethods] = $this->calculateInvoice(
                $request->products,
                $this->deliveryMethodService->getAll(),
                $selectedAddress->latitude,
                $selectedAddress->longitude,
                null,
                $coupon
            );
        } else {
            [$invoice, $deliveryMethods] = $this->calculateInvoice(
                $request->products,
                $this->deliveryMethodService->getAll(),
                null,
                null,
                null,
                $coupon
            );
        }
        $data = [
            'user_address'        => $user->addresses()->orderBy('is_favourite', 'desc')->get(),
            'delivery_methods'    => $deliveryMethods,
            'delivery_attributes' => $this->deliveryAttributeService->getAll(),
            'coupons'             => $this->rewardGetRequest(RewardRoutes::fixed_value_coupons),
            'changes'             => ChangeEnums::getAllValues(),
            'invoice'             => $invoice,
        ];
        return $data;
    }
    public function calculateInvoice($products, $deliveryMethods = null, $latitude = null, $longitude = null, $delivery_method_id = null, $coupon = null)
    {
        $total = 0;
        $totalTax = 0;

        $sellerLocations = [];

        foreach ($products as $product) {
            if (isset($product['status']) && $product['status'] == 0) {
                continue;
            }

            $currentProduct = $this->productService->find($product['product_id']);

            $seller = $currentProduct->seller;

            if ($seller && isset($seller->latitude) && isset($seller->longitude) && !in_array(['lat' => $seller->latitude, 'lon' => $seller->longitude], $sellerLocations)) {
                $sellerLocations[] = ['lat' => $seller->latitude, 'lon' => $seller->longitude];
            }
            $productTotal = $currentProduct->price * $product['quantity'];

            if ($currentProduct['discount_status']) {
                $productTotal = $productTotal - (int)(($productTotal / 100) * $currentProduct['discount']);
            }

            $total = $total + $productTotal;

            $taxPercentage = $currentProduct->tax ?? 0;
            $productTax = ($taxPercentage / 100) * $productTotal;
            $totalTax = $totalTax + $productTax;
        }
        $userLocation = ['lat' => $latitude, 'lon' => $longitude];
        $totalDistance = $this->calculateTotalDistance($userLocation, $sellerLocations);
        $seletedDeliveryMethod = null;

        if ($deliveryMethods != null) {
            foreach ($deliveryMethods as $deliveryMethod) {
                $totalPrice = $deliveryMethod->price * $totalDistance;
                $deliveryMethod->setAttribute('total_price', (int)$totalPrice);
                if (request()->has('delivery_method_id')) {

                    if ($deliveryMethod->id == request()->delivery_method_id) {
                        $seletedDeliveryMethod = $deliveryMethod;
                    }
                } else if ($delivery_method_id != null) {
                    $seletedDeliveryMethod = $deliveryMethod;
                }
            }
        }

        $deliveryPrice = ($seletedDeliveryMethod ? $this->getDeliveryPrice($seletedDeliveryMethod->total_price) : 0);

        $coupon_price = $coupon != null ? $this->getCouponValue($coupon, $total, (int)$deliveryPrice) : 0;
        $total_sum = (int)($total + $totalTax + $deliveryPrice - $coupon_price);
        if ($total_sum < 0) $total_sum = 0;
        $data = [
            'subtotal'       => $total,
            'coupon_price'   => $coupon_price,
            'delivery_price' => (int)$deliveryPrice,
            'tax'            => $totalTax,
            'total'          => $total_sum,
            // 'totalDistance'  => $totalDistance,
        ];

        return [$data, $deliveryMethods];
    }
    public function getDeliveryPrice($deliveryPrice)
    {
        $response = $this->rewardGetRequest(RewardRoutes::UserCurrentRank());
        if ($response == null) {
            return $deliveryPrice;
        }

        foreach ($response->data->features as $feature) {
            if ($feature->name == "discount_on_deliver") {
                return $deliveryPrice - (int)(($deliveryPrice / 100) * $feature->value);
            }
        }
    }
    public function getCoupon()
    {
        if (request()->has('coupon_code') && request()->coupon_code != "") {
            $response = $this->rewardPostRequest(RewardRoutes::can_use_coupon, [
                "user_id" => AuthHelper::userAuth()->id,
                "coupon_code" => request()->coupon_code
            ]);
        } else if (request()->has('coupon_id') && request()->coupon_id != "") {
            $response = $this->rewardPostRequest(RewardRoutes::can_buy_coupon, [
                "user_id" => AuthHelper::userAuth()->id,
                "coupon_id" => request()->coupon_id
            ]);
        } else {
            return [
                null,
                true,
                null,
            ];
        }
        if ($response->statusCode >= 400) {
            return [
                null,
                false,
                $response->message,
            ];
        }
        $can_use = $response->data->can_use_coupon;
        $message = $response->message;
        $coupon = (array) $response->data->coupon;

        return [
            $coupon,
            $can_use,
            $message,
        ];
    }

    public function getCouponValue($coupon, $products_price, $deliveryPrice)
    {
        if ($coupon["coupon_type"]->type == CouponTypes::FIXED_VALUE) {
            return $coupon["value"];
        } else if ($coupon["coupon_type"]->type == CouponTypes::PERCENTAGE) {
            $coupon["value"] = $coupon["value"] > 100 ? 100 : $coupon["value"];
            return  (int)(($products_price / 100) * $coupon["value"]);
        } else if ($coupon["coupon_type"]->type == CouponTypes::DELIVERY) {
            $coupon["value"] = $coupon["value"] > 100 ? 100 : $coupon["value"];
            return (int)(($deliveryPrice / 100) * $coupon["value"]);
        }
        return $coupon["value"];
    }
}
