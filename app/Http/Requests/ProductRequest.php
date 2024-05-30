<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
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
            'index'                 =>  $this->getIndexRules(),
            'store'                 =>  $this->getCreateRules(),
            'update'                =>  $this->getUpdateRules(),
            'addRelatedProducts'    =>  $this->addRelatedProducts(),
            'deleteRelatedProducts' =>  $this->deleteRelatedProducts(),
            'getCartsPrice'         =>  $this->getCartsPriceRules(),
            'getCartProductsInfo'   =>  $this->getCartProductsInfoRules(),
        };
    }

    public function getIndexRules()
    {
        return [
            'subCategoryId'             => 'sometimes|required|integer|exists:sub_categories,id',
        ];
    }
    public function getCreateRules()
    {

        return [
            'name'                  => 'required|string',
            'description'           => 'required|string',
            'real_price'            => 'required|numeric',
            'price'                 => 'required|numeric',
            'tax'                   => 'required|numeric',
            'unit'                  => 'nullable|string',
            'slug'                  => '',
            'quantity'              => 'required|numeric',
            'status'                => 'sometimes|required|boolean',
            'availability'          => 'sometimes|required|boolean',
            'seller_id'             => 'sometimes|required|exists:sellers,id',
            'subcategory_id'        => 'required|exists:sub_categories,id',
            'discount'              => 'sometimes|required|numeric',
            'discount_status'       => 'sometimes|required|boolean',
            'product_source'        => 'sometimes|required|boolean',
            'commission_id'         => 'sometimes|required|exists:commissions,id',
            'commission_value'      => 'sometimes|required|numeric',
            'attributes'            => 'required|array',
            'attributes.*.id'       => 'required|exists:attributes,id',
            'attributes.*.value'    => 'required|string',
            'image'                 => 'sometimes|image',
            // 'values'           => 'sometimes|required|array',
        ];
    }

    public function getUpdateRules()
    {
        return [
            'name'                  => 'nullable|string',
            'description'           => 'nullable|string',
            'price'                 => 'nullable|numeric',
            'tax'                   => 'nullable|numeric',
            'slug'                  => '',
            'unit'                  => 'nullable|string',
            'quantity'              => 'nullable|numeric',
            'status'                => 'nullable|boolean',
            'availability'          => 'nullable|boolean',
            'seller_id'             => 'nullable|exists:sellers,id',
            'subcategory_id'        => 'nullable|exists:sub_categories,id',
            'discount'              => 'nullable|numeric',
            'discount_status'       => 'nullable|boolean',
            'product_source'        => 'nullable|boolean',
            'commission_id'         => 'nullable|exists:commissions,id',
            'commission_value'      => 'nullable|numeric',
            'attributes'            => 'nullable|array',
            'attributes.*.id'       => 'nullable|exists:attributes,id',
            'attributes.*.value'    => 'nullable|string',
            'image'                 => 'nullable|image',
            // 'values'           => 'nullable|array',
        ];
    }
    public function addRelatedProducts()
    {
        return [
            'products'         => 'required|array',
            'related_products' => 'required|array',
        ];
    }
    public function deleteRelatedProducts()
    {
        return [
            'relation_id'      => 'required|integer',
        ];
    }

    public function getCartsPriceRules()
    {
        return [
            '*.*.product_id' => [
                'required',
                'integer',
                'exists:products,id',
            ],
            '*.*.quantity' => 'required|integer',
        ];
    }

    public function getCartProductsInfoRules()
    {
        return [
            'products'              => 'required|array|min:1',
            'products.*' => [
                'integer',
                // 'exists:products,id',
            ],
        ];
    }
}
