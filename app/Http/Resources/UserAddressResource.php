<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserAddressResource extends JsonResource
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
            default => $this->defaultResource(),
        };
    }

    public function getAllResource()
    {
        return [
            'id'              => $this->id,
            'name'            => $this->name,
            'address'         => $this->address,
            'latitude'        => $this->latitude,
            'longitude'       => $this->longitude,
            'user_id'         => $this->user_id,
            'area'            => $this->area,
            'street'          => $this->street,
            'building'        => $this->building,
            'building_number' => $this->building_number,
            'floor'           => $this->floor,
            'is_favourite'    => $this->is_favourite,
            'created_at'      => $this->created_at
        ];
    }

    public function defaultResource()
    {
        return [
            'id'              => $this->id,
            'name'            => $this->name,
            'address'         => $this->address,
            'latitude'        => $this->latitude,
            'longitude'       => $this->longitude,
            'user_id'         => $this->user_id,
            'area'            => $this->area,
            'street'          => $this->street,
            'building'        => $this->building,
            'building_number' => $this->building_number,
            'floor'           => $this->floor,
            'created_at'      => $this->created_at
        ];
    }
}
