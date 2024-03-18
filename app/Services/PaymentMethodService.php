<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\PaymentMethod;

class PaymentMethodService
{
    use ModelHelper;

    public function getAll()
    {
        return PaymentMethod::all();
    }

    public function find($payment_methodId)
    {
        return PaymentMethod::findOrFail($payment_methodId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();

        $payment_method = PaymentMethod::create($validatedData);

        DB::commit();

        return $payment_method;
    }

    public function update($validatedData, $payment_methodId)
    {
        $payment_method = PaymentMethod::findOrFail($payment_methodId);

        DB::beginTransaction();

        $payment_method->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($payment_methodId)
    {
        $payment_method = $this->find($payment_methodId);

        DB::beginTransaction();

        $payment_method->delete();

        DB::commit();

        return true;
    }
}
