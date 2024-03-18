<?php

namespace App\Http\Controllers;

use App\Http\Requests\PaymentMethodRequest;
use App\Http\Resources\PaymentMethodResource;
use App\Services\PaymentMethodService;

class PaymentMethodController extends Controller
{
    public function __construct(private PaymentMethodService $payment_methodService)
    {
    }

    public function index()
    {
        $payment_methods = $this->payment_methodService->getAll();
        return $this->successResponse(
            $this->resource($payment_methods, PaymentMethodResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($payment_methodId)
    {
        $payment_method = $this->payment_methodService->find($payment_methodId);

        return $this->successResponse(
            $this->resource($payment_method, PaymentMethodResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(PaymentMethodRequest $request)
    {
        $validatedData = $request->validated();
        $payment_method = $this->payment_methodService->create($validatedData);

        return $this->successResponse(
            $this->resource($payment_method, PaymentMethodResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(PaymentMethodRequest $request, $payment_methodId)
    {
        $validatedData = $request->validated();
        $this->payment_methodService->update($validatedData, $payment_methodId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($payment_methodId)
    {
        $this->payment_methodService->delete($payment_methodId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
