<?php

namespace App\Http\Controllers;

use App\Helpers\AuthHelper;
use App\Http\Requests\FavoritRequest;
use App\Http\Resources\ProductResource;
use App\Models\Favorit;
use App\Models\Product;

class FavoritController extends Controller
{
    function addToFavorit(FavoritRequest $request)
    {
        $favorit = Favorit::create([
            'product_id' => $request->product_id,
            'user_id' =>  AuthHelper::userAuth()->id,
        ]);

        return $this->successResponse(
            null,
            'Add To Wish List Successfully'
        );
    }
    function removeFromFavorit(FavoritRequest $request)
    {

        $favorit = Favorit::where('user_id', AuthHelper::userAuth()->id)->where('product_id', $request->product_id)->delete();

        return $this->successResponse(
            null,
            'Remove From Wish List Successfully'
        );
    }
    function getFavorit()
    {
        $user_id = AuthHelper::userAuth()->id;
        if (request()->user_id) {
            $user_id = request()->user_id;
        }
        $favorit = Favorit::with('course')->where('user_id',  $user_id)->pluck('product_id');
        $courses = Product::whereIn('id', $favorit)->get();

        return $this->successResponse(
            $this->resource($courses, ProductResource::class),
            'dataFetchedSuccessfully'
        );
    }
    function getFavoritCount()
    {

        $favorit = Favorit::with('course')->where('user_id',  AuthHelper::userAuth()->id)->pluck('product_id');
        $favoritCount = Product::whereIn('id', $favorit)->count();

        return $this->successResponse(
            $favoritCount,
            'dataFetchedSuccessfully'
        );
    }
}
