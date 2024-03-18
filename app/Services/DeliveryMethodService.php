<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\DeliveryMethod;

class DeliveryMethodService
{
    use ModelHelper;

    public function getAll()
    {
        return DeliveryMethod::all();
    }

    public function find($delivery_methodId)
    {
        return DeliveryMethod::findOrFail($delivery_methodId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $delivery_method = DeliveryMethod::create($validatedData);

        DB::commit();

        return $delivery_method;
    }

    public function update($validatedData, $delivery_methodId)
    {
        $delivery_method = DeliveryMethod::findOrFail($delivery_methodId);

        DB::beginTransaction();

        $delivery_method->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($delivery_methodId)
    {
        $delivery_method = $this->find($delivery_methodId);

        DB::beginTransaction();

        $delivery_method->delete();

        DB::commit();

        return true;
    }
}
