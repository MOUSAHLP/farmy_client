<?php

namespace App\Http\Controllers;

use App\Http\Requests\RoleRequest;
use App\Http\Resources\RoleResource;
use App\Services\RoleService;

class RoleController extends Controller
{
    public function __construct(private RoleService $roleService)
    {
    }

    public function index(RoleRequest $request)
    {
        $roles = $this->roleService->getAll();
        return $this->successResponse(
            $this->resource($roles, RoleResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($roleId)
    {
        $role = $this->roleService->find($roleId);

        return $this->successResponse(
            $this->resource($role, RoleResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(RoleRequest $request)
    {
        $validatedData = $request->validated();
        $role = $this->roleService->create($validatedData);

        return $this->successResponse(
            $this->resource($role, RoleResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(RoleRequest $request, $roleId)
    {
        $validatedData = $request->validated();
        $this->roleService->update($validatedData, $roleId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($roleId)
    {
        $this->roleService->delete($roleId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
    public function getAllPermissions()
    {
        $permissions = $this->roleService->getAllPermissions();
        return $permissions;
    }
}
