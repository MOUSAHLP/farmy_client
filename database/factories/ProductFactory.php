<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
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
            'description' => '',
            'price' => '',
            'slug' => '',
            'quantity' => '',
            'status' => '',
            'availability' => '',
            'seller_id' => '',
            'subcategory_id' => '',
            'discount' => '',
            'discount_status' => '',
            'seller_id' => '',
            'name' => '',
            'slug' => ''
        ];
    }
}
