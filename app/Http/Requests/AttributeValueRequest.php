<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AttributeValueRequest extends FormRequest
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
      'index'   =>  $this->getIndexRules(),
      'store'   =>  $this->getCreateRules(),
      'update'   =>  $this->getUpdateRules(),
    };
  }

  public function getIndexRules()
  {
    return [
      'attribute_id' => 'sometimes|exists:attributes,id',
    ];
  }
  public function getCreateRules()
  {
    return [
      'attribute_id' => '',
      'value' => '',
      'attribute_id' => ''
    ];
  }

  public function getUpdateRules()
  {
    return [
      'attribute_id' => '',
      'value' => '',
      'attribute_id' => ''
    ];
  }
}
