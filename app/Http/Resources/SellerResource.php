<?php

namespace App\Http\Resources;

use App\Http\Requests\AreaRequest;
use Illuminate\Http\Resources\Json\JsonResource;

class SellerResource extends JsonResource
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
      'latitude'        => $this->latitude,
      'longitude'       => $this->longitude,
      'status'          => $this->status,
      'area'            => AreaResource::make($this->area)->basicResource(),
      'type'            => $this->type,
      'discount'        => $this->discount,
      'discount_status' => $this->discount_status,
      'created_at'      => $this->created_at
    ];
  }

  public function defaultResource()
  {
    return [
      'id'              => $this->id,
      'name'            => $this->name,
      'latitude'        => $this->latitude,
      'longitude'       => $this->longitude,
      'status'          => $this->status,
      'area'            => AreaResource::make($this->area)->basicResource(),
      'type'            => $this->type,
      'discount'        => $this->discount,
      'discount_status' => $this->discount_status,
      'created_at'      => $this->created_at
    ];
  }
}
