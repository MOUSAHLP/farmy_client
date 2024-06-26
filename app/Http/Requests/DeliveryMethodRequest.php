<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DeliveryMethodRequest extends FormRequest
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
      'store'   =>  $this->getCreateRules(),
      'update'   =>  $this->getUpdateRules(),
    };
  }

  public function getCreateRules()
  {
    return [
      'name'  => 'required|string',
      'time'  => 'required|numeric',
      'price' => 'required|numeric',
      'is_schedule' => 'required|boolean',
    ];
  }

  public function getUpdateRules()
  {
    return [
      'name'  => 'sometimes|required|string',
      'time'  => 'sometimes|required|numeric',
      'price' => 'sometimes|required|numeric',
      'is_schedule' => 'required|boolean',
    ];
  }
}
