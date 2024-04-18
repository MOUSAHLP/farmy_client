<?php

namespace App\Helpers;

class OrderResourceHelper
{
    public static function getPdfUrl($id)
    {
        return env("APP_URL") . "/api/order-pdf/" . $id;
    }

    public static function getAddressDetailed($userAddress)
    {
        return $userAddress->area . "," . __("messages.street") . " (" . $userAddress->street . ") , " . __("messages.building") .  " (" . $userAddress->building . ") , " . __("messages.building_number") .  " (" . $userAddress->building_number . ")," . __("messages.floor") .  " (" . $userAddress->floor . ")";
    }

    public static function getOrderDetailForExcel($orderDetails)
    {
        $text = "";
        foreach ($orderDetails as $orderDetail) {
            $text .= $orderDetail->product->name . " (" . $orderDetail->quantity . ") " . "\n";
        }
        return $text;
    }
}
