<?php

namespace App\Http\Requests;

use App\Enums\OrderStatus;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class OrderRequest extends FormRequest
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
            'updateStatus'   =>  $this->getUpdateStatusRules(),
            default   =>  $this->getUpdateRules(),
        };
    }

    public function getCreateRules()
    {
        return [
            'order_number'          => '',
            'user_id'               => '',
            'driver_id'             => '',
            'status'                => '',
            'delivery_method_id'    => 'required|exists:delivery_methods,id',
            'payment_method_id'     => 'required|exists:payment_methods,id',
            'user_address_id'       => 'required|exists:user_addresses,id',
            'city_id'               => '',
            'start_time'            => '',
            'end_time'              => '',
            'latitude'              => '',
            'longitude'             => '',
            'payment_status'        => '',
            'total'                 => '',
            'date'                  => '',
            'notes'                 => '',
            'changes'              => '',
            'products'              => 'required|array|min:1',
            'products.*.product_id' => [
                'required',
                'exists:products,id',
            ],
            'products.*.quantity'   => 'required|integer|min:1',
            'delivery_attributes'   => 'required|array|min:1',
            'delivery_attributes.*.delivery_attribute_id' => [
                'required',
                'exists:delivery_attributes,id',
            ],
        ];
    }

    public function getUpdateStatusRules()
    {
        return[
            'status'=> 'integer',
        ];
    }
    public function getUpdateRules()
    {
        return [
            'order_number'          => '',
            'user_id'               => '',
            'driver_id'             => '',
            'status'                => ['sometimes', 'integer', Rule::in(OrderStatus::getValues())],
            'delivery_method_id'    => 'sometimes|exists:delivery_methods,id',
            'payment_method_id'     => 'sometimes|exists:payment_methods,id',
            'user_address_id'       => 'sometimes|exists:user_addresses,id',
            'city_id'               => '',
            'start_time'            => '',
            'end_time'              => '',
            'latitude'              => '',
            'longitude'             => '',
            'payment_status'        => '',
            'total'                 => '',
            'date'                  => '',
            'notes'                 => '',
            'changes'              => '',
            'products'              => 'sometimes|array|min:1',
            'products.*.product_id' => [
                'sometimes',
                'exists:products,id',
            ],
            'products.*.quantity'   => 'sometimes|integer|min:1',
            'delivery_attributes'   => 'sometimes|array|min:1',
            'delivery_attributes.*.delivery_attribute_id' => [
                'sometimes',
                'exists:delivery_attributes,id',
            ],
        ];
    }
}
