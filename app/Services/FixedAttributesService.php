<?php

namespace App\Services;

use App\Traits\ModelHelper;
use Illuminate\Support\Facades\DB;

class FixedAttributesService
{
    use ModelHelper;

    public function updateAttribute($validatedData)
    {
        DB::beginTransaction();
        $modelClassName = '\App\Models\\' . $validatedData['model_class'];
        $model = $modelClassName::findOrFail($validatedData['model_id']);
        $model->update([
            $validatedData['attribute'] => $validatedData['value']
        ]);
        DB::commit();
        return true;
    }
}