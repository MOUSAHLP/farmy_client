<?php

namespace App\Http\Resources;

use App\Enums\DriverTypes;
use Illuminate\Http\Resources\Json\JsonResource;

class DriverTypeResource extends JsonResource
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
      'show' => $this->getAllResource(),
      default => $this->defaultResource(),
    };
  }

  public function getAllResource()
  {
    return [
      'id'                => $this->id,
      'type'              => DriverTypes::getName($this->type),
      'value'            => $this->value,
      'created_at'        => $this->created_at
    ];
  }

  public function defaultResource()
  {
    return [
      'id'                => $this->id,
      'driver'              => $this->driver,
      'type'              => DriverTypes::getName($this->type),
      'value'            => $this->value,
      'created_at'        => $this->created_at
    ];
  }
}
