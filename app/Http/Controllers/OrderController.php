<?php

namespace App\Http\Controllers;

use App\Enums\OrderStatus;
use App\Http\Requests\OrderRequest;
use App\Http\Resources\OrderResource;
use App\Models\Order;
use App\Services\DriverService;
use App\Services\OrderService;

use PDF;

class OrderController extends Controller
{
    public function __construct(private OrderService $orderService, private DriverService $driverService)
    {
    }

    // for dashboard
    public function getAllOrders()
    {
        $orders = $this->orderService->getAll();
        return $this->successResponse(
            $this->resource($orders, OrderResource::class),
            'dataFetchedSuccessfully'
        );
    }

    // for dashboard
    public function getOrderDetail($orderId)
    {
        $orders = $this->orderService->find($orderId);
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
        $data = [
            'foo' => 'bar'
        ];

        $pdf = PDF::loadView('rewards_guide', $data);

        return $pdf->stream('invoice.pdf');
    }

    public function asignOrderToDriver(OrderRequest $request)
    {

        $order = Order::find($request->order_id);
        if (!$order) {
            return $this->errorResponse(
                'NotFound',
                400
            );
        }

        if ($order->driver_id != null || $order->status != OrderStatus::Pending) {
            return $this->errorResponse(
                'core.asignError',
                400
            );
        }

        $order->driver_id = $request->driver_id;
        $order->save();

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }
}
