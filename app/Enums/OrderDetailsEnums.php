<?php

namespace App\Enums;

class OrderDetailsEnums
{
    const Delivered    = 1;
    const NotDelivered  = 2;

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
