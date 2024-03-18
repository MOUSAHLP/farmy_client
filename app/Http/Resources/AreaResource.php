<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AreaResource extends JsonResource
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
      'id'         => $this->id,
      'name'       => $this->name,
      'is_default' => $this->is_default,
      'latitude'   => $this->latitude,
      'longitude'   => $this->longitude,
      'created_at' => $this->created_at
    ];
  }

  public function defaultResource()
  {
    return [
      'id'         => $this->id,
      'name'       => $this->name,
      'is_default' => $this->is_default,
      'latitude'   => $this->latitude,
      'longitude'   => $this->longitude,
      'created_at' => $this->created_at
    ];
  }
  public function basicResource()
  {
    return [
      'id'         => $this->id,
      'name'       => $this->name,
    ];
  }
}
