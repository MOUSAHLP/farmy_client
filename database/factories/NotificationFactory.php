<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class NotificationFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'type' => '',
            'notifiable_type' => '',
            'notifiable_id' => '',
            'data' => ''
        ];
    }
}
