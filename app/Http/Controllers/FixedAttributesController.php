<?php

namespace App\Http\Controllers;

use App\Http\Requests\FixedAttributeRequest;
use App\Services\FixedAttributesService;

class FixedAttributesController extends Controller
{
    //
    public function __construct(private FixedAttributesService $fixedAttributesService)
    {
    }

    public function updateAttribute(FixedAttributeRequest $request)
    {
        $validatedData = $request->validated();
        $this->fixedAttributesService->updateAttribute($validatedData);
        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }
}
