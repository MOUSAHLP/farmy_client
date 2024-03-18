<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SubCategoryRequest extends FormRequest
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
      'category_id'        => 'sometimes|required|integer|exists:categories,id',
    ];
  }
  public function getCreateRules()
  {
    return [
      'name'        => 'required|string',
      'status'      => 'sometimes|required|boolean',
      'category_id' => 'required|integer|exists:categories,id',
      'image'       => 'sometimes|required|image',
    ];
  }

  public function getUpdateRules()
  {
    return [
      'name'        => 'sometimes|required|string',
      'status'      => 'sometimes|required|boolean',
      'category_id' => 'sometimes|required|integer|exists:categories,id',
      'image'       => 'sometimes|required|image',
    ];
  }
}
