<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProductRequest;
use App\Http\Resources\ProductResource;
use App\Http\Resources\RelatedProductResource;
use App\Models\Product;
use App\Services\ProductService;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function __construct(private ProductService $productService)
    {
    }

    public function index(ProductRequest $request)
    {
        $products = $this->productService->getAll($request);
        return $this->successResponse(
            $this->resource($products, ProductResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($productId)
    {
        $product = $this->productService->find($productId);

        return $this->successResponse(
            $this->resource($product, ProductResource::class),
            'dataFetchedSuccessfully'
        );
    }
    public function webShow($productId)
    {
        $product = $this->productService->find($productId);

        return $this->successResponse(
            $this->resource($product, ProductResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(ProductRequest $request)
    {
        $validatedData = $request->validated();
        $product = $this->productService->create($validatedData);

        return $this->successResponse(
            $this->resource($product, ProductResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(ProductRequest $request, $productId)
    {
        $validatedData = $request->validated();
        $this->productService->update($validatedData, $productId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($productId)
    {
        $this->productService->delete($productId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
    public function relatedProducts($productId)
    {

        $products = $this->productService->relatedProducts($productId);
        return $this->successResponse(
            RelatedProductResource::make($products),
            'dataFetchedSuccessfully'
        );
    }

    public function addRelatedProducts(ProductRequest $request)
    {
        $validatedData = $request->validated();
        $this->productService->addRelatedProducts($validatedData);
        return $this->successResponse(
            null,
            'dataAddedSuccessfully'
        );
    }
    public function deleteRelatedProducts(ProductRequest $request)
    {

        $validatedData = $request->validated();
        $this->productService->deleteRelatedProducts($validatedData);
        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
    public function getCartProductsInfo(ProductRequest $request)
    {
        $validatedData = $request->validated();
        return $this->successResponse(
            $this->productService->findAllFromArray($validatedData),
            'dataFetchedSuccessfully'
        );
    }
}
