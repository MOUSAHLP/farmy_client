<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>farmy</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .container {
            height: auto;
            border: 1px solid #333;
            /* display: flex;F
            justify-content: center;
            align-items: center;
            flex-direction: column; */

        }

        .img-holder {
            width: 100%;
            text-align: center;
        }

        .img-holder img {
            max-width: 1000px;
            margin: 0px auto;
        }

        .title {
            width: 100%;
            margin: 10px auto;
            height: 230px;
            position: static;
            top: 15px;
            bottom: 0;
            right: 0;
            left: 0;
        }

        .title2 {
            height: auto;
            width: 100%;
            /* display: flex;
            justify-content: space-between;
            align-items: center; */
        }

        .table1 {
            padding: 3px;
            background-color: #F4F5F4;
            width: 100%;
            height: auto;
            text-align: end;
            margin: 5px;
        }

        .table2 {
            width: 100%;
            height: auto;
            text-align: end;
            display: inline-block;
            width: 49%;
            justify-content: center;
        }

        .p_table1 {
            margin-right: 15px;
            padding: 5px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
            font-size: 20px;
            left: 774px;
            bottom: 965px;
            /* direction: rtl; */
            letter-spacing: -0.07px;
        }

        .main_table {
            background-color: #4F894A;

        }

        table {
            border-collapse: collapse;
        }

        #titleThead {
            background: #4f894a;
            padding: 11px;
            font-size: 17px;
            font-family: FrutigerLTArabic-65Bold_6c !important;
            color: white;
            text-align: center;
        }

        /* main */

        #t1_1 {
            left: 370px;
            bottom: 1044px;
            direction: rtl;
            letter-spacing: -0.13px;
        }

        #t2_1 {
            left: 640px;
            bottom: 162px;
            direction: rtl;
            letter-spacing: -0.07px;
        }

        #t3_1 {
            left: 363px;
            bottom: 75px;
            direction: rtl;
            letter-spacing: 0.03px;
        }

        #t4_1 {
            left: 286px;
            bottom: 49px;
            direction: rtl;
            letter-spacing: 0.13px;
        }

        #t5_1 {
            left: 554px;
            bottom: 49px;
            direction: rtl;
            letter-spacing: 0.16px;
        }

        #t6_1 {
            left: 390px;
            bottom: 23px;
            letter-spacing: 0.02px;
        }

        #t7_1 {
            left: 276px;
            bottom: 965px;
            direction: rtl;
            letter-spacing: -0.04px;
        }

        #t8_1 {
            left: 774px;
            bottom: 965px;
            direction: rtl;
            letter-spacing: -0.07px;
        }

        #t9_1 {
            left: 233px;
            bottom: 930px;
            direction: rtl;
            letter-spacing: -0.07px;
        }

        #ta_1 {
            left: 223px;
            bottom: 895px;
            direction: rtl;
            letter-spacing: -0.06px;
        }

        #tb_1 {
            left: 747px;
            bottom: 930px;
            direction: rtl;
            letter-spacing: -0.06px;
        }

        #tc_1 {
            left: 699px;
            bottom: 895px;
            direction: rtl;
            letter-spacing: -0.06px;
        }

        #td_1 {
            left: 265px;
            bottom: 1128px;
            direction: rtl;
            letter-spacing: -0.95px;
        }

        #te_1 {
            left: 526px;
            bottom: 1127px;
            letter-spacing: -0.22px;
        }

        #tf_1 {
            left: 844px;
            bottom: 822px;
        }

        #tg_1 {
            left: 710px;
            bottom: 824px;
            direction: rtl;
            letter-spacing: -0.08px;
        }

        #th_1 {
            left: 249px;
            bottom: 824px;
            direction: rtl;
            letter-spacing: -0.09px;
        }

        #ti_1 {
            left: 549px;
            bottom: 824px;
            direction: rtl;
            letter-spacing: -0.08px;
        }

        #tj_1 {
            left: 425px;
            bottom: 824px;
            direction: rtl;
            letter-spacing: -0.09px;
        }

        #tk_1 {
            left: 51px;
            bottom: 824px;
            direction: rtl;
            letter-spacing: -0.1px;
        }

        #tl_1 {
            left: 301px;
            bottom: 356px;
            direction: rtl;
            letter-spacing: -0.1px;
        }

        #tm_1 {
            left: 302px;
            bottom: 321px;
            direction: rtl;
            letter-spacing: -0.09px;
            word-spacing: -0.01px;
        }

        #tn_1 {
            left: 310px;
            bottom: 283px;
            direction: rtl;
            letter-spacing: -0.09px;
            word-spacing: -0.01px;
        }

        #to_1 {
            left: 342px;
            bottom: 247px;
            direction: rtl;
            letter-spacing: -0.1px;
        }

        #tp_1 {
            left: 326px;
            bottom: 247px;
        }

        #tq_1 {
            left: 342px;
            bottom: 211px;
            direction: rtl;
            letter-spacing: -0.1px;
        }

        #tr_1 {
            left: 326px;
            bottom: 211px;
        }

        #ts_1 {
            left: 342px;
            bottom: 175px;
            direction: rtl;
            letter-spacing: -0.1px;
        }

        #tt_1 {
            left: 326px;
            bottom: 175px;
        }

        #tu_1 {
            left: 304px;
            bottom: 138px;
            direction: rtl;
            letter-spacing: -0.09px;
            word-spacing: -0.01px;
        }

        .s0 {
            font-size: 27px;
            font-family: FrutigerLTArabic-75Black_6h;
            color: #fff;
        }

        .s1 {
            font-size: 18px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
        }

        .s2 {
            font-size: 17px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
        }

        .s3 {
            font-size: 15px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
        }

        .s4 {
            font-size: 16px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
        }

        .s5 {
            font-size: 20px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #1b1f22;
        }

        .s6 {
            font-size: 45px;
            font-family: BahijTheSansArabic-Bold_67;
            color: #4f894a;
        }

        .s7 {
            font-size: 50px;
            font-family: FranklinGothic-Demi_62;
            color: #4f894a;
        }

        .s8 {
            font-size: 20px;
            font-family: FrutigerLTArabic-65Bold_61;
            color: #fff;
        }

        .s9 {
            font-size: 17px;
            font-family: FrutigerLTArabic-65Bold_6c;
            color: #fff;
        }

        .sa {
            font-size: 17px;
            font-family: FrutigerLTArabic-65Bold_61;
            color: #1b1f22;
        }

        .t.v0 {
            transform: scaleX(0.832);
        }

        @font-face {
            font-family: BahijTheSansArabic-Bold_67;
            src: url("{{ asset('fonts/BahijTheSansArabic-Bold_67.woff') }}") format("woff");
        }

        @font-face {
            font-family: FranklinGothic-Demi_62;
            src: url("{{ asset('fonts/FranklinGothic-Demi_62.woff') }}") format("woff");
        }

        @font-face {
            font-family: FrutigerLTArabic-65Bold_61;
            src: url("{{ asset('fonts/FrutigerLTArabic-65Bold_61.woff') }}") format("woff");
        }


        @font-face {
            font-family: FrutigerLTArabic-75Black_6h;
            src: url("{{ asset('fonts/FrutigerLTArabic-75Black_6h.woff') }}") format("woff");
        }

        #t {
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border: 1px solid #ddd;
        }

        #t th,
        #t thead tr td {
            font-weight: bold;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 18px;
            /* text-align: left; */
            padding: 16px;


        }

        #t tbody tr:nth-child(odd) {
            background-color: #F4F5F4;
            color: white;
            color: black;


        }

        #t tbody tr td {
            padding: 10px;
            text-align: center;
        }

        .table3 {
            padding: 3px;
            width: 100%;
            height: auto;
            text-align: end;
            padding-top: 30px;
            display: flex;
            justify-content: start;
            flex-direction: column;
        }

        .table2 th,
        .table2 tr td {
            border-left: solid #F4F5F4 1px;
            border-bottom: solid #F4F5F4 1px;
            padding: 10px;
        }


        .table3 th,
        .table3 thead tr td {
            border-left: solid #B7B9B8 1px;
            border-bottom: solid #B7B9B8 1px;
            text-align: center;
            padding: 8px;
        }

        .footer {
            position: relative;
            margin-bottom: 100px
        }

        .footer a {
            font-size: 26px;
            font-weight: bold;
            position: absolute;
            top: 65%;
            right: 45%;
            color: #4f894a;
            text-decoration: none;
        }

        #print {
            position: fixed;
            bottom: 20px;
            right: 20px;
            padding: 15px;
            border: none;
            background: #4f894a;
            color: white;
            font-size: 20px;
            border-radius: 5px;
            cursor: pointer;
            z-index: 100;
        }

        .downloaded {
            display: none;
        }
        .success-download {
            width: 100%;
            text-align: center;
            padding: 20px 0px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .success-img {
            width: 150px;
        }

        .success-download .success-title {
            color: #4f894a;
            font-size: 35px;
            margin: 20px 0px;
        }

        .success-download .success-content {
            font-size: 20px;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
        integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
    <div class="container">
        <button id="print">طباعة الفاتورة</button>
        <div class="img-holder">
            <img class="title" src="{{ asset('images/logo.png') }}" alt="logo" />
        </div>
        <!-- s1 -->
        <div class="title2">
            <!-- Date || NumberOfOrder || NumberOfInvoice -->
            <div class="table2">
                <table style="width: 100%;">
                    <thead>
                        <tr>
                            <!-- Date -->
                            <td class="p_table1">{{ $order->created_at }}</td>
                            <!-- Date -->
                            <td>
                                <span id="t7_1" class="t s5">: اﻟﺘﺎرﻳﺦ</span>
                            </td>
                        </tr>
                        <tr>
                            <!-- Order Number -->
                            <td class="p_table1">{{ $order->order_number }}</td>
                            <!-- Order Number -->
                            <td>: <span id="t9_1" class="t s5"> رﻗﻢ اﻟﻄﻠﺐ</span></td>
                        </tr>
                        <tr>
                            <!-- Invoice Number -->
                            <td class="p_table1">{{ $order->order_number }}</td>
                            <!-- Invoice Number -->
                            <td>: <span id="ta_1" class="t s5"> رﻗﻢ اﻟﻔﺎﺗﻮرة</span></td>
                        </tr>
                    </thead>
                </table>
            </div>
            <!-- Date || NumberOfOrder || NumberOfInvoice -->

            <!-- To || Address || PhoneNumber -->
            <div class="table2">
                <table style="width: 100%;background-color: #eff0f0">
                    <thead>
                        <tr>
                            <!-- TO -->
                            <td class="p_table1">{{ $order->user->first_name }} {{ $order->user->last_name }}</td>
                            <!-- TO -->
                            <td><span id="t8_1" class="t s5">: إﻟﻰ</span></td>
                        </tr>
                        <tr>
                            <!-- address -->
                            <td class="p_table1">{{ $order->userAddress->address }}</td>
                            <!-- address -->
                            <td>: <span id="tb_1" class="t s5"> اﻟﻌﻨﻮان</span></td>
                        </tr>
                        <tr>
                            <!-- phone -->
                            <td class="p_table1">{{ $order->user->phone }}</td>
                            <!-- phone -->
                            <td>: <span id="tc_1" class="t s5"> رﻗﻢ اﻟﻤﻮﺑﺎﻳﻞ</span></td>
                        </tr>
                    </thead>
                </table>
            </div>
            <!-- To || Address || PhoneNumber -->
        </div>
        <!-- s1 -->

        <!-- S2 -->
        <div class="title2">
            <div class="table2" style="width: 100%;">
                <!-- MainTable -->
                <table id="t">
                    <thead class="main_table">
                        <tr>
                            <td id="titleThead">
                                <span id="tk_1" class="t s9"> اﻟﺴﻌﺮ اﻹﺟﻤﺎﻟﻲ ل.س</span>
                            </td>
                            <td id="titleThead">
                                <span id="th_1" class="t s9"> اﻟﺴﻌﺮ اﻹﻓﺮادي</span>
                            </td>
                            <td id="titleThead">الوحدة</td>
                            <td id="titleThead">
                                <span id="ti_1" class="t s9"> اﻟﻜﻤﻴﺔ</span>
                            </td>
                            <td id="titleThead">
                                <span id="tg_1" class="t s9"> اﻟﻤﺎدة</span>
                            </td>
                            <td id="titleThead" style="text-align: center">#</td>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- forEach -->
                        @php
                            $i = 1;
                        @endphp
                        @foreach ($order->orderDetails as $order_detail)
                            <tr>
                                <td>{{ $order_detail->quantity * $order_detail->price }}</td>
                                <td>{{ intval($order_detail->price) }}</td>
                                <td>{{ $order_detail->product->unit ?? 'لايوجد' }}</td>
                                <td>{{ $order_detail->quantity }}</td>
                                <td>{{ $order_detail->product->name }}</td>
                                <td>{{ $i }}</td>
                            </tr>
                            @php
                                $i++;
                            @endphp
                        @endforeach
                        <!-- forEach -->
                    </tbody>
                </table>
                <!-- MainTable -->

                <!-- SecendTable -->
                <div style="display: flex; justify-content: space-around">
                    <div class="table3" style="background-color: #eff0f0">
                        <table>
                            <thead>
                                <tr>
                                    <td class="p_table1">{{ $order->sub_total }}</td>
                                    <td><span id="tl_1" class="t s2">: اﻟﻤﺠﻤﻮع اﻷوﻟﻲ</span></td>
                                </tr>
                                <tr>
                                    <td class="p_table1">{{ $order->coupon_discount }}</td>
                                    <td>
                                        <span id="tm_1" class="t s2">: اﻟﺤﺴﻢ اﻟﻤﻤﻨﻮح</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="p_table1">{{ $order->delivery_fee }}</td>
                                    <td><span id="tn_1" class="t s2">: أﺟﻮر اﻟﺘﻮﺻﻴﻞ</span></td>
                                </tr>


                                <tr>
                                    <td class="p_table1">{{ $order->invoice['tax'] }}</td>
                                    <td>
                                        <span id="tq_1" class="t s2"> :ﺿﺮﻳﺒﺔ</span>
                                    </td>
                                </tr>
                                <tr style="background-color: #4f894a">
                                    <td class="p_table1" style="color: white">
                                        {{ $order->total }}
                                    </td>
                                    <td>
                                        <span id="tu_1" class="t s9"> :اﻟﻤﺠﻤﻮع اﻟﻜﻠﻲ</span>
                                    </td>
                                </tr>
                            </thead>
                        </table>
                    </div>

                    <div style="width: 92%;direction: rtl;padding-left: 100px;padding-top: 20px;">
                        <img src="{{ asset('images/qr.png') }}" width="200px" />
                    </div>
                </div>
                <!-- SecendTable -->
            </div>
        </div>
        <!-- S2 -->

        <!-- footer -->
        <div class="footer">
            <img width="99%" src="{{ asset('images/footer.png') }}" alt="" />
            <a href="tel:{{ $contact_us_phone }}">+{{ $contact_us_phone }}</a>
        </div>
        <!-- footer -->
    </div>
    <div class="downloaded">
        <div class="success-download">
            <svg class="success-img" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="-5 -5 60.00 60.00" xml:space="preserve"
                fill="#4f894a">
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="#CCCCCC"
                    stroke-width="0.3"></g>
                <g id="SVGRepo_iconCarrier">
                    <circle style="fill:#4f894a;" cx="25" cy="25" r="25"></circle>
                    <polyline
                        style="fill:none;stroke:#FFFFFF;stroke-width:5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;"
                        points=" 38,15 22,33 12,25 "></polyline>
                </g>
            </svg>
            <h2 class="success-title">نجاح</h2>
            <p class="success-content">تم تحميل الفاتورة بنجاح يمكنك اغلاق المتصفح</p>
        </div>
    </div>
    <script>
        const printButton = document.querySelector("#print");
        const container = document.querySelector(".container");
        const downloadedDiv = document.querySelector(".downloaded");
        window.onload = async function() {
            if (window.innerWidth <= 600) {
                printButton.style.right = "-4000px";
                await print();
                container.style.display = "none";
                downloadedDiv.style.display = "block";
            }
        };

        printButton.onclick = async () => {
            printButton.style.right = "-4000px";
            printButton.style.display = "none";
            await print();
            printButton.style.right = "20px";
            printButton.style.display = "block";

        };
        async function print() {
            window.scrollTo(0, 0);
            let html = document.querySelector("html");
            console.log(html);
            var opt = {
                html2canvas: {
                    scale: 2
                },
                jsPDF: {
                    unit: 'cm',
                    format: 'a4',
                    orientation: 'portrait'
                }
            };
            html2pdf().set(opt).from(html).save("{{ $filename }}");
        }
    </script>
</body>

</html>
