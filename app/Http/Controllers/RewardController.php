<?php

namespace App\Http\Controllers;

use App\Enums\RewardRoutes;
use App\Helpers\AuthHelper;
use App\Http\Requests\RewardRequest;

class RewardController extends Controller
{
    public function userStatistics()
    {
        $response = $this->rewardGetRequest(RewardRoutes::UserStatistics());
        $response->ranks = $this->rewardGetRequest(RewardRoutes::Ranks)->data;

        return  $response;
    }

    // Purchases
    public function userPurchases()
    {
        return $this->rewardGetRequest(RewardRoutes::UserPurchases());
    }

    // Achievements
    public function UserNotDoneAchievements()
    {
        return  $this->rewardGetRequest(RewardRoutes::UserNotDoneAchievements());
    }

    // Coupons
    public function coupons()
    {
        return  $this->rewardGetRequest(RewardRoutes::UserCoupons());
    }

    public function fixedValueCoupons()
    {
        return  $this->rewardGetRequest(RewardRoutes::fixed_value_coupons);
    }
    public function offersCoupons()
    {
        return  $this->rewardGetRequest(RewardRoutes::offers_coupons);
    }
    public function BuyCoupon(RewardRequest $request)
    {
        return $this->rewardPostRequest(RewardRoutes::buy_coupon, [
            "user_id" => AuthHelper::userAuth()->id,
            "coupon_id" => $request->coupon_id
        ]);
    }

    // Points
    public function userValidPoints()
    {
        return  $this->rewardGetRequest(RewardRoutes::UserValidPoints());
    }

    public function userUsedPoints()
    {
        return  $this->rewardGetRequest(RewardRoutes::UserUsedPoints());
    }

    public function userExpiredPoints()
    {
        return  $this->rewardGetRequest(RewardRoutes::UserExpiredPoints());
    }

    public function rewardsGuide()
    {
        return $this->successResponse(
            [
                'html' => view('rewards_guide')->render(),
            ],
            'dataFetchedSuccessfully'
        );
    }

    public function membershipsGuide()
    {
        $ranks = $this->rewardGetRequest(RewardRoutes::Ranks);

        return $this->successResponse(
            [
                'html' => view('membership_guide')->render(),
                "ranks" => $ranks->data
            ],
            'dataFetchedSuccessfully'
        );
    }
}
