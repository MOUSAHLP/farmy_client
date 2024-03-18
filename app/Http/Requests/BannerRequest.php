<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BannerRequest extends FormRequest
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
      'type'       => 'required|string',
      'link'       => 'sometimes|string',
      'start_time' => 'sometimes|date',
      'end_time'   => 'sometimes|date',
      'image'      => 'required|image',
    ];
  }

  public function getUpdateRules()
  {
    return [
      'type'       => 'sometimes|string',
      'link'       => 'sometimes|string',
      'start_time' => 'sometimes|date',
      'end_time'   => 'sometimes|date',
      'image'      => 'sometimes|image',
    ];
  }
}
