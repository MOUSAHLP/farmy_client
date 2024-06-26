<?php

namespace App\Http\Controllers;

use App\Helpers\AuthHelper;
use App\Helpers\PaginationHelper;
use App\Http\Requests\HomePageDynamicRequest;
use App\Http\Resources\HomePageDynamicResource;
use App\Http\Resources\ProductResource;
use App\Models\HomePageDynamic;
use App\Models\HomePageDynamicContent;
use App\Services\HomePageService;
use App\Services\UserService;


class HomePageController extends Controller
{
    public function __construct(private HomePageService $homePageService, private UserService $userService)
    {
    }

    public function homePage()
    {
        $homePage = $this->homePageService->getAll();
        return $this->successResponse(
            $homePage,
            'dataFetchedSuccessfully'
        );
    }

    public function index()
    {
        $homePageDynamic = HomePageDynamic::with(["content"])->orderBy("order")->get();
        if (AuthHelper::userAuth()) {
            $homePageDynamic->push($this->homePageService->getSuggestedProductSection());
            $homePageDynamic = $homePageDynamic->sortBy("order")->values();
            // return ($homePageDynamic);
        }
        $response = PaginationHelper::paginate($homePageDynamic, request()->paginate ?? 3, request()->page, ['path' => request()->url()]);
        return HomePageDynamicResource::collection($response)->response()->getData(true);
    }

    public function show($id)
    {
        if ($id == -1) {
            return $this->getProducts($this->homePageService->getSuggestedProductSection()->content);
        }
        $homePageDynamic = HomePageDynamic::with(["content"])->find($id);

        if (!$homePageDynamic) {
            return $this->errorResponse(
                'not_found',
                404
            );
        }
        if ($homePageDynamic->type != HomePageDynamic::TYPE_PRODUCT) {
            return $this->errorResponse(
                'no_products',
                400
            );
        }
        return $this->getProducts($homePageDynamic->content);
    }

    public function getProducts($contents)
    {
        $getProducts = [];
        foreach ($contents as $content) {
            $getProducts[] =
                ProductResource::make($content["product"])->getAllResource();
        }
        return $getProducts;
    }


    public function store(HomePageDynamicRequest $request)
    {
        HomePageDynamic::orderBy("order")->where("order", ">=", $request->order)->increment("order");
        $homePageDynamic =  HomePageDynamic::create([
            'type' => $request->type,
            'order' => $request->order,
            'title_ar' => $request->title_ar,
            'title_en' => $request->title_en,
        ]);

        foreach ($request->content as $content) {
            $this->homePageService->createHomePageDynamicContent($homePageDynamic, $content);
        }

        return $this->successResponse(
            $this->resource($homePageDynamic, HomePageDynamicResource::class),
            'dataAddedSuccessfully'
        );
    }
    public function showHomePage($id)
    {
        $homePageDynamic = HomePageDynamic::with(["content"])->find($id);

        if (!$homePageDynamic) {
            return $this->errorResponse(
                'not_found',
                404
            );
        }
        return $this->successResponse(
            new HomePageDynamicResource($homePageDynamic),
            'dataFetchedSuccessfully'
        );
    }
    public function update(HomePageDynamicRequest $request)
    {
        $homePageDynamic =  HomePageDynamic::find($request->id);

        $homePageDynamic->type = $request->type ?? $homePageDynamic->type;
        $homePageDynamic->order = $request->order ?? $homePageDynamic->order;
        $homePageDynamic->title_ar = $request->title_ar ?? $homePageDynamic->title_ar;
        $homePageDynamic->title_en = $request->title_en ?? $homePageDynamic->title_en;


        if (isset($request->content)) {
            $homePageDynamic->content()->delete();

            foreach ($request->content as $content) {
                $this->homePageService->createHomePageDynamicContent($homePageDynamic, $content);
            }
        }

        $homePageDynamic->save();

        return $this->successResponse(
            $this->resource($homePageDynamic, HomePageDynamicResource::class),
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($id)
    {
        $homePageDynamic = HomePageDynamic::find($id);

        if (!$homePageDynamic) {
            return $this->errorResponse(
                'not_found',
                404
            );
        }
        HomePageDynamic::destroy($id);
        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }
}
