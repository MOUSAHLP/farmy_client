<?php

namespace App\Http\Controllers;

use App\Http\Requests\StateRequest;
use App\Http\Resources\StateResource;
use App\Services\StateService;

class StateController extends Controller
{
    public function __construct(private StateService $stateService)
    {
    }

    public function index()
    {
        $states = $this->stateService->getAll();
        return $this->successResponse(
            $this->resource($states, StateResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($stateId)
    {
        $state = $this->stateService->find($stateId);

        return $this->successResponse(
            $this->resource($state, StateResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(StateRequest $request)
    {
        $validatedData = $request->validated();
        $state = $this->stateService->create($validatedData);

        return $this->successResponse(
            $this->resource($state, StateResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(StateRequest $request, $stateId)
    {
        $validatedData = $request->validated();
        $this->stateService->update($validatedData, $stateId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($stateId)
    {
        $this->stateService->delete($stateId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
