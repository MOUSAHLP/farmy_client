<?php

namespace App\Services;

use App\Enums\MediaCollectionsNames;
use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\SubCategory;
use App\Traits\UploadImageTrait;

class SubCategoryService
{
    use ModelHelper, UploadImageTrait;

    public function getAll($request)
    {

        $subCategory =  SubCategory::when($request->categoryId != null, function ($query) use ($request) {
            return $query->where('category_id', $request->categoryId);
        })->get();

        return $subCategory;
    }

    public function find($sub_categoryId)
    {
        return SubCategory::with('products')->findOrFail($sub_categoryId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $sub_category = SubCategory::create($validatedData);

        if (array_key_exists('image', $validatedData)) {
            $this->uploadImage($sub_category, $validatedData['image'], MediaCollectionsNames::SubCategoryImage);
        }

        DB::commit();

        return $sub_category;
    }

    public function update($validatedData, $sub_categoryId)
    {
        $sub_category = SubCategory::findOrFail($sub_categoryId);

        DB::beginTransaction();

        $sub_category->update($validatedData);

        if (array_key_exists('image', $validatedData)) {
            $this->uploadImage($sub_category, $validatedData['image'], MediaCollectionsNames::SubCategoryImage);
        }

        DB::commit();

        return true;
    }

    public function delete($sub_categoryId)
    {
        $sub_category = $this->find($sub_categoryId);

        DB::beginTransaction();

        $sub_category->delete();

        DB::commit();

        return true;
    }
}
