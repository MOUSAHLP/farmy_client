<?php

namespace App\Http\Requests;

use App\Models\User;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserRequest extends FormRequest
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
            'updateProfile'   =>  $this->getUpdateProfileRules(),
            'deleteAccount'   =>  $this->getDeleteAccountRules(),
        };
    }

    public function getCreateRules()
    {
        $rules = [
            'first_name'          => 'required|string|max:255',
            'last_name'           => 'required|string|max:255',
            'email'               => 'required|email|unique:users,email',
            'password'            => 'required|confirmed|min:8',
            'address'             => 'nullable|string',
            'phone'               => 'required|numeric|unique:users,phone',
            'role_id'             => 'required|exists:roles,id',
            'status'              => 'boolean',
            'fcm_token'           => 'nullable|string',
            'city_id'             => 'required|integer|exists:cities,id',
           //'birthday'            => 'required|date',

        ];


        return $rules;
    }

    public function getUpdateRules()
    {
        $user_id = $this->route('user');
        $rules = [
            'first_name'          => 'required|string|max:255',
            'last_name'           => 'required|string|max:255',
            'email'               => [ 'required', 'email', Rule::unique('users', 'email')->ignore($user_id)],
            'password'            => 'required|min:8',
            'address'             => 'nullable|string',
            'phone'               => [ 'required', Rule::unique('users', 'phone')->ignore($user_id)],
            'role_id'             => 'required|exists:roles,id',
            'status'              => 'sometimes|boolean',
            'fcm_token'           => 'nullable|string',
            'city_id'             => 'required|integer|exists:cities,id',
        //    'birthday'            => 'sometimes|required|date',

        ];

        return $rules;
    }

    public function getUpdateProfileRules()
    {
        $user_id = auth('user')->user()->id;
        return  $rules = [
            'first_name'          => 'sometimes|required|string|max:255',
            'last_name'           => 'sometimes|required|string|max:255',
           // 'email'               => ['sometimes', 'required', 'email', Rule::unique('users', 'email')->ignore($user_id)],
            'phone'               => ['sometimes', 'required', Rule::unique('users', 'phone')->ignore($user_id)],
           // 'birthday'            => 'sometimes|required|date',
        ];
    }

    public function getDeleteAccountRules()
    {
        $id = auth('user')->user()->id;

        return $rules = [
            'delete_reason'  => 'sometimes|required|string|max:255',
            'password'       => 'required|current_password:user',
            'phone'          => 'required|exists:users,phone,id,' . $id,
        ];

    }
}
