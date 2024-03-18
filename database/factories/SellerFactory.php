<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class SellerFactory extends Factory
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
            'latitude' => '',
            'logitude' => '',
            'status' => '',
            'area_id' => '',
            'type' => '',
            'discount' => '',
            'discount_status' => '',
            'area_id' => '',
            'name' => ''
        ];
    }
}
