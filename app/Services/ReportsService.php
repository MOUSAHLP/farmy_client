<?php

namespace App\Services;

use App\Enums\OrderStatus;
use App\Enums\RewardRoutes;
use App\Models\Category;
use App\Models\Driver;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\Seller;
use App\Models\User;
use App\Traits\ModelHelper;
use App\Traits\RewardRequests;
use Carbon\Carbon;

class ReportsService
{
    use ModelHelper, RewardRequests;

    public function getStatistics()
    {
        $data["orders_num"]     = Order::count();
        $data["products_num"]   = Product::count();
        $data["users_num"]      = User::count();
        $data["drivers_num"]    = Driver::count();
        $data["categories_num"] = Category::count();
        $data["sellers_num"]    = Seller::count();
        $data["purchased_coupons_num"] =  $this->rewardGetRequest(RewardRoutes::report_purchased_coupons)->data->value;
        $data["compensation_coupons_num"] =  $this->rewardGetRequest(RewardRoutes::report_compensation_coupons)->data->value;
        $data["periodic_coupons_num"] =  $this->rewardGetRequest(RewardRoutes::report_periodic_coupons)->data->value;

        return $data;
    }

    public function getCategoriesReport()
    {
        $data["categories"]  = Category::with(["subcategories", "subcategories.products"])
            ->get()->select(["id", "name", "subcategories"])
            ->map(function ($model) {
                $model["count"] = 0;
                foreach ($model["subcategories"] as $subcategory) {
                    foreach ($subcategory["products"] as $product) {
                        $count = OrderDetail::where("product_id", $product["id"]);

                        if (request()->has("month")) {
                            $count->whereMonth('created_at', request()->month);
                        }
                        if (request()->has("from_date") && request()->has("to_date")) {
                            $count->whereDate('created_at', ">=", request()->from_date);
                            $count->whereDate('created_at', "<=", request()->to_date);
                        }
                        $model["count"] += $count->count();
                    }
                }
                unset($model["subcategories"]);
                return $model;
            });

        // $data["month"] = Carbon::now()->monthName;

        return  $data["categories"];
    }

    public function getOrdersReport()
    {
        $data = Order::all()
            ->groupBy('status')
            ->map(function ($model, $key) {
                return [
                    "value" => $model->count(),
                    "label" => OrderStatus::getName(intval($key)),
                ];
            })->values();
        return $data;
    }

    public function getEarningsReport()
    {
        return OrderDetail::all()
            ->groupBy('product_id')
            ->map(function ($model, $key) {

                $product = Product::find($key);

                $earnings = 0;
                foreach($model as $m){
                    $earnings+=($m->price - $product->real_price) * $m->quantity ;
                }
                return [
                    "value" => $earnings,
                    "label" =>$product->name,
                ];
            })->values();
    }
    
    public function getUsedPointsReport()
    {
        return $this->rewardGetRequest(RewardRoutes::used_points_report."?year=". request()->year)->data;
    }

    public function getCouponsReport()
    {
        return $this->rewardGetRequest(RewardRoutes::report_coupons)->data;
    }

    public function getDriversReport()
    {
        $data = Driver::all()
            ->map(function ($model, $key) {
                return [
                    "value" => Order::where("driver_id", $model->id)->count(),
                    "label" => $model->first_name . " " . $model->last_name,
                ];
            })->values();
        return $data;
    }
}
