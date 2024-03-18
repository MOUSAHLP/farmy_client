<?php

namespace App\Http\Controllers;

use App\Http\Requests\GiftRequest;
use App\Http\Resources\GiftResource;
use App\Services\GiftService;

class GiftController extends Controller
{
    public function __construct(private GiftService $giftService)
    {
    }

    public function index()
    {
        $gifts = $this->giftService->getAll();
        return $this->successResponse(
            $this->resource($gifts, GiftResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($giftId)
    {
        $gift = $this->giftService->find($giftId);

        return $this->successResponse(
            $this->resource($gift, GiftResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(GiftRequest $request)
    {
        $validatedData = $request->validated();
        $gift = $this->giftService->create($validatedData);

        return $this->successResponse(
            $this->resource($gift, GiftResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(GiftRequest $request, $giftId)
    {
        $validatedData = $request->validated();
        $this->giftService->update($validatedData, $giftId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($giftId)
    {
        $this->giftService->delete($giftId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
