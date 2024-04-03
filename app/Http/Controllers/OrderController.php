<?php

namespace App\Http\Controllers;

use App\Http\Requests\OrderRequest;
use App\Http\Resources\OrderResource;
use App\Services\DriverService;
use App\Services\OrderService;
use App\Services\PaymentProcessService;
use Barryvdh\DomPDF\Facade\Pdf;

class OrderController extends Controller
{
    public function __construct(private OrderService $orderService, private DriverService $driverService)
    {
    }

    public function getAllOrders()
    {
        $orders = $this->orderService->getAll();
        return $this->successResponse(
            $this->resource($orders, OrderResource::class),
            'dataFetchedSuccessfully'
        );
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

    public function getUserAllInvoices()
    {
        $orders = $this->orderService->getUserAllInvoices();
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
        if (isset($order["error"])) {
            return $this->errorResponse($order["message"], 400);
        }
        return $this->successResponse(
            $this->resource($order, OrderResource::class),
            'dataAddedSuccessfully'
        );
    }

    public function update(OrderRequest $request, $orderId)
    {
        $validatedData = $request->validated();
        $this->orderService->update($validatedData, intVal($orderId));

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

    public function updateRate(OrderRequest $request, $orderId)
    {

        $validatedData = $request->validated();
        $this->orderService->updateRate($validatedData, $orderId);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }


    public function getorderstatus($orderId)
    {
        $order = $this->orderService->find($orderId);
        $data = [];
        $data["order_status"] = $order->status;
        if ($order->driver_id != null) {
            $data["driver_phone"] = $this->driverService->find($order->driver_id)->phone;
        }
        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }

    public function getOrderRate($orderId)
    {
        $order = $this->orderService->find($orderId);
        $data = [];
        $data["rate"] = $order->rate;

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }

    public function getUserRates()
    {
        $ordersRate = $this->orderService->getUserRates();

        return $this->successResponse(
            $ordersRate,
            'dataFetchedSuccessfully'
        );
    }
    public function getOrderPdf($orderId)
    {
        // $orders = Order::where('driver_id', $driver_id)->orderBy('created_at', "desc")->select('order_number', 'created_at', 'total')->get()->toArray();

        // $pdf = Pdf::loadView('who_we_are');

        $pdf = Pdf::loadView('rewards_guide');

        return $pdf->download('invoice.pdf');
    }
}
