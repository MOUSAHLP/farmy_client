<?php

namespace App\Traits;

trait ApiResponser
{
    protected function successResponse($data = null, $message = null, $code = 200, $token = null)
    {
        return response()->json([
            'status' => 'Success',
            'message' =>  __('messages.'.$message),
            'data' => $data,
            'statusCode' => $code
        ], $code, $token ? ['Authorization' => $token] : []);
    }

    protected function errorResponse($message = null, $code = 500, $data = null)
    {
        $error_message = trans()->has('messages.'.$message)?__('messages.'.$message):$message;
        return response()->json([
            'status' => 'Error',
            'message' => $error_message,
            'data' => $data,
            'statusCode' => $code
        ], $code);
    }
    protected function exceptionErrorResponse($message = null, $code = 500, $data = null)
    {
        return response()->json([
            'status' => 'Error',
            'message' => __('exceptions.'.$message),
            'data' => $data,
            'statusCode' => $code
        ], $code);
    }
}
