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
    const add_points_to_user = "/points/add-points";
    const used_points_report = "/points/used-report";

    // Achievements
    public static function UserAchievements()
    {
        $userId = AuthHelper::userAuth()->id;
        
        return '/achievements/user/' . $userId;
    }
    const add_achievement_to_user = "/achievements/add-achievement";
    // Coupon
    public static function UserCoupons()
    {
        $userId = AuthHelper::userAuth()->id;
        return '/coupons/user/' . $userId;
    }
   
    const coupons = '/coupons/';
    const fixed_value_coupons = '/coupons/fixed_value';
    const percentage_coupons  = '/coupons/percentage';
    const delivery_coupons    = '/coupons/delivery';
    const report_coupons    = '/coupons/report';
    const report_purchased_coupons    = '/coupons/purchased-report';
    const report_compensation_coupons    = '/coupons/compensation-report';
    const report_periodic_coupons    = '/coupons/periodic-report';

    // coupons usage
    const can_use_coupon    = '/coupons/canUse';
    const use_coupon    = '/coupons/use';

   // coupons buy
    const can_buy_coupon    = '/coupons/canBuy';
    const buy_coupon    = '/coupons/buy';
    const buy_and_use_coupon    = '/coupons/buy-and-use';

    const compensate_coupon    = '/coupons/compensate';
    const give_periodic_coupons    = '/coupons/give-periodic-coupons';
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

    // Purchases
    public static function UserPurchases()
    {
        $userId = AuthHelper::userAuth()->id;
        return '/purchases/user/'. $userId;
    }
    
    // Ranks
    const Ranks   = '/ranks';
    public static function UserCurrentRank()
    {
        $userId = AuthHelper::userAuth()->id;
        return '/ranks/current_rank/'. $userId;
    }
}
