<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - æ¥æéæ©å¨layerDate</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="../static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="../static/css/animate.css" rel="stylesheet">
    <link href="../static/css/animate.css" rel="stylesheet">
    <link href="../static/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeIn">
        
                <div class="row">
                    <div class="col-sm-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <form class="form-horizontal m-t">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">å¾æ è§¦åæ¥æï¼</label>
                                        <div class="col-sm-10">
                                            <input readonly class="form-control layer-date" id="hello1">
                                            <label class="laydate-icon inline demoicon" onclick="laydate({elem: '#hello1'});"></label>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            
        </div>
    </div>

    <!-- å¨å±js -->
    <script src="../static/js/jquery.min.js?v=2.1.4"></script>
    <script src="../static/js/bootstrap.min.js?v=3.3.6"></script>



    <!-- èªå®ä¹js -->
    <script src="../static/js/content.js?v=1.0.0"></script>


    <!-- layerDate plugin javascript -->
    <script src="../static/js/plugins/layer/laydate/laydate.js"></script>
    <script>
        //å¤é¨jsè°ç¨
        laydate({
            elem: '#hello', //ç®æ åç´ ãç±äºlaydate.jså°è£äºä¸ä¸ªè½»éçº§çéæ©å¨å¼æï¼å æ­¤elemè¿åè®¸ä½ ä¼ å¥classãtagä½å¿é¡»æç§è¿ç§æ¹å¼ '#id .class'
            event: 'focus' //ååºäºä»¶ãå¦ææ²¡æä¼ å¥eventï¼åæç§é»è®¤çclick
        });

        //æ¥æèå´éå¶
        var start = {
            elem: '#start',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(), //è®¾å®æå°æ¥æä¸ºå½åæ¥æ
            max: '2099-06-16 23:59:59', //æå¤§æ¥æ
            istime: true,
            istoday: false,
            choose: function (datas) {
                end.min = datas; //å¼å§æ¥éå¥½åï¼éç½®ç»ææ¥çæå°æ¥æ
                end.start = datas //å°ç»ææ¥çåå§å¼è®¾å®ä¸ºå¼å§æ¥
            }
        };
        var end = {
            elem: '#end',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(),
            max: '2099-06-16 23:59:59',
            istime: true,
            istoday: false,
            choose: function (datas) {
                start.max = datas; //ç»ææ¥éå¥½åï¼éç½®å¼å§æ¥çæå¤§æ¥æ
            }
        };
        laydate(start);
        laydate(end);
    </script>

    
    

</body>

</html>
