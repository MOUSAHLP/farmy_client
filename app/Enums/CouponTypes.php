<?php

namespace App\Enums;

class CouponTypes
{
    const FIXED_VALUE   = "FIXED_VALUE";
    const PERCENTAGE    = "PERCENTAGE";
    const DELIVERY = "DELIVERY";

    public static function getName($value)
    {
        $constants = array_flip((new \ReflectionClass(self::class))->getConstants());
        return $constants[$value] ?? null;
    }

    public static function getValue($name)
    {
        return defined('self::' . $name) ? constant('self::' . $name) : null;
    }
    public static function getValues()
    {
        return [
            self::FIXED_VALUE,
            self::PERCENTAGE,
            self::DELIVERY,
        ];
    }
}
