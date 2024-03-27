<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PaymentProcessRequest extends FormRequest
{
  /**
   * Determine if the user is authorized to make this request.
   *
   * @return bool
   */
  public function authorize()
  {
    return true;
  }

  /**
   * Get the validation rules that apply to the request.
   *
   * @return array
   */
  public function rules()
  {

    return match ($this->route()->getActionMethod()) {
      'paymentProcess'   =>  $this->getDetails(),
    };
  }

  public function getDetails()
  {
    return [
      'products'     => 'required|array',
      'user_address_id'     => 'sometimes|numeric|exists:user_addresses,id',
      'delivery_method_id'     => 'sometimes|numeric|exists:delivery_methods,id',
      'coupon_code'     => 'sometimes|string|exists:coupons_users,coupon_code',
    ];
  }

  public function getUpdateRules()
  {
    return [
    ];
  }
}
