<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class DeliveryMethod extends Model
{
    use HasFactory;

    use HasTranslations;
    public $translatable = ['name'];
    
    protected $fillable = [
        'name',
        'time',
        'price',
        'is_schedule',
        'total_price'
    ];

    protected $casts = [
        'name'          => 'string',
        'price'         => 'integer',
        'time'          => 'integer',
        'is_schedule'   => 'boolean',
    ];

    public function orders()
    {
        return $this->hasMany(Order::class);
    }
}
