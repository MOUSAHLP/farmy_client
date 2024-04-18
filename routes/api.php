<?php

use App\Http\Controllers\RewardController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\AreaController;
use App\Http\Controllers\AttributeController;
use App\Http\Controllers\AttributeValueController;
use App\Http\Controllers\Auth\UserAuthController;
use App\Http\Controllers\BannerController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CityController;
use App\Http\Controllers\CommissionController;
use App\Http\Controllers\ContactUsController;
use App\Http\Controllers\DeliveryAttributeController;
use App\Http\Controllers\DeliveryMethodController;
use App\Http\Controllers\DeliveryTimeInfoController;
use App\Http\Controllers\DriverController;
use App\Http\Controllers\FavoritController;
use App\Http\Controllers\FixedAttributesController;
use App\Http\Controllers\GiftController;
use App\Http\Controllers\HomePageController;
use App\Http\Controllers\JoinOurTeamController;
use App\Http\Controllers\ModelListController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PaymentMethodController;
use App\Http\Controllers\PaymentProcessController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SellerController;
use App\Http\Controllers\StateController;
use App\Http\Controllers\SubCategoryController;
use App\Http\Controllers\UserAddressController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\SettingsController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::group(['middleware' => 'cors'], function () {
    Route::get('/list-models', [ModelListController::class, 'listModels']);

    Route::group(['middleware' => 'auth:user'], function () {
        Route::post('/asign-order-to-driver', [OrderController::class, 'asignOrderToDriver']); // core request
        Route::post('/cancel-order/{id}', [OrderController::class, 'cancelOrder']); // core request
    });


    Route::group([
        'prefix' => '/auth',
    ], function () {

        Route::post('/login', [UserAuthController::class, 'login']);
        Route::post('/generate-otp', [UserAuthController::class, 'generateOTP']);
        Route::post('/verify-otp', [UserAuthController::class, 'verifyOTP']);
        Route::post('/change-password', [UserAuthController::class, 'changePassword']);
        Route::group(['middleware' => 'auth:user'], function () {
            Route::get('/profile-details', [UserAuthController::class, 'getProfileDetails']);
            Route::post('/logout', [UserAuthController::class, 'logout']);
        });
    });

    Route::group(['middleware' => 'auth:user'], function () {
        Route::post('user_addresses', [UserAddressController::class, 'store']);
        Route::post('user_addresses/set-favourite/{id}', [UserAddressController::class, 'setAddressAsFavourite']);
        Route::put('user_addresses/{id}', [UserAddressController::class, 'update']);
        Route::delete('user_addresses/{id}', [UserAddressController::class, 'destroy']);
        Route::apiResource('notifications', NotificationController::class);
        Route::post('payment-process', [PaymentProcessController::class, 'paymentProcess']);
    });

    // Orders
    Route::apiResource('orders', OrderController::class);
    Route::get('/all-orders', [OrderController::class, 'getAllOrders']); // Dashboard
    Route::post('/change-product-status', [OrderController::class, 'changeOrderDetailStatus']);  // Dashboard
    Route::get('export-orders-excel', [OrderController::class, 'exportExcel']); // Dashboard

    Route::group(['middleware' => 'auth:user', 'prefix' => 'orders'], function () {
        Route::post('/update-status/{id}', [OrderController::class, 'updateStatus']);
        Route::post('/update-rate/{id}', [OrderController::class, 'updateRate']);
        Route::get('/order-details/{id}', [OrderController::class, 'show']);
        Route::get('order-status/{id}', [OrderController::class, 'getorderstatus']);
        Route::get('order-rate/{id}', [OrderController::class, 'getOrderRate']);
        Route::get('order-tracking/{id}', [OrderController::class, 'getOrderTrackingUrl']);
    });
    Route::get('order-pdf/{id}', [OrderController::class, 'getOrderPdf']);
    Route::get('order-tracking-base', [OrderController::class, 'getOrderTrackingUrlBase']);

    Route::group(['middleware' => 'auth:user', 'prefix' => 'invoices'], function () {
        Route::get('get_invoices', [OrderController::class, 'getUserAllInvoices']);
    });
    Route::group(['middleware' => 'auth:user'], function () {
        Route::get('get-rates', [OrderController::class, 'getUserRates']);
    });

    Route::apiResource('users', UserController::class);

    Route::apiResource('states', StateController::class);
    Route::apiResource('cities', CityController::class);
    Route::apiResource('areas', AreaController::class);
    Route::apiResource('sellers', SellerController::class);
    Route::apiResource('categories', CategoryController::class);
    Route::apiResource('sub_categories', SubCategoryController::class);
    Route::post('fixed-attributes', [FixedAttributesController::class, 'updateAttribute']);

    //// products
    Route::apiResource('products', ProductController::class);
    Route::post('get-cart-products-info', [ProductController::class, 'getCartProductsInfo']); // for cart المسودة
    Route::get('web-product/{id}', [ProductController::class, 'webShow']);

    //// search
    Route::get('search', [ProductController::class, 'search']);

    //// contact us
    Route::get('contact_us', [ContactUsController::class, 'get_contact_us']);
    Route::post('contact_us', [ContactUsController::class, 'contact_us']);

    //// join our team
    Route::group([
        'prefix' => '/join-our-team',
        'controller' => JoinOurTeamController::class,
    ], function () {
        Route::get('jobs', 'get_jobs');
        Route::put('/', "update");
    });
    Route::resource('join-our-team', JoinOurTeamController::class);

    Route::apiResource('attributes', AttributeController::class);
    Route::post('attributes/{id}/values', [AttributeController::class, 'addValues']);
    Route::apiResource('attribute_values', AttributeValueController::class);
    Route::apiResource('drivers', DriverController::class);
    Route::apiResource('user_addresses', UserAddressController::class)->except(['store', 'update', 'destroy']);
    Route::apiResource('gifts', GiftController::class);
    Route::apiResource('delivery_methods', DeliveryMethodController::class);
    Route::apiResource('payment_methods', PaymentMethodController::class);
    Route::apiResource('delivery_attributes', DeliveryAttributeController::class);
    Route::apiResource('banners', BannerController::class);
    Route::apiResource('related_products', ProductController::class);
    Route::apiResource('roles', RoleController::class);
    Route::get('permissions', [RoleController::class, 'getAllPermissions']);

    //// home page
    Route::get('home-page', [HomePageController::class, 'homePage']); // old
    Route::get('home-page-dynamic', [HomePageController::class, 'index']);
    Route::get('home-page-dynamic/{id}', [HomePageController::class, 'show']);
    Route::post('home-page-dynamic/create', [HomePageController::class, 'store']);
    Route::put('home-page-dynamic/edit', [HomePageController::class, 'update']);
    Route::delete('home-page-dynamic/delete', [HomePageController::class, 'destroy']);


    Route::apiResource('commissions', CommissionController::class);
    Route::get('profile', [ProfileController::class, 'getProfile']);
    Route::post('update_profile', [ProfileController::class, 'updateProfile']);
    Route::post('delete_account', [ProfileController::class, 'deleteAccount']);
    Route::post('verify_new_phone', [ProfileController::class, 'verifyNewPhone']);
    Route::post('change_password', [ProfileController::class, 'changePassword']);

    Route::get('getFavoritCount', [FavoritController::class, 'getFavoritCount']);
    Route::get('getFavorit', [FavoritController::class, 'getFavorit']);
    Route::post('addToFavorit', [FavoritController::class, 'addToFavorit']);
    Route::post('removeFromFavorit', [FavoritController::class, 'removeFromFavorit']);

    Route::get('settings', [SettingsController::class, 'settings']);
    Route::get('policy', [SettingsController::class, 'privacyAndPolicy']);
    Route::get('conditions', [SettingsController::class, 'conditionsAndRules']);
    Route::get('faq_questions', [SettingsController::class, 'faqQuestions']);
    Route::get('who_we_are', [SettingsController::class, 'whoWeAre']);
    Route::get('use_terms', [SettingsController::class, 'useTerms']);
    Route::get('about_the_app', [SettingsController::class, 'aboutTheApp']);


    Route::group([
        'prefix' => '/related_products',
        'controller' => ProductController::class,
    ], function () {
        Route::delete('/delete_related', 'deleteRelatedProducts');
        Route::get('/{id}', 'relatedProducts');
        Route::post('/related_products', 'addRelatedProducts');
    });

    // Reward System
    Route::group([
        'middleware' => 'auth:user',
        'prefix' => 'reward',
        'controller' => RewardController::class,
    ], function () {
        Route::get('/user-statistics', 'userStatistics');
        Route::get('/purchases', 'userPurchases');
        // Achievements
        Route::group([
            'prefix' => "achievements",
        ], function () {
            Route::get('/not-done', 'UserAchievements');
        });
        // Coupons
        Route::group([
            'prefix' => "coupons",
        ], function () {
            Route::get('/', 'coupons');
            Route::get('/fixed-value', 'fixedValueCoupons');
            Route::get('/offers', 'offersCoupons');
            Route::post('/buy', 'BuyCoupon');
        });
        // Points
        Route::group([
            'prefix' => "points",
        ], function () {
            Route::get('/valid', 'userValidPoints');
            Route::get('/used', 'userUsedPoints');
            Route::get('/expired', 'userExpiredPoints');
        });
        // Guides
        Route::group([
            'prefix' => "guide",
        ], function () {
            Route::get('/rewards', 'rewardsGuide');
            Route::get('/memberships', 'membershipsGuide');
        });
    });
});
Route::apiResource('delivery_time_infos', DeliveryTimeInfoController::class);
Route::post('send-notification', [NotificationController::class, 'sendPushNotification']);
