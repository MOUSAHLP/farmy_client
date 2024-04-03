<?php

namespace App\Http\Controllers;

use App\Models\DeliveryTimeInfo;
use App\Models\Setting;

class SettingsController extends Controller
{
    public function settings()
    {

        $setting = Setting::firstOrFail();
        $opening_times = DeliveryTimeInfo::firstOrFail()
            ->select(["start_time", "end_time", "before_message", "after_message"])->get()->first();


        return $this->successResponse(
            [
                'baseUrl' => $setting->baseUrl,
                'version' => $setting->version,
                'phone' => $setting->phone,
                'show_reward_system' => $setting->show_reward_system,
                'opening_times' => $opening_times
            ],
            'dataFetchedSuccessfully'
        );
    }
    public function PrivacyAndPolicy()
    {
        return $this->successResponse(
            [
                'html' => view('privacy')->render(),
            ],
            'dataFetchedSuccessfully'
        );
    }
    public function ConditionsAndRules()
    {
        return $this->successResponse(
            [
                'html' => view('conditions')->render(),
            ],
            'dataFetchedSuccessfully'
        );
    }
    public function faqQuestions()
    {
        return $this->successResponse(
            [
                'html' => view('faq_question')->render(),
            ],
            'dataFetchedSuccefully'
        );
    }
    public function whoWeAre()
    {
        return $this->successResponse(
            [
                'html' => view('who_we_are')->render(),
            ],
            'dataFetchedSuccefully'
        );
    }
    public function useTerms()
    {
        return $this->successResponse(
            [
                'html' => view('use_terms')->render(),
            ],
            'dataFetchedSuccefully'
        );
    }
    public function aboutTheApp()
    {
        return $this->successResponse(
            [
                'html' => view('about_the_app')->render(),
            ],
            'dataFetchedSuccefully'
        );
    }
}
