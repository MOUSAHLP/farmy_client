<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderDetailsRequest extends FormRequest
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
            'changeOrderDetailStatus'   =>  $this->getchangeOrderDetailStatusRules(),
            default   =>  [],
        };
    }

    public function getchangeOrderDetailStatusRules()
    {
        return [
            'order_detail_id' => 'required|integer|exists:order_details,id',
            'status'          => 'required|bool',
        ];
    }
}
