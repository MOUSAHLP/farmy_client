<?php

namespace App\Http\Controllers;

use App\Http\Requests\CityRequest;
use App\Http\Resources\CityResource;
use App\Services\CityService;

class CityController extends Controller
{
    public function __construct(private CityService $cityService)
    {
    }

    public function index()
    {
        $cities = $this->cityService->getAll();
        return $this->successResponse(
            $this->resource($cities, CityResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($cityId)
    {
        $city = $this->cityService->find($cityId);

        return $this->successResponse(
            $this->resource($city, CityResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(CityRequest $request)
    {
        $validatedData = $request->validated();
        $city = $this->cityService->create($validatedData);

        return $this->successResponse(
            $this->resource($city, CityResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(CityRequest $request, $cityId)
    {
        $validatedData = $request->validated();
        $this->cityService->update($validatedData, $cityId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($cityId)
    {
        $this->cityService->delete($cityId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
