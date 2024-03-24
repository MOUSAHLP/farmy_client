<?php

namespace App\Http\Requests;

use App\Enums\JoinOurTeamEnums;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class JoinOurTeamRequest extends FormRequest
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
            'name'               => 'required|string',
            'phone'        => 'required|min:9',
            'job'                => ['required', Rule::in(JoinOurTeamEnums::getValues())],
        ];
    }

    public function getUpdateRules()
    {
        return [
            'id'        => 'required|numeric|exists:join_our_teams,id',
            'name'      => 'nullable|string',
            'phone'     => 'nullable|min:9',
            'job'       => ['nullable', Rule::in(JoinOurTeamEnums::getValues())],
        ];
    }
}
