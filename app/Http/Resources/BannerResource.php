<?php

namespace App\Http\Resources;

use App\Enums\MediaCollectionsNames;
use Illuminate\Http\Resources\Json\JsonResource;

class BannerResource extends JsonResource
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
      'type'       => $this->type,
      'link'       => $this->link,
      'start_time' => $this->start_time,
      'end_time'   => $this->end_time,
      'created_at' => $this->created_at,
      'image'      => $this->getFirstMediaUrl(MediaCollectionsNames::BannerImage),

    ];
  }

  public function defaultResource()
  {
    return [
      'id'         => $this->id,
      'type'       => $this->type,
      'link'       => $this->link,
      'start_time' => $this->start_time,
      'end_time'   => $this->end_time,
      'created_at' => $this->created_at,
      'image'      => $this->getFirstMediaUrl(MediaCollectionsNames::BannerImage),

    ];
  }
}
