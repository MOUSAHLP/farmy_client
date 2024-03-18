<?php

namespace App\Http\Controllers;

use App\Http\Requests\DriverRequest;
use App\Http\Resources\DriverResource;
use App\Services\DriverService;

class DriverController extends Controller
{
    public function __construct(private DriverService $driverService)
    {
    }

    public function index()
    {
        $drivers = $this->driverService->getAll();
        return $this->successResponse(
            $this->resource($drivers, DriverResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($driverId)
    {
        $driver = $this->driverService->find($driverId);

        return $this->successResponse(
            $this->resource($driver, DriverResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(DriverRequest $request)
    {

        $validatedData = $request->validated();
        $driver = $this->driverService->create($validatedData);

        return $this->successResponse(
            $this->resource($driver, DriverResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(DriverRequest $request, $driverId)
    {
        $validatedData = $request->validated();
        $this->driverService->update($validatedData, $driverId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($driverId)
    {
        $this->driverService->delete($driverId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
