<?php

namespace App\Http\Resources;

use App\Enums\changeEnums;
use App\Enums\OrderProductsStatus;
use App\Enums\OrderStatus;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Helpers\AuthHelper;
use App\Models\User;
use App\Enums\MediaCollectionsNames;


class OrderResource extends JsonResource
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
            'id' => $this->id,
            'order_number' => $this->order_number,
            // 'user' => $this->user->only(['id', 'username', 'phone', 'email']),
            // 'driver' => ($this->driver ? $this->driver->only(['id', 'username', 'phone', 'email']) : null),
            'status' => OrderStatus::getName($this->status),
            'delivery_method' => $this->deliveryMethod->only(['id', 'name']),
            'payment_method' => $this->paymentMethod->only(['id', 'name']),
            'user_address' => $this->userAddress,
            'city' => ($this->city_id ? $this->city : null),
            'start_time' => $this->start_time,
            'end_time' => $this->end_time,
            'latitude' => $this->latitude,
            'longitude' => $this->longitude,
            'payment_status' => $this->payment_status,
            'total' => $this->total,
            'date' => $this->date,
            'notes' => $this->notes,
            'changes' =>ChangeEnums::toArray($this->changes),
             'expected_time'=>30,
            // 'order_details' => $this->orderDetails->map(function ($orderDetail) {
            //     return [
            //         'id' => $orderDetail->id,
            //         'order_id' => $orderDetail->order_id,
            //         'product' => $orderDetail->product,
            //         'quantity' => $orderDetail->quantity,
            //         'price' => $orderDetail->price,
            //         'status' => OrderProductsStatus::getName($orderDetail->status),
            //         'created_at' => $orderDetail->created_at,
            //         'updated_at' => $orderDetail->updated_at,
            //     ];
            // }),
        ];
    }

    public function defaultResource()
    {
        return [
            'id' => $this->id,
            'order_number' => $this->order_number,
            'user' => $this->user->only(['id', 'username', 'phone', 'email']),
            'driver' => ($this->driver ? $this->driver->only(['id', 'username', 'phone', 'email']) : null),
            'status' => OrderStatus::getName($this->status),
            'delivery_method' => $this->deliveryMethod->only(['id', 'name']),
            'payment_method' => $this->paymentMethod->only(['id', 'name']),
            'user_address' => $this->userAddress,
            'city' => ($this->city_id ? $this->city : null),
            'start_time' => $this->start_time,
            'end_time' => $this->end_time,
            'latitude' => $this->latitude,
            'longitude' => $this->longitude,
            'payment_status' => $this->payment_status,
            'total' => $this->total,
            'date' => $this->date,
            'notes' => $this->notes,
            'changes' =>ChangeEnums::toArray($this->changes) ,
            'order_details' => $this->orderDetails->map(function ($orderDetail) {
                return [
                    'id' => $orderDetail->id,
                    'order_id' => $orderDetail->order_id,
                    'product' => $this->productResource($orderDetail->product),
                    'quantity' => $orderDetail->quantity,
                    'price' => $orderDetail->price,
                    'status' => OrderProductsStatus::getName($orderDetail->status),
                    'created_at' => $orderDetail->created_at,
                    'updated_at' => $orderDetail->updated_at,
                     'expected_time'=>30,
                ];
            }),
            'invoice' => $this->invoice
        ];

    }

  public function productResource($product)
    {
        $is_favorite = false;
        if(isset( AuthHelper::userAuth()->id)){
            $user_favorites = User::where('id', AuthHelper::userAuth()->id)->with("favorites")->get()->pluck("favorites")->first();
            foreach ($user_favorites as $favorite) {
                if ($favorite->product_id == $product->id) {
                    $is_favorite = true;
                    break;
                }
            }
        }
        return [
            'id'               => $product->id,
            'name'             => $product->name,
            'description'      => $product->description,
            'price'            => $product->price,
            'tax'              => $product->tax,
            'slug'             => $product->slug,
            'quantity'         => $product->quantity,
            'status'           => $product->status,
            'availability'     => $product->availability,
            'is_favorite'       => $is_favorite,
            'seller'           => $product->seller?->only('id', 'name'),
            'subcategory'      => $product->subCategory?->only('id', 'name'),
            'category'         => $product->subCategory?->category->only('id', 'name'),
            'discount'         => $product->discount,
            'discount_status'  => $product->discount_status,
            'product_source'   => $product->product_source,
            'commission'       => $product->commission?->only('id', 'name') + ['commission_value' => $product->commission_value],
            'created_at'       => $product->created_at,
            'image'      => $product->getFirstMediaUrl(MediaCollectionsNames::ProductImage),
            'attributes' => $product->attributes->map(function ($attribute) {
                return [
                    'id' => $attribute->id,
                    'name' => $attribute->name,
                    'value' =>  $attribute->pivot->value,
                ];
            }),
        ];
    }
}