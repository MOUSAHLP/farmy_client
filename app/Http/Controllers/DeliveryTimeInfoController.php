<?php

namespace App\Http\Controllers;

use App\Http\Requests\DeliveryTimeInfoRequest;
use App\Http\Resources\DeliveryTimeInfoResource;
use App\Services\DeliveryTimeInfoService;

class DeliveryTimeInfoController extends Controller
{
    public function __construct(private DeliveryTimeInfoService $delivery_time_infoService)
    {
    }

    public function index()
    {
        $delivery_time_infos = $this->delivery_time_infoService->getAll();
        return $this->successResponse(
            $this->resource($delivery_time_infos, DeliveryTimeInfoResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($delivery_time_infoId)
    {
        $delivery_time_info = $this->delivery_time_infoService->find($delivery_time_infoId);

        return $this->successResponse(
            $this->resource($delivery_time_info, DeliveryTimeInfoResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(DeliveryTimeInfoRequest $request)
    {
        $validatedData = $request->validated();
        $delivery_time_info = $this->delivery_time_infoService->create($validatedData);

        return $this->successResponse(
            $this->resource($delivery_time_info, DeliveryTimeInfoResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(DeliveryTimeInfoRequest $request, $delivery_time_infoId)
    {
        $validatedData = $request->validated();
        $this->delivery_time_infoService->update($validatedData, $delivery_time_infoId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($delivery_time_infoId)
    {
        $this->delivery_time_infoService->delete($delivery_time_infoId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
