<?php

namespace App\Exceptions;

use App\Exceptions\AbstractException;

class EditOrderException extends AbstractException
{
    //

    public function message()
    {
        return __('EditOrderException');
    }
}
