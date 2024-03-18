<?php

namespace App\Services;

use App\Helpers\AuthHelper;
use App\Http\Resources\BannerResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\ProductResource;
use App\Models\DeliveryTimeInfo;
use App\Traits\ModelHelper;
use Carbon\Carbon;

class HomePageService
{
    use ModelHelper;

    public function __construct(private UserService $userService)
    {
    }
    public function getAll()
    {
        $homePage = [];
        $homePage['categories'] = CategoryResource::collection((new CategoryService)->getAll());
        $homePage['Banners'] = BannerResource::collection((new BannerService)->getAll());
        $homePage['suggested-Products'] = ProductResource::collection((new ProductService)->suggestedProducts());
        $homePage['discounted-Products'] = ProductResource::collection((new ProductService)->discountedProduct());
        $homePage['delivery_message'] = $this->checkDeliveryMessageTime();

        if (AuthHelper::userAuth()) {
            $userId = AuthHelper::userAuth()->id;
            $user = $this->userService->find($userId);
            $favAddress = null;
            if (isset($user))
                // $favAddress = $user->addresses()->where('is_favourite',1)->first();
                $homePage['favourite_address'] = $user->addresses()->where('is_favourite', 1)->first();
        }

        return $homePage;
    }
    public function checkDeliveryMessageTime()
    {
        $deliveryTimeInfo = DeliveryTimeInfo::first();
        $currentTime = Carbon::now();
        $startTime = Carbon::createFromTimeString($deliveryTimeInfo->start_time);
        $endTime = Carbon::createFromTimeString($deliveryTimeInfo->end_time);
        if ($currentTime->between($startTime, $endTime)) {
            return $deliveryTimeInfo->before_message . ' من الساعة ' . $deliveryTimeInfo->start_time . ' حتى الساعة ' . $deliveryTimeInfo->end_time . ' ' . $deliveryTimeInfo->after_message;
        }
        return null;
    }
}
