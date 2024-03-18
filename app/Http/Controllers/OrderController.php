<?php

namespace App\Http\Controllers;

use App\Http\Requests\OrderRequest;
use App\Http\Resources\OrderResource;
use App\Services\OrderService;
use App\Services\PaymentProcessService;
class OrderController extends Controller
{
    public function __construct(private OrderService $orderService)
    {
    }

    public function index()
    {
        $orders = $this->orderService->getAllByUser();
        return $this->successResponse(
            $this->resource($orders, OrderResource::class),
            'dataFetchedSuccessfully'
        );
    }
    public function getAllByUser()
    {
        $orders = $this->orderService->getAllByUser();
        return $this->successResponse(
            $this->resource($orders, OrderResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function show($orderId)
    {
        $order = $this->orderService->find($orderId);

        return $this->successResponse(
            $this->resource($order, OrderResource::class),
            'dataFetchedSuccessfully'
        );
    }

    public function store(OrderRequest $request)
    {

        $validatedData = $request->validated();
        $order = $this->orderService->create($validatedData);

        return $this->successResponse(
            $this->resource($order, OrderResource::class),
            'dataAddedSuccessfully'
        );
        // return $order;

    }

    public function update(OrderRequest $request, $orderId)
    {
        $validatedData = $request->validated();
        $this->orderService->update($validatedData, $orderId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function destroy($orderId)
    {
        $this->orderService->delete($orderId);

        return $this->successResponse(
            null,
            'dataDeletedSuccessfully'
        );
    }

    public function updateStatus(OrderRequest $request, $orderId)
    {

        $validatedData = $request->validated();
        $this->orderService->updateStatus($validatedData, $orderId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }
}