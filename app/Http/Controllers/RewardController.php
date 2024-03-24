<?php

namespace App\Http\Controllers;

use App\Enums\RewardRoutes;

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

    public function percentageCoupons()
    {
        return  $this->rewardGetRequest(RewardRoutes::percentage_coupons);
    }
    public function deliveryCoupons()
    {
        return  $this->rewardGetRequest(RewardRoutes::delivery_coupons);
    }
    public function useCoupon()
    {
        return  $this->rewardPostRequest(RewardRoutes::use_coupon, [
            "user_id" => 16,
            "coupon_code" => "HoycyNYj"
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
