<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Area;

class AreaService
{
    use ModelHelper;

    public function getAll()
    {
        return Area::all();
    }

    public function find($areaId)
    {
        return Area::findOrFail($areaId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $area = Area::create($validatedData);

        DB::commit();

        return $area;
    }

    public function update($validatedData, $areaId)
    {
        $area = Area::findOrFail($areaId);

        DB::beginTransaction();

        $area->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($areaId)
    {
        $area = $this->find($areaId);

        DB::beginTransaction();

        $area->delete();

        DB::commit();

        return true;
    }
}
