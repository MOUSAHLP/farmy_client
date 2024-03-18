<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class HomePageDynamicRequest extends FormRequest
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
            'destroy'   =>  $this->getDestroyRules(),
        };
    }

    public function getCreateRules()
    {
        return [
            'type'        => 'required|string',
            'order' => 'required|string',
            'title_ar'    => 'required|string',
            'title_en'    => 'required|string',
            'content'    => 'required|array',
            'content.product_id'    => 'nullable|numeric|exists:products,id',
            'content.category_id'    => 'nullable|numeric|exists:categories,id',
            'content.banner_id'    => 'nullable|numeric|exists:banners,id',
        ];
    }

    public function getUpdateRules()
    {
        return [
            'id'        => 'required|numeric|exists:home_page_dynamics,id',
            'type'        => 'string',
            'order' => 'string',
            'title_ar'    => 'string',
            'title_en'    => 'string',
            'home_page_dynamic_id'    => 'numeric|exists:home_page_dynamics,id',
            'content'    => 'array',
            'content.product_id'    => 'nullable|numeric|exists:products,id',
            'content.category_id'    => 'nullable|numeric|exists:categories,id',
            'content.banner_id'    => 'nullable|numeric|exists:banners,id',
        ];
    }

    public function getDestroyRules()
    {
        return [
            'id'        => 'required|numeric|exists:home_page_dynamics,id',
        ];
    }
}
