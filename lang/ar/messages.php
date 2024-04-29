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
  'passwordChangedSuccessfully'    => 'تم تغيير كلمة المرور بنجاح',
  'userSuccessfullyRegistered'     => 'تم تسجيل المستخدم بنجاح',
  'userSuccessfullySignedIn'       => 'تم تسجيل الدخول بنجاح',
  'userSuccessfullySignedOut'      => 'تم تسجيل الخروج بنجاح',
  'newPasswordError'               => 'كلمة المرور الجديدة لا يمكن ان تكون مماثلة للقديمة . يرجى إعادة المحاولة',
  'currentPasswordIncorrect'       => 'كلمة المرور الحالية لا تتطابق مع التي تم ادخالها. يرجى إعادة المحاولة',
  'passwordConfirmationNotMatch'   => 'تأكيد كلمة المرور غير متطابقة. يرجى إعادة المحاولة',
  'credentialsError'               => 'خطأ في الرقم الوطني او كلمة المرور',

  'Unauthorized'                   => 'لا تملك صلاحيات للقيام بهذا الإجراء',
  'Unauthenticated'                => 'الرجاء تسجيل الدخول اولاً',
  "incorrect_password" => "كلمة مرور خاطئة",

  // General msgs
  'dataSendSuccessfully'          => 'تم إرسال البيانات بنجاح',
  'dataAddedSuccessfully'          => 'تمت إضافة البيانات بنجاح',
  'dataUpdatedSuccessfully'        => 'تم تعديل البيانات بنجاح',
  'dataFetchedSuccessfully'        => 'تم جلب البيانات بنجاح',
  'mediaFetchedSuccessfully'       => 'تم جلب الميديا بنجاح',
  'dataDeletedSuccessfully'        => 'تم حذف البيانات بنجاح',

  'objectNotFoundF'                => ':object غير موجودة',
  'objectNotFound'                 => ':object غير موجود',
  'NotFound'                       => 'غير موجود',

  "area" => "المنطقة",
  "street" => "الشارع",
  "building" => "اسم البناء",
  "building_number" => "رقم البناء",
  "floor" => "الطابق",

  //General errors

  'routeNotFound'                  => 'الرابط غير موجود',

  'VerificationCompletedSuccessfully' => 'تم التحقق بنجاح',
  'ThephoneNumberOrEmailAlreadyExists' => 'رقم الهاتف او الأيميل موجود مسبقا',

  //Home Page Dynamic errors
  'not_found' => 'غير موجود',
  'no_products' => 'هذه العنصر ليس لديه منتجات',

  // core assign order to driverd
  'core'  => [
    "assignError"  => 'لا يمكنك اسناد سائق لهذا الطلب',
    "driverInactive"  => 'هذا السائق غير فعال حاليا',
    "assignChangeTitle" => 'تم تعيين طلب مسند اليك لسائق اخر',
    "assignChangeBody"  => 'اذهب لتبويبة طلباتي لرؤية اي طلب تم سحبه منك',

    "orderAlreadyCancelled" => 'الطلب مرفوض بالفعل',
    "cancelOrderTitle" => 'تم رفض طلبك ',
    "reason"  => 'السبب : ',
  ],

  // reward notifications
  'reward_notifications'  => [
    "user_created"  => "لانشائك حساب بتطبيقنا",
    "user_birthday_added"  => "لاضافة تاريخ ميلادك على حسابك",
    "order_rated"  => "لتقييمك طلب",
    "order_created"  => "لانشائك طلب",

  ],
];
