<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FixedAttributeRequest extends FormRequest
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
    return [];
  }

  public function getUpdateRules()
  {
    return [
      'model_id'        => '',
      'model_class'     => ['required', new \App\Rules\ValidModelClass],
      'attribute'       => '',
      'value'           => '',
    ];
  }
}
