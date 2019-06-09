<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="./static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="./static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="./static/css/animate.css" rel="stylesheet">
    <link href="./static/css/style.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">h</h1>

            </div>
            <h3>欢迎使用 医院【挂号】系统</h3>

            <form class="m-t" role="form" action="index.html">
                <div class="form-group">
                    <input id="username" type="text" class="form-control" placeholder="用户名" required="">
                </div>
                <div class="form-group">
                    <input id="password" type="password" class="form-control" placeholder="密码" required="">
                </div>
                <button type="button" onclick="login()" class="btn btn-primary block full-width m-b">登 录</button>


                <p class="text-muted text-center"><a href="./register.jsp">注册一个新账号</a>
                </p>

            </form>
        </div>
    </div>

    <!-- 全局js -->
    <script src="./static/js/jquery.min.js?v=2.1.4"></script>
    <script src="./static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="./static/layer/layer.js"></script>
    <script type="text/javascript" src="./static/js/jquery.cookie.js"></script>
	<script>
	$(document).ready(function () {
		var level = $.cookie('userLevel');
		if(level == ""){
			
		}else if(level == 2){
			layer.msg("已登录，当前权限为管理员，前往系统后台！");
			setTimeout(function(){
				window.location.href="/note/views/admin/index.jsp";
			},1000);
		}else if(level == 1){
			layer.msg("已登录，当前权限为普通用户，前往系统后台！");
			setTimeout(function(){
				window.location.href="/note/index.jsp";
			},1000);
		}
	});
		function login(){
			var username = $('#username').val();
			var password =$('#password').val();
			if(username == "" || password == ""){
				layer.msg("请输入用户名和密码!");
			}
			
			$.ajax({
        		url: './login.do',
        		type: 'POST',
        		data: {
	        			'username':username,
	        			'password':password
        			},
        		dataType: 'JSON',
        		success: function(result){
        			if(result == 'error'){
        				layer.msg("登录失败,请确保帐号密码正确！");
        			}else{
        				if(result == 1){
        					layer.msg("管理员权限登录成功，前往系统后台！");
        					$.cookie('userLevel', 2, {path: '/'});
        					setTimeout(function(){
        						window.location.href="/note/views/admin/index.jsp";
        					},1000);
            				
            			}else{
            				layer.msg("用户登录成功，前往系统后台！");
            				$.cookie('username', result, {path: '/'});
            				$.cookie('userLevel', 1, {path: '/'});
            				setTimeout(function(){
        						window.location.href="/note/index.jsp";
        					},1000);
            			}
        			}
        		},
        		error: function(res){
        			layer.msg("登录失败");
        		}
        	});
		}
		
	</script>
    
    

</body>

</html>
