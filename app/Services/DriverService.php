<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Driver;

class DriverService
{
    use ModelHelper;

    public function getAll()
    {
        return Driver::all();
    }

    public function find($driverId)
    {
        return Driver::findOrFail($driverId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $driver = Driver::create($validatedData);

        DB::commit();

        return $driver;
    }

    public function update($validatedData, $driverId)
    {
        $driver = Driver::findOrFail($driverId);

        DB::beginTransaction();

        $driver->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($driverId)
    {
        $driver = $this->find($driverId);

        DB::beginTransaction();

        $driver->delete();

        DB::commit();

        return true;
    }
}
