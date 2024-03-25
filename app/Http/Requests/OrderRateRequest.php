<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderRateRequest extends FormRequest
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
            default   =>  [],
        };
    }

    public function getCreateRules()
    {
        return [
            'user_id'               => 'required|numeric|exists:users,id',
            'order_id'               => 'required|numeric|exists:orders,id',
            'rate'                => 'required|numeric|between:0,5',
        ];
    }

    public function getUpdateRules()
    {
        return [
            'id'        => 'required|numeric|exists:order_rates,id',
            'user_id'               => 'nullable|numeric|exists:users,id',
            'order_id'               => 'nullable|numeric|exists:orders,id',
            'rate'                => 'nullable|numeric|between:0,5',
        ];
    }
}
