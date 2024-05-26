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
    
    public function getEarningsReport()
    {
        $data = $this->reportsService->getEarningsReport();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    public function getUsedPointsReport()
    {
        $data = $this->reportsService->getUsedPointsReport();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    
    public function getCouponsReport()
    {
        $data = $this->reportsService->getCouponsReport();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    public function getDriversReport()
    {
        $data = $this->reportsService->getDriversReport();

        return $this->successResponse(
            $data,
            'dataFetchedSuccessfully'
        );
    }
    
}
