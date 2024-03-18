<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RoleResource extends JsonResource
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
            'getAllPermissions' => $this->getAllPermissionsResource(),
            default => $this->defaultResource(),
        };
    }

    public function getAllPermissionsResource()
    {
        return [
            'id'   => $this->id,
            'name' => $this->name,

        ];
    }
    public function getAllResource()
    {
        return [
            'id'   => $this->id,
            'name' => $this->name,

        ];
    }

    public function defaultResource()
    {
        return [
            'id'   => $this->id,
            'name' => $this->name,
            'permissions' => $this->permissions?->map->only('id','name'),
        ];
    }
}
