<?php

namespace App\Http\Controllers;

use App\Http\Requests\CategoryRequest;
use App\Http\Resources\CategoryResource;
use App\Services\CategoryService;

class CategoryController extends Controller
{
    public function __construct(private CategoryService $categoryService)
    {
    }

    public function index()
    {
        $categories = $this->categoryService->getAll();
        return $this->successResponse(
            $this->resource($categories, CategoryResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($categoryId)
    {
        $category = $this->categoryService->find($categoryId);

        return $this->successResponse(
            $this->resource($category, CategoryResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(CategoryRequest $request)
    {
        $validatedData = $request->validated();
        $category = $this->categoryService->create($validatedData);

        return $this->successResponse(
            $this->resource($category, CategoryResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(CategoryRequest $request, $categoryId)
    {
        $validatedData = $request->validated();
        $this->categoryService->update($validatedData, $categoryId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($categoryId)
    {
        $this->categoryService->delete($categoryId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
