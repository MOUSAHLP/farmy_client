<?php

namespace App\Http\Controllers;

use App\Http\Requests\DeliveryMethodRequest;
use App\Http\Resources\DeliveryMethodResource;
use App\Services\DeliveryMethodService;

class DeliveryMethodController extends Controller
{
    public function __construct(private DeliveryMethodService $delivery_methodService)
    {
    }

    public function index()
    {
        $delivery_methods = $this->delivery_methodService->getAll();
        return $this->successResponse(
            $this->resource($delivery_methods, DeliveryMethodResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($delivery_methodId)
    {
        $delivery_method = $this->delivery_methodService->find($delivery_methodId);

        return $this->successResponse(
            $this->resource($delivery_method, DeliveryMethodResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(DeliveryMethodRequest $request)
    {
        $validatedData = $request->validated();
        $delivery_method = $this->delivery_methodService->create($validatedData);

        return $this->successResponse(
            $this->resource($delivery_method, DeliveryMethodResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(DeliveryMethodRequest $request, $delivery_methodId)
    {
        $validatedData = $request->validated();
        $this->delivery_methodService->update($validatedData, $delivery_methodId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($delivery_methodId)
    {
        $this->delivery_methodService->delete($delivery_methodId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
