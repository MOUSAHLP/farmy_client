<?php

namespace App\Http\Controllers;

use App\Http\Requests\SellerRequest;
use App\Http\Resources\SellerResource;
use App\Services\SellerService;

class SellerController extends Controller
{
    public function __construct(private SellerService $sellerService)
    {
    }

    public function index()
    {
        $sellers = $this->sellerService->getAll();
        return $this->successResponse(
            $this->resource($sellers, SellerResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($sellerId)
    {
        $seller = $this->sellerService->find($sellerId);

        return $this->successResponse(
            $this->resource($seller, SellerResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(SellerRequest $request)
    {
        $validatedData = $request->validated();
        $seller = $this->sellerService->create($validatedData);

        return $this->successResponse(
            $this->resource($seller, SellerResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(SellerRequest $request, $sellerId)
    {
        $validatedData = $request->validated();
        $this->sellerService->update($validatedData, $sellerId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($sellerId)
    {
        $this->sellerService->delete($sellerId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
