<?php

namespace App\Http\Resources;

use App\Enums\MediaCollectionsNames;
use Illuminate\Http\Resources\Json\JsonResource;

class SubCategoryResource extends JsonResource
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
      'show' => $this->getShowResource(),
      default => $this->defaultResource(),
    };
  }

  public function getAllResource()
  {
    return [
      'id'          => $this->id,
      'name'        => $this->name,
      'status'      => $this->status,
      'category_id' => $this->category_id,
      'created_at'  => $this->created_at,
      'image'       => $this->getFirstMediaUrl(MediaCollectionsNames::SubCategoryImage),

    ];
  }

  public function getShowResource()
  {
    return [
      'id'          => $this->id,
      'name'        => $this->name,
      'status'      => $this->status,
      'category'    => $this->category->only('id','name'),
      'products'    => ProductResource::collection($this->products)->map->getAllResource(),
      'created_at'  => $this->created_at,
      'image'       => $this->getFirstMediaUrl(MediaCollectionsNames::SubCategoryImage),

    ];
  }
  public function defaultResource()
  {
    return [
      'id'          => $this->id,
      'name'        => $this->name,
      'image'       => $this->getFirstMediaUrl(MediaCollectionsNames::SubCategoryImage),

    ];
  }
}
