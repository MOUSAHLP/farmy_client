<?php

namespace App\Exports;

use App\Http\Resources\OrderResource;
use App\Models\Order;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class OrdersExport implements FromCollection, WithHeadings
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return OrderResource::collection(Order::orderBy("id", "DESC")->get());
    }
    public function headings(): array
    {
        return [
            "id",
            "order number",
            "user name",
            "user phone",
            "driver name",
            "driver phone",
            "status",
            "delivery method",
            "payment method",
            "user address",
            'payment status',
            'coupon discount',
            'tax',
            'delivery fee',
            'sub total',
            'total',
            'notes',
            'changes',
            'rate',
            'pdf url',
            'confirmed at',
            'delivered at'
        ];
    }
}
