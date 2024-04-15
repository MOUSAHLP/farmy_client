<?php

namespace App\Http\Controllers;

use App\Enums\OrderStatus;
use App\Http\Requests\OrderDetailsRequest;
use App\Http\Requests\OrderRequest;
use App\Http\Resources\OrderResource;
use App\Models\Setting;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Services\DriverService;
use App\Services\OrderService;
use Carbon\Carbon;

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
    public function changeOrderDetailStatus(OrderDetailsRequest $request)
    {
        $orderDetail = OrderDetail::find($request->order_detail_id);

        if (!$orderDetail) {
            return $this->errorResponse(
                "NotFound",
                400
            );
        }

        $orderDetail->status = $request->status;
        $orderDetail->save();

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
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

    public function getOrderTrackingUrl($orderId)
    {
        $trackingUrl =env("TRACKING_URL")."?order_id=".$orderId;

        return $this->successResponse(
            $trackingUrl,
            'dataFetchedSuccessfully'
        );
    }
    public function getOrderPdf($orderId)
    {
        $data['order'] = $this->orderService->find($orderId);
        $data['contact_us_phone'] = Setting::first()->phone;
        $data['filename'] = $data['order']->user->first_name."_". $data['order']->user->last_name ."_". Carbon::now()->format("Y_m_d_h_i_s");

        return view('order_invoice', $data);
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
