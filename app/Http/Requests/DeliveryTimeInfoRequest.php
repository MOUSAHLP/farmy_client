<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DeliveryTimeInfoRequest extends FormRequest
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
            'start_time'     => '',
            'end_time'       => '',
            'before_message' => '',
            'after_message'  => ''
          ];
    }

    public function getUpdateRules()
    {
        return [
            'start_time'     => 'sometimes|string',
            'end_time'       => 'sometimes|string',
            'before_message' => 'sometimes|string',
            'after_message'  => 'sometimes|string'
          ];
    }
}
