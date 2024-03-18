<?php

namespace App\Http\Controllers;

use App\Http\Requests\PaymentProcessRequest;
use App\Services\PaymentProcessService;
use GuzzleHttp\Psr7\Request;

class PaymentProcessController extends Controller
{
    public function __construct(private PaymentProcessService $paymentProcessService)
    {
    }
    public function paymentProcess(PaymentProcessRequest $request)
    {
        $data = $this->paymentProcessService->paymentProcess($request);

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
        
    }


}
