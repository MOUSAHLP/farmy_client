<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class OrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'order_number' => '',
            'user_id' => '',
            'driver_id' => '',
            'status' => '',
            'delivery_method_id' => '',
            'payment_method_id' => '',
            'user_address_id' => '',
            'city_id' => '',
            'start_time' => '',
            'end_time' => '',
            'latitude' => '',
            'longitude' => '',
            'payment_status' => '',
            'total' => '',
            'date' => '',
            'notes' => '',
            'delivery_method_id' => '',
            'payment_method_id' => '',
            'user_address_id' => '',
            'user_id' => '',
            'driver_id' => ''
        ];
    }
}
