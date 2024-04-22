<?php

namespace App\Services;

use App\Helpers\AuthHelper;
use App\Http\Resources\BannerResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\ProductResource;
use App\Models\DeliveryTimeInfo;
use App\Models\HomePageDynamic;
use App\Models\HomePageDynamicContent;
use App\Models\Order;
use App\Models\SubCategory;
use App\Traits\ModelHelper;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;

class HomePageService
{
    use ModelHelper;

    public function __construct(private UserService $userService)
    {
    }
    public function getAll()
    {
        $homePage = [];
        $homePage['categories'] = CategoryResource::collection((new CategoryService)->getAll());
        $homePage['Banners'] = BannerResource::collection((new BannerService)->getAll());
        $homePage['suggested-Products'] = ProductResource::collection((new ProductService)->suggestedProducts());
        $homePage['discounted-Products'] = ProductResource::collection((new ProductService)->discountedProduct());
        $homePage['delivery_message'] = $this->checkDeliveryMessageTime();

        if (AuthHelper::userAuth()) {
            $userId = AuthHelper::userAuth()->id;
            $user = $this->userService->find($userId);
            $favAddress = null;
            if (isset($user))
                // $favAddress = $user->addresses()->where('is_favourite',1)->first();
                $homePage['favourite_address'] = $user->addresses()->where('is_favourite', 1)->first();
        }

        return $homePage;
    }
    public function checkDeliveryMessageTime()
    {
        $deliveryTimeInfo = DeliveryTimeInfo::first();
        $currentTime = Carbon::now();
        $startTime = Carbon::createFromTimeString($deliveryTimeInfo->start_time);
        $endTime = Carbon::createFromTimeString($deliveryTimeInfo->end_time);
        if ($currentTime->between($startTime, $endTime)) {
            return $deliveryTimeInfo->before_message . ' من الساعة ' . $deliveryTimeInfo->start_time . ' حتى الساعة ' . $deliveryTimeInfo->end_time . ' ' . $deliveryTimeInfo->after_message;
        }
        return null;
    }
    public function getSuggestedProductSection()
    {
        $homePageDynamic =  new HomePageDynamic([
            'id' => -1,
            'type' => "section",
            'order' => "3",
            'title_ar' => "منتجات مقترحة خصيصا لك",
            'title_en' => "Suggested Product Just For You",
        ]);

        $homePageDynamicContent = [];
        $lastOrders = Order::where("user_id", AuthHelper::userAuth()->id)->latest()->limit(5)->get();
        foreach ($lastOrders as $lastOrder) {
            foreach ($lastOrder->orderDetails as $orderDetail) {
                if ($orderDetail->product != null) {
                    $homePageDynamicContent[] = new HomePageDynamicContent([
                        'home_page_dynamic_id' => "-1",
                        'product_id' => $orderDetail->product->id
                    ]);
                    $homePageDynamicContent[] =
                        new HomePageDynamicContent([
                            'home_page_dynamic_id' => "-1",
                            'product_id' => SubCategory::find($orderDetail->product->subcategory_id)->products->first()->id
                        ]);
                }
            }
        }
        $homePageDynamicContent = array_unique($homePageDynamicContent);
        $homePageDynamicContent = new Collection($homePageDynamicContent);
        $homePageDynamic->content = $homePageDynamicContent->values();
        return $homePageDynamic;
    }
    public function createHomePageDynamicContent($homePageDynamic, $content)
    {
        $create_content = [];
        if ($homePageDynamic->type == HomePageDynamic::TYPE_PRODUCT) {
            $create_content["product_id"] = $content;
        } else if ($homePageDynamic->type == HomePageDynamic::TYPE_CATEGORY) {
            $create_content["category_id"] = $content;
        } else if ($homePageDynamic->type == HomePageDynamic::TYPE_BANNER) {
            $create_content["banner_id"] = $content;
        }
        HomePageDynamicContent::create([
            'home_page_dynamic_id' => $homePageDynamic->id,
            'product_id' => $create_content["product_id"] ?? null,
            'category_id' => $create_content["category_id"] ?? null,
            'banner_id' => $create_content["banner_id"] ?? null,
        ]);
    }
}
