<?php

namespace App\Http\Resources;

use App\Helpers\AuthHelper;
use App\Models\HomePageDynamic;
use App\Models\User;
use App\Models\UserAddress;
use App\Services\UserService;
use Illuminate\Http\Resources\Json\JsonResource;

class HomePageDynamicResource extends JsonResource
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
            default => $this->getAllResource(),
        };
    }

    public function getAllResource()
    {

        $favorite_address = null;
        if (isset(AuthHelper::userAuth()->id)) {
            $id = AuthHelper::userAuth()->id;
            $favorite_address = UserAddress::where('user_id', $id)->first();
        }


        return [
            'id'               => $this->id,
            'type'             => $this->type,
            'order'             => $this->order,
            'title' => [
                "en" =>  $this->title_en,
                "ar" =>  $this->title_ar,
            ],
            'content' =>
            $this->type == HomePageDynamic::TYPE_PRODUCT ?
                $this->content->take(HomePageDynamic::PRODUCT_TAKE_NUMBER)->map(function ($content) {
                    return ProductResource::make($content->product)->getAllResource();
                }) :
                $this->content->map(function ($content) {
                    if ($this->type == HomePageDynamic::TYPE_CATEGORY) {
                        return CategoryResource::make($content->category)->getAllResource();
                    } else if ($this->type == HomePageDynamic::TYPE_BANNER) {
                        return BannerResource::make($content->banner)->getAllResource();
                    } else {
                        return $content;
                    }
                }),
            'favourite_address' =>  $favorite_address,
        ];
    }
}
