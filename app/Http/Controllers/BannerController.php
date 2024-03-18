<?php

namespace App\Http\Controllers;

use App\Http\Requests\BannerRequest;
use App\Http\Resources\BannerResource;
use App\Services\BannerService;

class BannerController extends Controller
{
    public function __construct(private BannerService $bannerService)
    {
    }

    public function index()
    {
        $banners = $this->bannerService->getAll();
        return $this->successResponse(
            $this->resource($banners, BannerResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($bannerId)
    {
        $banner = $this->bannerService->find($bannerId);

        return $this->successResponse(
            $this->resource($banner, BannerResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(BannerRequest $request)
    {
        $validatedData = $request->validated();
        $banner = $this->bannerService->create($validatedData);

        return $this->successResponse(
            $this->resource($banner, BannerResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(BannerRequest $request, $bannerId)
    {
        $validatedData = $request->validated();
        $this->bannerService->update($validatedData, $bannerId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($bannerId)
    {
        $this->bannerService->delete($bannerId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
