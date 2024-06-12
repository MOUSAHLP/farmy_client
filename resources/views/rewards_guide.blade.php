<!DOCTYPE html>
<html lang="{{ app()->getlocale() }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
        .page-break {
            page-break-after: always;
        }

        ul li {
            font-size: 14px;
        }
    </style>
</head>

<body
    style="direction: {{ app()->getlocale() == 'ar' ? 'rtl' : 'ltr' }};color: #727272;font-family: Frutiger LT Arabic;">
    <h3 style="font-weight: 700;font-size: 14px;">@lang('view.rewards_guide.Marhaba_Customer_Rewards_Program')</h3>
    <p style="font-weight: 400;font-size: 14px;">
        @lang('view.rewards_guide.Marhaba_Customer_Rewards_Program_Desc')
    </p>

    <h3 style="font-weight: 700;font-size: 14px;">
        @lang('view.rewards_guide.How_can_I_earn_points')
    </h3>
    <p style="font-weight: 400;font-size: 14px;">
        @lang('view.rewards_guide.You_can_obtain_points')
    </p>
    <ul style="font-weight: 400;font-size: 14px;">
        <li> @lang('view.rewards_guide.Download_the_app') <span style="color: #4F8640;">100</span> @lang('view.rewards_guide.point').</li>
        <li> @lang('view.rewards_guide.Share_the_app_link') <span style="color: #4F8640;">50</span> @lang('view.rewards_guide.point').</li>
        <li> @lang('view.rewards_guide.Evaluate_the_in_app_purchase')<span style="color: #4F8640;">5</span> @lang('view.rewards_guide.point').</li>
        <li> @lang('view.rewards_guide.Add_your_date_of_birth') <span style="color: #4F8640;">10</span> @lang('view.rewards_guide.points') .</li>
        <li> @lang('view.rewards_guide.Purchases_and_orders') <span style="color: #4F8640;">1</span> @lang('view.rewards_guide.One_point_for_each')
            <span style="color: #4F8640;">1000</span> @lang('view.rewards_guide.Syrian_pounds_are_spent') .
        </li>
    </ul>
    <h3 style="font-weight: 700;font-size: 14px;"> @lang('view.rewards_guide.How_can_I_Replace_Points')</h3>
    <p style="font-weight: 400;font-size: 14px;">
        @lang('view.rewards_guide.replace_points_desc')
    </p>
    <ul>
        <li> @lang('view.rewards_guide.each')<span style="color: #4F8640;"> 100 </span>@lang('view.rewards_guide.Point_you_get') <span
                style="color: #4F8640;"> 3500</span> @lang('view.rewards_guide.SYP')</li>
        <li>@lang('view.rewards_guide.each') <span style="color: #4F8640;">200 </span>@lang('view.rewards_guide.Point_you_get')<span style="color: #4F8640;">
                7000</span> @lang('view.rewards_guide.SYP') </li>
        <li>@lang('view.rewards_guide.each') <span style="color: #4F8640;">300 </span>@lang('view.rewards_guide.Point_you_get')<span style="color: #4F8640;">
                10,500</span> @lang('view.rewards_guide.SYP')
        </li>
        <li>@lang('view.rewards_guide.each') <span style="color: #4F8640;">500 </span> @lang('view.rewards_guide.Point_you_get') <span
                style="color: #4F8640;"> 17,500</span> @lang('view.rewards_guide.SYP')
        </li>
        <li>@lang('view.rewards_guide.each') <span style="color: #4F8640;">1000 </span> @lang('view.rewards_guide.Point_you_get') <span
                style="color: #4F8640;"> 35,000</span> @lang('view.rewards_guide.SYP')
        </li>
    </ul>

    <h3 style="color: #BF0000;font-size: 14px;"> @lang('view.rewards_guide.note')</h3>
    <p style="background-color: #e4e4e4;border-radius: 6px;font-size: 14px;padding: 15px;text-align: center;">
        @lang('view.rewards_guide.All_points_expire') <span class="red"> @lang('view.rewards_guide.Within_a_period_of_90_days') </span> @lang('view.rewards_guide.From_the_date_of_obtaining_them') </p>

</body>

</html>
