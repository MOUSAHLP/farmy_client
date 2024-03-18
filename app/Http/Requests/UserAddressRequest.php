<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserAddressRequest extends FormRequest
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
       default   =>  $this->getUpdateRules(),
    };
  }

  public function getCreateRules()
  {
    return [
      'name'            => 'required|string',
      'address'         => 'sometimes|required|string',
      'latitude'        => 'required|numeric',
      'longitude'       => 'required|numeric',
      'user_id'         => 'sometimes|required|integer|exists:users,id',
      'area'            => 'sometimes|required|string',
      'street'          => 'sometimes|required|string',
      'building'        => 'sometimes|required|string',
      'building_number' => 'sometimes|required|string',
      'floor'           => 'sometimes|required|string',
    ];
  }

  public function getUpdateRules()
  {
    return [
      'name'            => 'sometimes|required|string',
      'address'         => 'sometimes|required|string',
      'latitude'        => 'sometimes|required|numeric',
      'longitude'       => 'sometimes|required|numeric',
      'user_id'         => 'sometimes|required|integer|exists:users,id',
      'area'            => 'sometimes|required|string',
      'street'          => 'sometimes|required|string',
      'building'        => 'sometimes|required|string',
      'building_number' => 'sometimes|required|string',
      'floor'           => 'sometimes|required|string',
    ];
  }
}
