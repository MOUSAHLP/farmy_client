<?php

namespace App\Enums;

class OrderProductsStatus
{
    const Pending    = 1;
    const Confirmed  = 2;
    const OnDelivery = 3;
    const Deliverd   = 4;
    const Cancelled  = 5;
    const Returned   = 6;
    public static function getName($value)
    {
        $constants = array_flip((new \ReflectionClass(self::class))->getConstants());

        return $constants[$value] ?? null;
    }
    public static function getValue($name)
    {
        return defined('self::' . $name) ? constant('self::' . $name) : null;
    }
}

