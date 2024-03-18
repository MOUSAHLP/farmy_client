<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SellerRequest extends FormRequest
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
      'name'            => 'required|string',
      'latitude'        => 'sometimes|required|numeric',
      'longitude'       => 'sometimes|required|numeric',
      'status'          => 'sometimes|required|boolean',
      'area_id'         => 'required|integer|exists:areas,id',
      'type'            => 'required|string',
      'discount'        => 'sometimes|required|numeric',
      'discount_status' => '',
    ];
  }

  public function getUpdateRules()
  {
    return [
      'name'            => 'sometimes|required|string',
      'latitude'        => 'sometimes|required|numeric',
      'longitude'       => 'sometimes|required|numeric',
      'status'          => 'sometimes|required|boolean',
      'area_id'         => 'sometimes|required|integer|exists:areas,id',
      'type'            => 'sometimes|required|string',
      'discount'        => 'sometimes|required|numeric',
      'discount_status' => '',
    ];
  }
}
