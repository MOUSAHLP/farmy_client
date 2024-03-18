<?php

namespace App\Http\Resources;

use App\Enums\MediaCollectionsNames;
use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource
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
      'status'     => $this->status,
      'created_at' => $this->created_at,
      'image'      => $this->getFirstMediaUrl(MediaCollectionsNames::CategoryImage),
    ];
  }

  public function defaultResource()
  {
    return [
      'id'            => $this->id,
      'name'          => $this->name,
      'status'        => $this->status,
      'created_at'    => $this->created_at,
      'image'         => $this->getFirstMediaUrl(MediaCollectionsNames::CategoryImage),
      'subcategories' => SubCategoryResource::collection($this->subcategories)->map->defaultResource(),
    ];
  }
}
