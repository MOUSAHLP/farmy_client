<?php

namespace App\Services;

use App\Enums\MediaCollectionsNames;
use App\Http\Resources\ProductResource;
use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Product;
use App\Models\RelatedProduct;
use App\Traits\UploadImageTrait;
use Illuminate\Support\Str;

class ProductService
{
    use ModelHelper, UploadImageTrait;

    public function getAll($request)
    {
        $product = Product::with('subCategory', 'commission', 'relatedProducts','attributes')

            // get the product by subcategory_id
            ->when($request->subCategoryId != null, function ($query) use ($request) {
                return $query->where('subcategory_id', $request->subCategoryId);
            })
            ->when($request->search != null, function ($query) use ($request) {
                $query->where(function ($query) use ($request) {
                    $query->where('name', 'like', '%' . $request->search . '%')
                        ->orWhereHas('subCategory', function ($subQuery) use ($request) {
                            $subQuery->where('name', 'like', '%' . $request->search . '%');
                        });
                });
            })
            ->get();

        return $product;
    }
    public function suggestedProducts()
    {
        $product = Product::where('suggested', 1)->get();

        return $product;
    }
    public function discountedProduct()
    {
        $product = Product::where('discount', '>', 0)->get();

        return $product;
    }

    public function find($productId)
    {
        return Product::with(['subCategory', 'commission', 'relatedProducts'])->findOrFail($productId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $product = Product::create($validatedData);

        if (array_key_exists('image', $validatedData)) {
            $this->uploadImage($product, $validatedData['image'], MediaCollectionsNames::ProductImage);
        }
        foreach ($validatedData['attributes'] as $attribute) {
            $product->attributes()
                ->attach($attribute['id'], ['value' => $attribute['value']]);
        }


        DB::commit();

        return $product;
    }

    public function update($validatedData, $productId)
    {
        $product = Product::findOrFail($productId);

        DB::beginTransaction();

        // $validatedData['slug'] = Str::slug($validatedData['name']);
        if (array_key_exists('image', $validatedData)) {
            $this->uploadImage($product, $validatedData['image'], MediaCollectionsNames::ProductImage);
        }
        $product->attributes()->detach();
        foreach ($validatedData['attributes'] as $attribute) {
            $product->attributes()
                ->attach($attribute['id'], ['value' => $attribute['value']]);
        }
        $product->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($productId)
    {
        $product = $this->find($productId);

        DB::beginTransaction();

        $product->delete();

        DB::commit();

        return true;
    }
    public function relatedProducts($productId)
    {
        return Product::with('relatedProducts')->findOrFail($productId);
    }
    public function getAllProductsAndRelated()
    {
        $products = Product::with('relatedProducts')->get();
        return  $products->map(function ($product) {
            return new ProductResource($product);
        });
    }
    public function addRelatedProducts($validatedData)
    {
        $productIds  = $validatedData['products'];
        $relatedProductIds   = $validatedData['related_products'];

        foreach ($productIds as $productId) {
            $product = Product::find($productId);

            if ($product) {
                foreach ($relatedProductIds as $relatedProductId) {
                    // Check if the relationship already exists
                    $existingRelationship = $product->relatedProducts()
                        ->where('related_product_id', $relatedProductId)
                        ->exists();

                    if (!$existingRelationship) {
                        // Attach related products to the current product
                        $product->relatedProducts()->attach($relatedProductId);

                        // For bidirectional relationship, also attach the current product to related products
                        $relatedProduct = Product::find($relatedProductId);

                        if ($relatedProduct) {
                            $relatedProduct->relatedProducts()->attach($productId);
                        }
                    }
                }
            }
        }
        return true;
    }
    public function deleteRelatedProducts($validatedData)
    {
        DB::beginTransaction();
        $relation = RelatedProduct::find($validatedData['relation_id']);
        $relation->delete();
        DB::commit();
        return true;
    }
}
