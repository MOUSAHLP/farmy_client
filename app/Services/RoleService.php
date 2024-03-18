<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleService
{
    use ModelHelper;

    public function getAll()
    {
        return Role::all();
    }
    public function getAllPermissions()
    {
        $permissions = Permission::all();

        $groupedPermissions = $permissions->groupBy(function ($permission) {
            // Split the permission name by '.' and get the first part (group name)
            $parts = explode('.', $permission->name);
            return $parts[0];
        })->map(function ($group) {
            // Convert the grouped permissions to the desired format
            return $group->map(function ($permission) {
                return [
                    'id' => $permission->id,
                    'name' => $permission->name,
                ];
            });
        });
        return $groupedPermissions;
    }

    public function find($roleId)
    {
        return $this->findByIdOrFail(Role::class,'role', $roleId);
    }

    public function create($validatedData)
    {

        DB::beginTransaction();

        $role = Role::create(['name'=>$validatedData['name'] , 'guard_name'=>'user']);
        $permissions = Permission::whereIn('id',$validatedData['permissions'])->get();
        $role->syncPermissions($permissions);

        DB::commit();

        return $role;
    }

    public function update($validatedData, $roleId)
    {
        $role = $this->find($roleId);

        DB::beginTransaction();

        $role->update($validatedData);
        $permissions = Permission::whereIn('id',$validatedData['permissions'])->get();
        $role->syncPermissions($permissions);

        DB::commit();

        return true;
    }

    public function delete($roleId)
    {
        $role = $this->find($roleId);

        DB::beginTransaction();

        $role->delete();

        DB::commit();

        return true;
    }
}
