<?php

namespace App\Http\Controllers;

use App\Http\Requests\AreaRequest;
use App\Http\Resources\AreaResource;
use App\Services\AreaService;

class AreaController extends Controller
{
    public function __construct(private AreaService $areaService)
    {
    }

    public function index()
    {
        $areas = $this->areaService->getAll();
        return $this->successResponse(
            $this->resource($areas, AreaResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($areaId)
    {
        $area = $this->areaService->find($areaId);

        return $this->successResponse(
            $this->resource($area, AreaResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(AreaRequest $request)
    {
        $validatedData = $request->validated();
        $area = $this->areaService->create($validatedData);

        return $this->successResponse(
            $this->resource($area, AreaResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(AreaRequest $request, $areaId)
    {
        $validatedData = $request->validated();
        $this->areaService->update($validatedData, $areaId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($areaId)
    {
        $this->areaService->delete($areaId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
