<?php

namespace App\Http\Controllers;

use App\Enums\RewardRoutes;

class RewardController extends Controller
{
    public function userStatistics()
    {
        $response = $this->rewardGetRequest(RewardRoutes::UserStatistics());
        $response->ranks = $this->rewardGetRequest(RewardRoutes::Ranks);

        return  $response ;
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

    public function offers()
    {
        return  $this->rewardGetRequest(RewardRoutes::UserPurchasableCoupons());
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
                "ranks" =>$ranks->data
            ],
            'dataFetchedSuccessfully'
        );
    }

}
