<?php

namespace App\Services;

use App\Helpers\AuthHelper;
use Illuminate\Support\Facades\DB;
use App\Traits\ModelHelper;
use App\Models\UserAddress;
use Illuminate\Support\Facades\Auth;

class UserAddressService
{
    use ModelHelper;

    public function getAll()
    {
        if (request()->has('user_id'))
            return UserAddress::orderBy('is_favourite','desc')->where('user_id', request('user_id'))->get();
        return UserAddress::orderBy('is_favourite','desc')->where('user_id',  AuthHelper::userAuth()->id)->get();
    }

    public function find($user_addressId)
    {
        return  UserAddress::findOrfail($user_addressId);
    }

    public function create($validatedData)
    {
        DB::beginTransaction();
        $validatedData['user_id'] = Auth::user()->id;
        $user_address = UserAddress::create($validatedData);

        DB::commit();

        return $user_address;
    }

    public function update($validatedData, $user_addressId)
    {
        $user_address = UserAddress::findOrFail($user_addressId);

        DB::beginTransaction();

        $user_address->update($validatedData);

        DB::commit();

        return true;
    }

    public function delete($user_addressId)
    {
        $user_address = $this->find($user_addressId);

        DB::beginTransaction();

        $user_address->delete();

        DB::commit();

        return true;
    }
    public function setAddressAsFavourite($user_addressId)
    {
        $user = Auth::user();

        $user_address = $this->find($user_addressId);

        DB::beginTransaction();

        $user_address->update([
            'is_favourite' => 1,
        ]);

        DB::commit();

        return true;
    }
}
