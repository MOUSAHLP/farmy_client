<?php

namespace App\Services;

use App\Enums\OrderStatus;
use App\Models\Category;
use App\Models\Driver;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\Seller;
use App\Models\User;
use App\Traits\ModelHelper;
use Carbon\Carbon;

class ReportsService
{
    use ModelHelper;
    public function getStatistics()
    {
        $data["orders_num"]     = Order::count();
        $data["products_num"]   = Product::count();
        $data["users_num"]      = User::count();
        $data["drivers_num"]    = Driver::count();
        $data["categories_num"] = Category::count();
        $data["sellers_num"]    = Seller::count();

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
                        $model["count"] += $count->count();
                    }
                }
                unset($model["subcategories"]);
                return $model;
            });

        $data["month"] = Carbon::now()->monthName;

        return $data;
    }

    public function getOrdersReport()
    {
        $data = Order::all()
            ->groupBy('status')
            ->map(function ($model, $key) {
                return [
                    "value" => $model->count(),
                    "label" => OrderStatus::getName(intval($key)) ,
                ];
            })->values();
        return $data;
    }
}
