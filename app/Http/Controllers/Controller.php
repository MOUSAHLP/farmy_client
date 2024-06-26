<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use App\Traits\ApiResponser;
use App\Traits\ResourceHelper;
use App\Traits\RewardRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;
    use ApiResponser,ResourceHelper,RewardRequests;
}
