<?php

namespace App\Enums;

class OrderRateAttributeEnums
{
    const delivery_time   = 1;
    const delivery_style  = 2;
    const driver          = 3;
    const packing         = 4;
    const other           = 5;

    public static function getAllValues()
    {
        $all_values = [];
        foreach (self::getValues() as $case) {
            $all_values[] = [
                "id" => $case,
                "value" => self::getAttribute($case),
            ];
        }
        return $all_values;
    }
    public static function getName($value)
    {
        $constants = array_flip((new \ReflectionClass(self::class))->getConstants());

        return $constants[$value] ?? null;
    }
    // public static function toArray($array): array
    // {
    //     if ($array == null) return [];
    //     $names_array = [];
    //     foreach (self::getValues() as $case) {
    //         for ($j = 0; $j < count($array); $j++) {
    //             if ($array[$j] == $case) {
    //                 $names_array[] = self::getInPounds(self::getName($case));
    //             }
    //         }
    //     }
    //     return $names_array;
    // }
    public static function getAttribute($name)
    {
        switch ($name) {
            case self::delivery_time:
                return __("orders.delivery_time");
            case self::delivery_style:
                return __("orders.delivery_style");
            case self::driver:
                return __("orders.driver");
            case self::packing:
                return __("orders.packing");
            case self::other:
                return __("orders.other");
        }
    }
    public static function getValue($name)
    {
        return defined('self::' . $name) ? constant('self::' . $name) : null;
    }
    public static function getValues()
    {
        return [
            self::delivery_time,
            self::delivery_style,
            self::driver,
            self::packing,
            self::other,
        ];
    }
}
