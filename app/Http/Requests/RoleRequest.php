<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class RoleRequest extends FormRequest
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
            'name'               => ['required', 'string'],
            'permissions'        => ['required', 'array'],
            'permissions.*'      => ['required', 'integer', 'exists:permissions,id'],
        ];
    }

    public function getUpdateRules()
    {
        return [
            'name'               => ['sometimes', 'required', 'string'],
            'permissions'        => ['sometimes', 'required', 'array'],
            'permissions.*'      => ['sometimes', 'required', 'integer', 'exists:permissions,id'],
        ];
    }
}
