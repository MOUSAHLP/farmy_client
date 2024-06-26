<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class UserAddressFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => '',
            'address' => '',
            'latitude' => '',
            'longitude' => '',
            'user_id' => '',
            'area' => '',
            'street' => '',
            'building' => '',
            'building_number' => '',
            'floor' => '',
            'user_id' => ''
        ];
    }
}
