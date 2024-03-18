<?php

namespace App\Enums;

use App\Helpers\AuthHelper;

class RewardRoutes
{
    // Points
    public static function UserStatistics()
    {
        $userId = AuthHelper::userAuth()->id;
        return '/points/user-statistics/' . $userId;
    }

    // Achievements
    public static function UserNotDoneAchievements()
    {
        $userId = AuthHelper::userAuth()->id;
        return '/achievements/not-done/user/' . $userId;
    }

    // Coupon
    public static function UserCoupons()
    {
        $userId = AuthHelper::userAuth()->id;
        return '/coupons/user/' . $userId;
    }
    public static function UserPurchasableCoupons()
    {
        $userId = AuthHelper::userAuth()->id;
        return '/coupons/purchasable/user/' . $userId;
    }
    // Points
    public static function UserValidPoints()
    {
        $userId = AuthHelper::userAuth()->id;
        return '/points/valid/user/' . $userId;
    }
    public static function UserUsedPoints()
    {
        $userId = AuthHelper::userAuth()->id;
        return '/points/used/user/' . $userId;
    }
    public static function UserExpiredPoints()
    {
        $userId = AuthHelper::userAuth()->id;
        return '/points/expired/user/' . $userId;
    }

    // Ranks
    const Ranks   = '/ranks';
}
