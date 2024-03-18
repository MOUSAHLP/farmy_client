<?php

namespace App\Http\Controllers;

use App\Http\Requests\AttributeRequest;
use App\Http\Resources\AttributeResource;
use App\Services\AttributeService;

class AttributeController extends Controller
{
    public function __construct(private AttributeService $product_attributeService)
    {
    }

    public function index()
    {
        $product_attributes = $this->product_attributeService->getAll();
        return $this->successResponse(
            $this->resource($product_attributes, AttributeResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($product_attributeId)
    {
        $product_attribute = $this->product_attributeService->find($product_attributeId);

        return $this->successResponse(
            $this->resource($product_attribute, AttributeResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(AttributeRequest $request)
    {
        $validatedData = $request->validated();
        $product_attribute = $this->product_attributeService->create($validatedData);

        return $this->successResponse(
            $this->resource($product_attribute, AttributeResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(AttributeRequest $request, $product_attributeId)
    {
        $validatedData = $request->validated();
        $this->product_attributeService->update($validatedData, $product_attributeId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($product_attributeId)
    {
        $this->product_attributeService->delete($product_attributeId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
    public function addValues(AttributeRequest $request, $product_attributeId)
    {
        $validatedData = $request->validated();
        $this->product_attributeService->addValues($validatedData, $product_attributeId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }
}
