// scripts/log_in.js 编码 UTF-8

//console.log("Hello!");

//网页加载以后执行的方法!
$(function(){
	//console.log("呵呵");
	//var obj = $('#login');
	//console.log(obj);
	$('#login').click(loginAction);
	
	$('#count')
	.on('blur', checkName)
	.on('focus', function(){
		$('#count_msg').empty();
	}).focus();
	
	$('#password')
	.on('blur', checkPassword)
	.on('focus', function(){
		$('#password_msg').empty();
	});
	
});

/*
 * 检验用户名是否正确
 */
function checkName(){
	var name = $("#count").val();
	if(name==''){
		$('#count_msg').empty().append("不能空");
		return false;
	}
	var reg = /^\w{3,10}$/;
	if(reg.test(name)){
		$('#count_msg').empty();
		return true;
	}
	$('#count_msg').empty().append("3~10字符");
	return false;
} 

/*
 * 检验密码是否正确
 */
function checkPassword(){
	var password = $("#password").val();
	if(password==''){
		$("#password_msg").empty().append("不能空");
		return false;
	}
	var reg = /^\w{3,10}$/;
	if(reg.test(password)){
		$('#password_msg').empty();
		return true;
	}
	$('#password_msg').empty().append("3~10字符");
	return false;
	
}


function registerAction(){
	
	var username = $('#regist_username').val();
	var name = $('#nickname').val();
	var password = $('#regist_password').val();
	console.log(username+"__"+name+"__"+password);
	
	$.ajax({
		url: 'register.do',
		type: 'POST',
		data: {'username':username,'name':name,'password':password},
		dataType: 'JSON',
		success: function(result){
			
			if(result=="success"){
				layer.alert('注册成功', {
					  skin: 'layui-layer-molv' //样式类名
					  ,closeBtn: 0
					}, function(index){
					  layer.close(index);
					  get('zc').className='sig sig_out';
					  get('dl').className='log log_in';
					});
			
			}else if(result=="exists"){
				layer.msg("账号已存在!");
			}
		}
	});
}

function loginAction(){
	
	var username = $('#count').val();
	var password = $('#password').val();
	console.log(username+"____"+password);
	
	$.ajax({
		url: 'login.do',
		type: 'POST',
		data: {'username':username,'password':password},
		dataType: 'JSON',
		success: function(result){
			
			if(result=="success"){
				layer.msg('登陆成功!前往笔记页面');
				setTimeout(function () {
					window.location.href="index.do"
				},1000);
			}else if(result=="error"){
				layer.msg("账号或密码错误!");
			}
		}
	});
}








