<?php

namespace App\Http\Controllers;

use App\Enums\NotificationsTypes;
use App\Enums\OrderRateAttributeEnums;
use App\Enums\OrderStatus;
use App\Exports\OrdersExport;
use App\Helpers\AuthHelper;
use App\Http\Requests\OrderDetailsRequest;
use App\Http\Requests\OrderRequest;
use App\Http\Resources\OrderResource;
use App\Models\Driver;
use App\Models\Notification;
use App\Models\Setting;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Services\DriverService;
use App\Services\OrderService;
use App\Services\UserService;
use App\Traits\NotificationHelper;
use Carbon\Carbon;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function __construct(
        private OrderService $orderService,
        private DriverService $driverService,
        private UserService $userService,
    ) {
    }

    // for dashboard
    public function getAllOrders()
    {
        $orders = $this->orderService->getAll();
        $orders->data =   OrderResource::collection($orders)->response()->getData(true);
        return $this->successResponse(
            $orders,
            // $this->resource($orders->data->data, OrderResource::class),
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
        $userId = AuthHelper::userAuth()->id;
        $user = $this->userService->find($userId);

        $orders =  $user->orders()->orderBy('id', 'desc')
            ->where("status", OrderStatus::Pending)
            ->orWhere("status", OrderStatus::Confirmed)
            ->orWhere("status", OrderStatus::OnDelivery)
            ->orWhere("status", OrderStatus::Returned)
            ->get();

        return $this->successResponse(
            $this->resource($orders, OrderResource::class),
            'dataFetchedSuccessfully'
        );
    }
     public function checkCodeExists($id)
    {

        $code = $request->input('code');
       
        $order = Order::where('code', $code)->first();

      
        if ($order) {
        
         return $this->respondWithSuccess( $order,"Code is True");
        } else {
         
         return $this->respondWithError($order, "Code is False");
        }

    }
     public function displyCodeExists($id)
    {

       
        $code = Order::where('id', $id)->pluck('code')->first();

            return response()->json( $code);

        
    }
    public function getHistoryOrders()
    {
        $userId = AuthHelper::userAuth()->id;
        $user = $this->userService->find($userId);

        $orders =  $user->orders()->orderBy('id', 'desc')
            ->where("status", OrderStatus::Deliverd)
            ->orWhere("status", OrderStatus::Cancelled)
            ->get();
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
        if (Order::find($orderId) == null) {
            return $this->errorResponse(
                'NotFound',
                400
            );
        }
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

        if ($order == null) {
            return $this->errorResponse(
                'NotFound',
                400
            );
        }
        $data = [];
        $data["expected_time"] =  $order->deliveryMethod->time;
        $data["order_status"] = $order->status;
        if ($order->driver_id != null) {
            $data["driver_phone"] = $this->driverService->find($order->driver_id)->phone;
        }
        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }

    public function getOrderRateAttributes()
    {
        $data = OrderRateAttributeEnums::getAllValues();

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
        if (Order::find($orderId) == null) {
            return $this->errorResponse(
                'NotFound',
                400
            );
        }
        $trackingUrl = env("TRACKING_URL") . "?order_id=" . $orderId;

        return $this->successResponse(
            $trackingUrl,
            'dataFetchedSuccessfully'
        );
    }
    public function getOrderTrackingUrlBase()
    {
        return $this->successResponse(
            env("TRACKING_URL"),
            'dataFetchedSuccessfully'
        );
    }
    public function getOrderPdf($orderId)
    {
        $data['order'] = $this->orderService->find($orderId);
        $data['contact_us_phone'] = Setting::first()->phone;
        $data['filename'] = $data['order']->user->first_name . "_" . $data['order']->user->last_name . "_" . Carbon::now()->format("Y_m_d_h_i_s");

        return view('order_invoice', $data);
    }

    public function asignOrderToDriver(OrderRequest $request)
    {
        $order = Order::find($request->order_id);
        // if the order in not in pending you cant assign
        if ($order->status != OrderStatus::Pending) {
            return $this->errorResponse(
                'core.assignError',
                400
            );
        }

        // check if the deiver is not in service
        $driver_status = Driver::find($request->driver_id)->online_status;
        if (!$driver_status) {
            return $this->errorResponse(
                'core.driverInactive',
                400
            );
        }
        // if the order has already been taken by another driver then notify him that the order is no longer assigned to him
        if ($order->driver_id != null && $order->driver_id !=  $request->driver_id) {
            $old_driver = Driver::find($order->driver_id);
            $data = [
                "title" => __("messages.core.assignChangeTitle"),
                "body" => __("messages.core.assignChangeBody"),
            ];
            NotificationHelper::sendPushNotification([$old_driver->fcm_token], $data, NotificationsTypes::PushNotifications);
            Notification::create([
                'type'            =>  NotificationsTypes::PushNotifications,
                'notifiable_type' => 'App\Models\Driver',
                'notifiable_id'   => $order->driver_id,
                'data'            => $data,
            ]);
        }

        $order->driver_id = $request->driver_id;
        $order->save();

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }
    public function cancelOrder($order_id, OrderRequest $request)
    {
        $order = Order::find($order_id);
        if ($order->status == OrderStatus::Cancelled) {
            return $this->errorResponse(
                'core.orderAlreadyCancelled',
                400
            );
        }
        $order->update([
            "status" =>  OrderStatus::Cancelled,
            "reason_for_cancel" => $request->reason_for_cancel,
        ]);

        return $this->successResponse(
            null,
            'dataUpdatedSuccessfully'
        );
    }

    public function exportExcel()
    {
        return Excel::download(new OrdersExport, 'orders.xlsx');
    }
}
