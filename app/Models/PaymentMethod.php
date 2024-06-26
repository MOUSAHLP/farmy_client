<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class PaymentMethod extends Model
{
    use HasFactory;
    
    use HasTranslations;
    public $translatable = ['name'];

    protected $fillable = [
        'name',
    ];

    protected $cast = [
        'name'  => 'string',
    ];
}
