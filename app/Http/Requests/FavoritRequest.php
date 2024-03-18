<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FavoritRequest extends FormRequest
{
  /**
   * Determine if the user is authorized to make this request.
   *
   * @return bool
   */
  public function authorize()
  {
     return true ;
  }

  /**
   * Get the validation rules that apply to the request.
   *
   * @return array
   */
  public function rules()
  {

      return match ($this->route()->getActionMethod()) {
          default   =>  $this->getRules(),
      };
  }

  public function getRules()
  {
      return [
          'product_id' => ['required','integer', 'exists:products,id']
      ];
  }
}
