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
      'useCoupon'   =>  $this->getuseCouponRules(),
      'buyCoupon'   =>  $this->getbuyCouponRules(),
    };
  }
  public function getbuyCouponRules()
  {
      return [
          "user_id" => "required|integer|exists:users,id",
          "coupon_id" => "required|integer|exists:coupons,id"
      ];
  }
  public function getuseCouponRules()
  {
      return [
          "user_id" => "required|integer|exists:users,id",
          "coupon_code" => "required|exists:coupons_users,coupon_code"
      ];
  }

}
