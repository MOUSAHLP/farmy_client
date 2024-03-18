<?php

namespace App\Services;

use App\Enums\MediaCollectionsNames;
use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Banner;
use App\Traits\UploadImageTrait;

class BannerService
{
    use ModelHelper , UploadImageTrait;

    public function getAll()
    {
        return Banner::all();
    }

    public function find($bannerId)
    {
        return Banner::findOrFail($bannerId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $banner = Banner::create($validatedData);
        $this->uploadImage($banner,$validatedData['image'],MediaCollectionsNames::BannerImage);

        DB::commit();

        return $banner;
    }

    public function update($validatedData, $bannerId)
    {
        $banner = Banner::findOrFail($bannerId);

        DB::beginTransaction();

        $banner->update($validatedData);
        if(array_key_exists('image',$validatedData))
            $this->uploadImage($banner,$validatedData['image'],MediaCollectionsNames::BannerImage);


        DB::commit();

        return true;
    }

    public function delete($bannerId)
    {
        $banner = $this->find($bannerId);

        DB::beginTransaction();

        $banner->delete();

        DB::commit();

        return true;
    }
}
