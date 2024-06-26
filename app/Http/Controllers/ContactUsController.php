<?php

namespace App\Http\Controllers;

use App\Http\Requests\ContactUsRequest;
use App\Models\ContactUs;
use Illuminate\Http\Request;

class ContactUsController extends Controller
{
    public function get_contact_us()
    {
        return ContactUs::all();
    }
    public function contact_us(ContactUsRequest $request)
    {
        ContactUs::create([
            'email' => $request->email,
            'notes' => $request->notes,
        ]);

        return $this->successResponse(
            null,
            'dataAddedSuccessfully'
        );
    }
}
