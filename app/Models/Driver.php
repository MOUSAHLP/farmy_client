<?php

namespace App\Models;

use App\Enums\OrderStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Tymon\JWTAuth\Contracts\JWTSubject;

class Driver extends Authenticatable implements JWTSubject
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;


    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'password',
        'address',
        'birthday',
        'phone',
        'status',
        'fcm_token',
        'city_id',
        'latitude',
        'longitude'
    ];




    protected $hidden = [
        'password',
        'deleted_at',
    ];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }
    public function getUserNameAttribute()
    {
        return $this->first_name . ' ' . $this->last_name;
    }
    public function city()
    {
        return $this->belongsTo(City::class);
    }
    public function type()
    {
        return $this->hasOne(DriverType::class);
    }
    public function notifications()
    {
        return $this->morphMany(Notification::class, 'notifiable');
    }

    public function scopeAsignable($query)
    {
        $orders = Order::whereNot("driver_id", null)->where("status", OrderStatus::Pending)->pluck("driver_id");

        return  $query->whereNotIn('id', $orders->toArray())->get();
    }
}
