<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Seller;

class SellerService
{
    use ModelHelper;

    public function getAll()
    {
        return Seller::all();
    }

    public function find($sellerId)
    {
        return Seller::findOrFail($sellerId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $seller = Seller::create($validatedData);

        DB::commit();

        return $seller;
    }

    public function update($validatedData, $sellerId)
    {
        $seller = Seller::findOrFail($sellerId);

        DB::beginTransaction();

        $seller->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($sellerId)
    {
        $seller = $this->find($sellerId);

        DB::beginTransaction();

        $seller->delete();

        DB::commit();

        return true;
    }
}
