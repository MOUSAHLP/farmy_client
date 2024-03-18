<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\City;

class CityService
{
    use ModelHelper;

    public function getAll()
    {
        return City::all();
    }

    public function find($cityId)
    {
        return City::findOrFail($cityId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $city = City::create($validatedData);

        DB::commit();

        return $city;
    }

    public function update($validatedData, $cityId)
    {
        $city = City::findOrFail($cityId);

        DB::beginTransaction();

        $city->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($cityId)
    {
        $city = $this->find($cityId);

        DB::beginTransaction();

        $city->delete();

        DB::commit();

        return true;
    }
}
