<?php

namespace App\Http\Controllers;

use App\Http\Requests\DeliveryAttributeRequest;
use App\Http\Resources\DeliveryAttributeResource;
use App\Services\DeliveryAttributeService;

class DeliveryAttributeController extends Controller
{
    public function __construct(private DeliveryAttributeService $delivery_attributeService)
    {
    }

    public function index()
    {
        $delivery_attributes = $this->delivery_attributeService->getAll();
        return $this->successResponse(
            $this->resource($delivery_attributes, DeliveryAttributeResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($delivery_attributeId)
    {
        $delivery_attribute = $this->delivery_attributeService->find($delivery_attributeId);

        return $this->successResponse(
            $this->resource($delivery_attribute, DeliveryAttributeResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(DeliveryAttributeRequest $request)
    {
        $validatedData = $request->validated();
        $delivery_attribute = $this->delivery_attributeService->create($validatedData);

        return $this->successResponse(
            $this->resource($delivery_attribute, DeliveryAttributeResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(DeliveryAttributeRequest $request, $delivery_attributeId)
    {
        $validatedData = $request->validated();
        $this->delivery_attributeService->update($validatedData, $delivery_attributeId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($delivery_attributeId)
    {
        $this->delivery_attributeService->delete($delivery_attributeId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
