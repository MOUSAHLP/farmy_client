<?php

namespace App\Enums;

class JoinOurTeamEnums
{
    const Administrative   = "إداري";
    const CustomersService   = "خدمة العملاء";
    const IT   = "IT";
    const Accountant = "محاسب";
    const DeliveryWorker  = "عامل توصيل";
    const HR  = "HR";
    const Otherwise  = "غير ذلك";

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
            self::Administrative,
            self::CustomersService,
            self::IT,
            self::Accountant,
            self::DeliveryWorker,
            self::HR,
            self::Otherwise,
        ];
    }
}
