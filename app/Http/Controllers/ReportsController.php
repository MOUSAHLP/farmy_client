<?php

namespace App\Http\Controllers;

use App\Services\ReportsService;

class ReportsController extends Controller
{
    public function __construct(private ReportsService $reportsService)
    {
    }
    public function getStatistics()
    {
        $data = $this->reportsService->getStatistics();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }

    public function getCategoriesReport()
    {
        $data = $this->reportsService->getCategoriesReport();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    
    public function getOrdersReport()
    {
        $data = $this->reportsService->getOrdersReport();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
}