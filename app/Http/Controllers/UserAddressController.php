<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserAddressRequest;
use App\Http\Resources\UserAddressResource;
use App\Services\UserAddressService;

class UserAddressController extends Controller
{
    public function __construct(private UserAddressService $user_addressService)
    {
    }

    public function index()
    {
        $user_addresses = $this->user_addressService->getAll();
        return $this->successResponse(
            $this->resource($user_addresses, UserAddressResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($user_addressId)
    {
        $user_address = $this->user_addressService->find($user_addressId);

        return $this->successResponse(
            $this->resource($user_address, UserAddressResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(UserAddressRequest $request)
    {
        $validatedData = $request->validated();

        $user_address = $this->user_addressService->create($validatedData);

        return $this->successResponse(
            $this->resource($user_address, UserAddressResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(UserAddressRequest $request, $user_addressId)
    {
        $validatedData = $request->validated();
        $this->user_addressService->update($validatedData, $user_addressId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($user_addressId)
    {
        $this->user_addressService->delete($user_addressId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
    public function setAddressAsFavourite($user_addressId)
    {
        $this->user_addressService->setAddressAsFavourite($user_addressId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }
}
