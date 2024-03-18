<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\DeliveryAttribute;

class DeliveryAttributeService
{
    use ModelHelper;

    public function getAll()
    {
        return DeliveryAttribute::all();
    }

    public function find($delivery_attributeId)
    {
        return DeliveryAttribute::findOrFail($delivery_attributeId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $delivery_attribute = DeliveryAttribute::create($validatedData);

        DB::commit();

        return $delivery_attribute;
    }

    public function update($validatedData, $delivery_attributeId)
    {
        $delivery_attribute = DeliveryAttribute::findOrFail($delivery_attributeId);

        DB::beginTransaction();

        $delivery_attribute->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($delivery_attributeId)
    {
        $delivery_attribute = $this->find($delivery_attributeId);

        DB::beginTransaction();

        $delivery_attribute->delete();

        DB::commit();

        return true;
    }
}
