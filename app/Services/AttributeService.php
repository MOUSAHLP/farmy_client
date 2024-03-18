<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Attribute;

class AttributeService
{
    use ModelHelper;

    public function getAll()
    {
        return Attribute::all();
    }

    public function find($product_attributeId)
    {
        return Attribute::findOrFail($product_attributeId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $product_attribute = Attribute::create($validatedData);

        $this->handleValues($product_attribute,$validatedData);

        DB::commit();

        return $product_attribute;
    }

    public function update($validatedData, $product_attributeId)
    {
        $product_attribute = Attribute::findOrFail($product_attributeId);

        DB::beginTransaction();

        $product_attribute->update($validatedData);
        
        $this->handleValues($product_attribute,$validatedData);

        DB::commit();

        return true;
    }

    public function delete($product_attributeId)
    {
        $product_attribute = $this->find($product_attributeId);

        DB::beginTransaction();

        $product_attribute->delete();

        DB::commit();

        return true;
    }
    public function addValues($validatedData, $product_attributeId)
    {
       
        $product_attribute = Attribute::findOrFail($product_attributeId);

        DB::beginTransaction();

        $product_attribute->values()->delete();
        $valuesToCreate = array_map(function ($value) {
            return ['value' => $value];
        }, $validatedData['values']);
        
        $product_attribute->values()->createMany($valuesToCreate);
        
        DB::commit();

        return true;
    }
    public function handleValues($product_attribute,$validatedData)
    {
        $product_attribute->values()->delete();
        $valuesToCreate = array_map(function ($value) {
            return ['value' => $value];
        }, $validatedData['values']);
        
        $product_attribute->values()->createMany($valuesToCreate);
    }
}
