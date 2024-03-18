<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Gift;

class GiftService
{
    use ModelHelper;

    public function getAll()
    {
        return Gift::all();
    }

    public function find($giftId)
    {
        return Gift::findOrFail($giftId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $gift = Gift::create($validatedData);

        DB::commit();

        return $gift;
    }

    public function update($validatedData, $giftId)
    {
        $gift = Gift::findOrFail($giftId);

        DB::beginTransaction();

        $gift->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($giftId)
    {
        $gift = $this->find($giftId);

        DB::beginTransaction();

        $gift->delete();

        DB::commit();

        return true;
    }
}
