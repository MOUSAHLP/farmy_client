<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $actionMethod = $request->route()->getActionMethod();
        return match ($actionMethod) {
            'index' => $this->getAllResource(),
            'getProfile' => $this->getProfileResource(),
            default => $this->defaultResource(),
        };
    }

    public function getAllResource()
    {
        return [
            'id'                => $this->id,
            'first_name'        => $this->first_name,
            'last_name'         => $this->last_name,
            'name'              => $this->username,
            'email'             => $this->email,
            'address'           => $this->address,
            'phone'             => $this->phone,
            'role_id'           => $this->role,
            'status'            => $this->status,
            'fcm_token'         => $this->fcm_token,
            'created_at'        => $this->created_at
        ];
    }

    public function defaultResource()
    {
        return [
            'id'                => $this->id,
            'first_name'        => $this->first_name,
            'last_name'         => $this->last_name,
            'name'              => $this->username,
            'email'             => $this->email,
            'address'           => $this->address,
            'phone'             => $this->phone,
            'city'              => $this->city?->only('id', 'name', 'state'),
            // 'state'             => $this->state?->only('id', 'name'),
            'role_id'           => $this->role,
            'status'            => $this->status,
            'fcm_token'         => $this->fcm_token,
            'created_at'        => $this->created_at
        ];
    }

    public function getProfileResource()
    {
        return [
            'id'                => $this->id,
            'first_name'        => $this->first_name,
            'last_name'         => $this->last_name,
            'email'             => $this->email,
            'phone'             => $this->phone,
            'birthday'             => $this->birthday,
        ];
    }
}
