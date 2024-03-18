<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\AttributeValues;

class AttributeValueService
{
    use ModelHelper;

    public function getAll($request)
    {
        return AttributeValues::when($request->attribute_id != null, function ($query) use ($request) {
            return $query->where('attribute_id', $request->attribute_id);
        })->get();
    }

    public function find($attribute_valueId)
    {
        return AttributeValues::findOrFail($attribute_valueId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $attribute_value = AttributeValues::create($validatedData);

        DB::commit();

        return $attribute_value;
    }
    public function createMany($attribute, $validatedData)
    {
        DB::beginTransaction();

        $attribute_value = AttributeValues::create($validatedData);

        DB::commit();

        return $attribute_value;
    }

    public function update($validatedData, $attribute_valueId)
    {
        $attribute_value = AttributeValues::findOrFail($attribute_valueId);

        DB::beginTransaction();

        $attribute_value->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($attribute_valueId)
    {
        $attribute_value = $this->find($attribute_valueId);

        DB::beginTransaction();

        $attribute_value->delete();

        DB::commit();

        return true;
    }
}
