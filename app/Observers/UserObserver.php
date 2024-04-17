<?php

namespace App\Observers;

use App\Enums\NotificationsTypes;
use App\Models\User;
use App\Traits\NotificationHelper;
use App\Traits\RewardRequests;
use App\Enums\RewardRoutes;

class UserObserver
{
    use RewardRequests;

    public function created(User $user): void
    {
        $res = $this->rewardPostRequest(RewardRoutes::add_achievement_to_user, [
            "user_id" => $user->id,
            "achievement_id" => 1
        ]);
        $fcm_token = User::where("id",  $user->id)->get()->first()->fcm_token;
        $data = NotificationHelper::getTranslatedData($res->data->added_points, "user_created");
        NotificationHelper::sendPushNotification([$fcm_token], $data, NotificationsTypes::Offers);
    }
    public function updated(User $user): void
    {
        if ($user->getOriginal()["birthday"] == null && $user->birthday != null) {
            $res = $this->rewardPostRequest(RewardRoutes::add_achievement_to_user, [
                "user_id" => $user->id,
                "achievement_id" => 4
            ]);
            $fcm_token = User::where("id", $user->id)->get()->first()->fcm_token;
            $data = NotificationHelper::getTranslatedData($res->data->added_points, "user_birthday_added");

            NotificationHelper::sendPushNotification([$fcm_token], $data, NotificationsTypes::Offers);
        }
    }
}
