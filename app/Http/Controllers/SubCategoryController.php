<?php

namespace App\Http\Controllers;

use App\Http\Requests\SubCategoryRequest;
use App\Http\Resources\SubCategoryResource;
use App\Services\SubCategoryService;

class SubCategoryController extends Controller
{
    public function __construct(private SubCategoryService $sub_categoryService)
    {
    }

    public function index(SubCategoryRequest $request)
    {
        $sub_categories = $this->sub_categoryService->getAll($request);
        return $this->successResponse(
            $this->resource($sub_categories, SubCategoryResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($sub_categoryId)
    {
        $sub_category = $this->sub_categoryService->find($sub_categoryId);

        return $this->successResponse(
            $this->resource($sub_category, SubCategoryResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(SubCategoryRequest $request)
    {
        $validatedData = $request->validated();
        $sub_category = $this->sub_categoryService->create($validatedData);

        return $this->successResponse(
            $this->resource($sub_category, SubCategoryResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(SubCategoryRequest $request, $sub_categoryId)
    {
        $validatedData = $request->validated();
        $this->sub_categoryService->update($validatedData, $sub_categoryId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($sub_categoryId)
    {
        $this->sub_categoryService->delete($sub_categoryId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
