<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class DriverFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'first_name' => '',
            'last_name' => '',
            'email' => '',
            'password' => '',
            'address' => '',
            'phone' => '',
            'latitude' => '',
            'longitude' => '',
            'status' => '',
            'fcm_token' => '',
            'city_id' => '',
            'city_id' => '',
            'email' => '',
            'phone' => ''
        ];
    }
}
