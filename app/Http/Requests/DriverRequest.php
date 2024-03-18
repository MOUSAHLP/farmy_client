<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DriverRequest extends FormRequest
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
      'first_name'          => 'required|string|max:255',
      'last_name'           => 'required|string|max:255',
      'email'               => 'required|email|unique:users,email',
      'password'            => 'required|min:8',
      'address'             => 'nullable|string',
      'phone'               => 'required|numeric',
      'status'              => 'sometimes|boolean',
      'fcm_token'           => 'nullable|string',
      'city_id'             => 'sometimes|required|integer|exists:cities,id',
    ];
  }

  public function getUpdateRules()
  {
    return [
      'first_name'          => 'sometimes|required|string|max:255',
      'last_name'           => 'sometimes|required|string|max:255',
      'email'               => 'sometimes|required|email|unique:users,email',
      'password'            => 'sometimes|required|min:8',
      'address'             => 'nullable|string',
      'phone'               => 'sometimes|required|numeric',
      'status'              => 'sometimes|boolean',
      'fcm_token'           => 'nullable|string',
      'city_id'             => 'sometimes|required|integer|exists:cities,id',
    ];
  }
}
