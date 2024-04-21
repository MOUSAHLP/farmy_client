<?php

namespace App\Http\Resources;

use App\Enums\OrderRateAttributeEnums;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderRateAttributeResource extends JsonResource
{

    public function toArray($request)
    {
        $actionMethod = $request->route()->getActionMethod();
        return match ($actionMethod) {
            'index' => $this->getIndexResource(),

            default => $this->defaultResource(),
        };
    }

    public function getIndexResource()
    {
        return [
            'id'               => $this->id,
            'rate_attribute'   => OrderRateAttributeEnums::getAttribute($this->rate_attribute_id),
            'input'            => $this->input,
        ];
    }

    public function defaultResource()
    {
        return [
            'id'               => $this->id,
            'rate_attribute'             => $this->rate_attribute_id,
            'input'             => $this->input,
            'order'             => $this->order,
        ];
    }
}
