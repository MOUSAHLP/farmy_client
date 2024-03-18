<?php

namespace App\Http\Resources;

use App\Enums\MediaCollectionsNames;
use App\Helpers\AuthHelper;
use App\Models\User;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
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
            'webShow' => $this->getWebShowResource(),
            default => $this->defaultResource(),
        };
    }

    public function getAllResource()
    {
        $is_favorite = false;
        if(isset( AuthHelper::userAuth()->id)){
            $user_favorites = User::where('id', AuthHelper::userAuth()->id)->with("favorites")->get()->pluck("favorites")->first();
            foreach ($user_favorites as $favorite) {
                if ($favorite->product_id == $this->id) {
                    $is_favorite = true;
                    break;
                }
            }
        }
        return [
            'id'               => $this->id,
            'name'             => $this->name,
            'description'      => $this->description,
            'price'            => $this->price,
            'tax'              => $this->tax,
            'slug'             => $this->slug,
            'quantity'         => $this->quantity,
            'status'           => $this->status,
            'availability'     => $this->availability,
            'seller'           => $this->seller?->only('id', 'name'),
            'subcategory_id'   => $this->subcategory_id,
            'is_favorite'       => $is_favorite,
            'discount'         => $this->discount,
            'discount_status'  => $this->discount_status,
            'product_source'   => $this->product_source,
            'commission_id'    => $this->commission_id,
            'commission_value' => $this->commission_value,
            'image'      => $this->getFirstMediaUrl(MediaCollectionsNames::ProductImage),
            'created_at'       => $this->created_at
        ];
    }
    public function getShowResource()
    {
        $is_favorite = false;
        if(isset( AuthHelper::userAuth()->id)){
            $user_favorites = User::where('id', AuthHelper::userAuth()->id)->with("favorites")->get()->pluck("favorites")->first();
            foreach ($user_favorites as $favorite) {
                if ($favorite->product_id == $this->id) {
                    $is_favorite = true;
                    break;
                }
            }
        }
        return [
            'id'               => $this->id,
            'name'             => $this->name,
            'description'      => $this->description,
            'price'            => $this->price,
            'tax'              => $this->tax,
            'slug'             => $this->slug,
            'quantity'         => $this->quantity,
            'status'           => $this->status,
            'availability'     => $this->availability,
            'seller'           => $this->seller?->only('id', 'name'),
            'is_favorite'       => $is_favorite,
            'subcategory'      => SubCategoryResource::make($this->subCategory),
            'discount'         => $this->discount,
            'discount_status'  => $this->discount_status,
            'product_source'   => $this->product_source,
            'commission_id'    => $this->commission_id,
            'commission_value' => $this->commission_value,
            'created_at'       => $this->created_at,
            'image'            => $this->getFirstMediaUrl(MediaCollectionsNames::ProductImage),
            'related_products' => ProductResource::collection($this->relatedProducts)->map->getAllResource(),
            'similar_products' => ProductResource::collection($this->similarProducts())->map->getAllResource(),
            'attributes'       => $this->attributes->map(function ($attribute) {
                return [
                    'id' => $attribute['id'],
                    'name' => $attribute['name'],
                    'value' => $attribute['pivot']['value'],
                ];
            }),

        ];
    }
    public function getWebShowResource()
    {
        $is_favorite = false;
        if(isset( AuthHelper::userAuth()->id)){
            $user_favorites = User::where('id', AuthHelper::userAuth()->id)->with("favorites")->get()->pluck("favorites")->first();
            foreach ($user_favorites as $favorite) {
                if ($favorite->product_id == $this->id) {
                    $is_favorite = true;
                    break;
                }
            }
        }
        return [
            'id'               => $this->id,
            'name'             => $this->name,
            'description'      => $this->description,
            'price'            => $this->price,
            'tax'              => $this->tax,
            'slug'             => $this->slug,
            'quantity'         => $this->quantity,
            'status'           => $this->status,
            'availability'     => $this->availability,
            'is_favorite'       => $is_favorite,
            'seller'           => $this->seller?->only('id', 'name'),
            'subcategory'      => $this->subCategory?->only('id', 'name'),
            'category'         => $this->subCategory?->category->only('id', 'name'),
            'discount'         => $this->discount,
            'discount_status'  => $this->discount_status,
            'product_source'   => $this->product_source,
            'commission_id'    => $this->commission_id,
            'commission_value' => $this->commission_value,
            'created_at'       => $this->created_at,
            'image'      => $this->getFirstMediaUrl(MediaCollectionsNames::ProductImage),
            'attributes' => $this->attributes->map(function ($attribute) {
                return [
                    'id' => $attribute->id,
                    'name' => $attribute->name,
                    'value' =>  $attribute->pivot->value,
                    'values' =>  $attribute->values->map->only('value'),
                ];
            }),

        ];
    }

    public function defaultResource()
    {
        $is_favorite = false;
        if(isset( AuthHelper::userAuth()->id)){
            $user_favorites = User::where('id', AuthHelper::userAuth()->id)->with("favorites")->get()->pluck("favorites")->first();
            foreach ($user_favorites as $favorite) {
                if ($favorite->product_id == $this->id) {
                    $is_favorite = true;
                    break;
                }
            }
        }
        return [
            'id'               => $this->id,
            'name'             => $this->name,
            'description'      => $this->description,
            'price'            => $this->price,
            'tax'              => $this->tax,
            'slug'             => $this->slug,
            'quantity'         => $this->quantity,
            'status'           => $this->status,
            'availability'     => $this->availability,
            'is_favorite'       => $is_favorite,
            'seller'           => $this->seller?->only('id', 'name'),
            'subcategory'      => $this->subCategory?->only('id', 'name'),
            'category'         => $this->subCategory?->category->only('id', 'name'),
            'discount'         => $this->discount,
            'discount_status'  => $this->discount_status,
            'product_source'   => $this->product_source,
            'commission'       => $this->commission?->only('id', 'name') + ['commission_value' => $this->commission_value],
            'created_at'       => $this->created_at,
            'image'      => $this->getFirstMediaUrl(MediaCollectionsNames::ProductImage),
            'attributes' => $this->attributes->map(function ($attribute) {
                return [
                    'id' => $attribute->id,
                    'name' => $attribute->name,
                    'value' =>  $attribute->pivot->value,
                ];
            }),
        ];
    }
    public function basicResource()
    {
        return [
            'id'               => $this->id,
            'name'             => $this->name,
        ];
    }
}
