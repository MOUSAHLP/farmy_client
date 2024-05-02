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
            'updateRate'   =>  $this->getUpdateRateRules(),
            'asignOrderToDriver'   =>  $this->getasignOrderToDriverRules(),
            'cancelOrder'   =>  $this->getCancelOrderRules(),
            default   =>  $this->getUpdateRules(),
        };
    }

    public function getasignOrderToDriverRules()
    {
        return [
            'driver_id'                  => 'required|integer|exists:drivers,id',
            'order_id'                  => 'required|integer|exists:orders,id',
        ];
    }


    public function getCreateRules()
    {
        return [
            'order_number'          => '',
            'user_id'               => '',
            'code'               => '',
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
            'delivery_attributes'   => 'array',
            'delivery_attributes.*.delivery_attribute_id' => [
                'required',
                'exists:delivery_attributes,id',
            ],
        ];
    }

    public function getUpdateStatusRules()
    {
        return [
            'status' => 'integer',
            'product_id' => 'integer',
            'product_status' => 'integer',
        ];
    }

    public function getUpdateRateRules()
    {
        return [
            'rate'    => 'required|numeric|between:0,5',
            'rate_attributes'    => 'sometimes|array',
            'rate_attributes.*.id'    => 'required|integer',
            'rate_attributes.*.input'    => 'nullable|string',

        ];
    }

    public function getUpdateRules()
    {
        return [
            'order_number'          => '',
            'user_id'               => '',
            'driver_id'             => '',
            'status'                => ['', 'integer', Rule::in(OrderStatus::getValues())],
            'delivery_method_id'    => 'exists:delivery_methods,id',
            'payment_method_id'     => 'exists:payment_methods,id',
            'user_address_id'       => 'exists:user_addresses,id',
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
            'products'              => 'array|min:1',
            'products.*.product_id' => [
                'exists:products,id',
            ],
            'products.*.quantity'   => 'integer|min:1',
            'delivery_attributes'   => 'array|min:1',
            'delivery_attributes.*.delivery_attribute_id' => [
                '',
                'exists:delivery_attributes,id',
            ],
        ];
    }
    public function getCancelOrderRules()
    {
        return [
            "reason_for_cancel" => "required"
        ];
    }
}
