<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RewardRequest extends FormRequest
{
  public function authorize()
  {
    return true;
  }

  public function rules()
  {

    return match ($this->route()->getActionMethod()) {
      'BuyCoupon'   =>  $this->getbuyCouponRules(),
      'compensateUserCoupon'   =>  $this->getCompensateCouponRules(),
      'givePeriodicCoupons'   =>  $this->getbuyCouponRules(),
      
    };
  }
  public function getbuyCouponRules()
  {
      return [
          "coupon_id" => "required|integer|exists:coupons,id"
      ];
  }

  public function getCompensateCouponRules()  
  {
      return [
          "user_id" => "required|integer|exists:users,id",
          "coupon_id" => "required|integer|exists:coupons,id",
      ];
  }
}
