<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\State;

class StateService
{
    use ModelHelper;

    public function getAll()
    {
        return State::all();
    }

    public function find($stateId)
    {
        return State::with('cities')->findOrFail($stateId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $state = State::create($validatedData);

        DB::commit();

        return $state;
    }

    public function update($validatedData, $stateId)
    {
        $state = State::findOrFail($stateId);

        DB::beginTransaction();

        $state->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($stateId)
    {
        $state = $this->find($stateId);

        DB::beginTransaction();

        $state->delete();

        DB::commit();

        return true;
    }
}
