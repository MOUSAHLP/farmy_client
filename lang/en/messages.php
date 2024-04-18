<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Messages Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines are used for various
    | messages that we need to display to the user. You are free to modify
    | these language lines according to your application's requirements.
    |
    */

    //Auth msgs
    'passwordChangedSuccessfully'    => 'Password changed successfully !',
    'userSuccessfullyRegistered'     => 'User successfully registered',
    'userSuccessfullySignedIn'       => 'User successfully signed in',
    'userSuccessfullySignedOut'      => 'User successfully signed out',
    'newPasswordError'               => 'New Password cannot be same as your current password. Please choose a different password.',
    'currentPasswordIncorrect'       => 'Your current password does not matches with the password you provided. Please try again.',
    'passwordConfirmationNotMatch'   => 'The Password confirmation does not match.',
    'credentialsError'               => 'Wrong ID or password',

    'Unauthorized'                   => 'You do not have permissions to perform this action',
    'Unauthenticated'                => 'PLease login first',
    "incorrect_password" => "incorrect password",


    // General msgs
    'dataSendSuccessfully'          => 'Data Sended Successfully',
    'dataAddedSuccessfully'          => 'Data added successfully',
    'dataUpdatedSuccessfully'        => 'Data updated successfully',
    'dataFetchedSuccessfully'        => 'Data fetched successfully',
    'mediaFetchedSuccessfully'       => 'Media fetched successfully',
    'dataDeletedSuccessfully'        => 'Data deleted successfully',

    'objectNotFoundF'                => ':object Not Found',
    'objectNotFound'                 => ':object Not Found',
    'NotFound'                       => 'Not Found',


    //General errors

    'routeNotFound'                  => 'Route not found',
    'VerificationCompletedSuccessfully' => 'Verification completed successfully',
    'ThephoneNumberOrEmailAlreadyExists' => 'Phone number or the email already exists',

    //Home Page Dynamic errors
    'not_found' => 'Not Found',
    'no_products' => 'This Record Has No Products',


    // core asign order to driverd
    'core'  => [
        "assignError"  => 'Can Not Asign Driver To This Order',
        "assignChangeTitle" => 'your order has been assigned to another driver',
        "assignChangeBody"  => 'go to my orders tab to check which order',

        "orderAlreadyCancelled" => 'order already cancelled',
        "cancelOrderTitle" => 'your order has been canceled',
        "reason"  => 'reason : ',

    ],
    // reward notifications
    'reward_notifications'  => [
        "user_created"  => "for signing up in our app",
        "user_birthday_added"  => "for adding your birthday in your account",
        "order_rated"  => "for rating an order",
        "order_created"  => "for creating an order",

    ],

];
