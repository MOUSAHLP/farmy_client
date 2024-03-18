<?php

namespace App\Services;

use App\Enums\MediaCollectionsNames;
use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Category;
use App\Traits\UploadImageTrait;

class CategoryService
{
    use ModelHelper , UploadImageTrait;

    public function getAll()
    {
        return Category::all();
    }

    public function find($categoryId)
    {
        return Category::with('subcategories')->findOrFail($categoryId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $category = Category::create($validatedData);
        if(array_key_exists('image',$validatedData)){
            $this->uploadImage($category,$validatedData['image'],MediaCollectionsNames::CategoryImage);
        }

        DB::commit();

        return $category;
    }

    public function update($validatedData, $categoryId)
    {
        $category = Category::findOrFail($categoryId);

        DB::beginTransaction();

        $category->update($validatedData);

        if(array_key_exists('image',$validatedData)){
            $this->uploadImage($category,$validatedData['image'],MediaCollectionsNames::CategoryImage);
        }

        DB::commit();

        return true;
    }

    public function delete($categoryId)
    {
        $category = $this->find($categoryId);

        DB::beginTransaction();

        $category->delete();

        DB::commit();

        return true;
    }
}
