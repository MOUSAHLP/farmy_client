<?php

namespace App\Observers;

use App\Enums\NotificationsTypes;
use App\Models\Order;
use App\Traits\NotificationHelper;
use App\Traits\RewardRequests;
use App\Enums\RewardRoutes;
use App\Models\User;

class OrderObserver
{
    use RewardRequests;

    public function created(Order $order): void
    {
        $this->rewardPostRequest(RewardRoutes::add_points_to_user, [
            "user_id" => $order->user_id,
            "points" => (int) floor($order->total / 1000),
            "achievement_id" => 5
        ]);
        $fcm_token = User::where("id", $order->user_id)->get()->first()->fcm_token;
        $data = NotificationHelper::getTranslatedData((int) floor($order->total / 1000), "order_created");

        NotificationHelper::sendPushNotification([$fcm_token], $data, NotificationsTypes::Offers);
    }
    public function updated(Order $order): void
    {
        if ($order->getOriginal()["rate"] == null && $order->rate != null) {
            $res = $this->rewardPostRequest(RewardRoutes::add_achievement_to_user, [
                "user_id" => $order->user_id,
                "achievement_id" => 3
            ]);

            $fcm_token = User::where("id", $order->user_id)->get()->first()->fcm_token;
            $data = NotificationHelper::getTranslatedData($res->data->added_points, "order_rated");

            NotificationHelper::sendPushNotification([$fcm_token], $data, NotificationsTypes::Offers);
        }
    }
}
