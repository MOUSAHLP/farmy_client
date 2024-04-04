<?php

namespace App\Services;

use App\Enums\OrderStatus;
use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Driver;
use App\Models\Order;

class DriverService
{
    use ModelHelper;

    public function getAll()
    {
        if (request()->has('asign'))
            return Driver::asignable();

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
