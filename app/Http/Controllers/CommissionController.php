<?php

namespace App\Http\Controllers;

use App\Http\Requests\CommissionRequest;
use App\Http\Resources\CommissionResource;
use App\Services\CommissionService;

class CommissionController extends Controller
{
    public function __construct(private CommissionService $commissionService)
    {
    }

    public function index()
    {
        $commissions = $this->commissionService->getAll();
        return $this->successResponse(
            $this->resource($commissions, CommissionResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($commissionId)
    {
        $commission = $this->commissionService->find($commissionId);

        return $this->successResponse(
            $this->resource($commission, CommissionResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(CommissionRequest $request)
    {
        $validatedData = $request->validated();
        $commission = $this->commissionService->create($validatedData);

        return $this->successResponse(
            $this->resource($commission, CommissionResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(CommissionRequest $request, $commissionId)
    {
        $validatedData = $request->validated();
        $this->commissionService->update($validatedData, $commissionId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($commissionId)
    {
        $this->commissionService->delete($commissionId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
