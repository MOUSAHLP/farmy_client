<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\DeliveryTimeInfo;

class DeliveryTimeInfoService
{
    use ModelHelper;

    public function getAll()
    {
        return DeliveryTimeInfo::all();
    }

    public function find($delivery_time_infoId)
    {
        return DeliveryTimeInfo::findOrFail($delivery_time_infoId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $delivery_time_info = DeliveryTimeInfo::create($validatedData);

        DB::commit();

        return $delivery_time_info;
    }

    public function update($validatedData, $delivery_time_infoId)
    {
        $delivery_time_info = DeliveryTimeInfo::findOrFail($delivery_time_infoId);

        DB::beginTransaction();

        $delivery_time_info->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($delivery_time_infoId)
    {
        $delivery_time_info = $this->find($delivery_time_infoId);

        DB::beginTransaction();

        $delivery_time_info->delete();

        DB::commit();

        return true;
    }
}
