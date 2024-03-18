<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\Commission;

class CommissionService
{
    use ModelHelper;

    public function getAll()
    {
        return Commission::all();
    }

    public function find($commissionId)
    {
        return Commission::findOrFail($commissionId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $commission = Commission::create($validatedData);

        DB::commit();

        return $commission;
    }

    public function update($validatedData, $commissionId)
    {
        $commission = Commission::findOrFail($commissionId);

        DB::beginTransaction();

        $commission->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($commissionId)
    {
        $commission = $this->find($commissionId);

        DB::beginTransaction();

        $commission->delete();

        DB::commit();

        return true;
    }
}
