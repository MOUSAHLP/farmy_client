<?php

namespace App\Observers;

use App\Enums\NotificationsTypes;
use App\Enums\OrderStatus;
use App\Models\Order;
use App\Traits\NotificationHelper;
use App\Traits\RewardRequests;
use App\Enums\RewardRoutes;
use App\Models\Notification;
use App\Models\User;

class OrderObserver
{
    use RewardRequests;

    public function updated(Order $order): void
    {
        // if the order was rated 
        if ($order->getOriginal()["rate"] == null && $order->rate != null) {
            $res = $this->rewardPostRequest(RewardRoutes::add_achievement_to_user, [
                "user_id" => $order->user_id,
                "achievement_id" => 3
            ]);

            $fcm_token = User::where("id", $order->user_id)->get()->first()->fcm_token;
            $data = NotificationHelper::getTranslatedData($res->data->added_points, "order_rated");

            NotificationHelper::sendPushNotification([$fcm_token], $data, NotificationsTypes::Offers);
        }

        // if the order has been canceled notify the user
        if ($order->getOriginal()["status"] != $order->status && $order->status == OrderStatus::Cancelled) {
            //
            $data = [
                "title" => __("messages.core.cancelOrderTitle"),
                "body" => __("messages.core.reason") . $order->reason_for_cancel,
            ];
            $fcm_token = User::where("id", $order->user_id)->get()->first()->fcm_token;

            NotificationHelper::sendPushNotification([$fcm_token], $data, NotificationsTypes::Orders);
            Notification::create([
                'type'            =>  NotificationsTypes::Orders,
                'notifiable_type' => 'App\Models\User',
                'notifiable_id'   => $order->user_id,
                'data'            => $data,
            ]);
        }
    }
}
