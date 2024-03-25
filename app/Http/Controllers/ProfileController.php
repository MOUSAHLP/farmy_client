<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserAuthRequest;
use App\Http\Requests\UserRequest;
use App\Http\Resources\UserResource;
use App\Services\UserAuthService;
use App\Services\UserService;

class ProfileController extends Controller
{
    public function __construct(private UserService $userService)
    {
    }

    public function getProfile()
    {
        $userId = auth('user')->user()->id;
        $user = $this->userService->find($userId);
        return $this->successResponse(
            $this->resource($user, UserResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function updateProfile(UserRequest $request)
    {
        $userId = auth('user')->user()->id;
        $validatedData = $request->validated();
        $user = $this->userService->update($validatedData, $userId);

        return $this->successResponse(
            [
                'user'  => $user,
            ],
            'dataDeletedSuccessfully'
        );
    }

    public function deleteAccount(UserRequest $request)
    {
        $user_id = auth('user')->user()->id;

        $this->userService->update(['delete_reason' => $request->delete_reason], $user_id);

        $this->userService->delete($user_id);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }

    public function verifyNewPhone(UserAuthRequest $request)
    {
        $validatedData = $request->validated();

        $verified =  (new UserAuthService)->verifyOTP($validatedData);

        $userId = auth('user')->user()->id;

        if (!$verified) {
            return $this->successResponse(null, 'wrong code');
        }

        $this->userService->update($validatedData, $userId);

        return $this->successResponse(
            null,
            'data verified Successfully'
        );
    }

    public function changePassword(UserAuthRequest $request)
    {
        $validatedData = $request->validated();

        $changed =  (new UserAuthService)->changePassword($validatedData);

        if (!$changed) {
            return $this->successResponse(null, 'some thing went wrong');
        }

        return $this->successResponse(
            null,
            'passwordChangedSuccessfully'
        );
    }
}
