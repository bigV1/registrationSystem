<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 选项卡 &amp; 面板</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="../static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="../static/css/animate.css" rel="stylesheet">
    <link href="../static/css/style.css?v=4.1.0" rel="stylesheet">
	<style>
		.des{display:block;line-height:25px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;}
	</style>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeIn">
        
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>科室医生列表</h5>
                    </div>
                    <div class="ibox-content">
						<div class="row" id="doctors">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- 全局js -->
    <script src="../static/js/jquery.min.js?v=2.1.4"></script>
    <script src="../static/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="../static/js/content.js?v=1.0.0"></script>
    <script src="../static/js/plugins/layer/layer.min.js"></script>
    
    <script src="../static/js/laydate/laydate.js"></script>
    <script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
	<script>
		var doctorDatas;
		 $(document).ready(function () {
			 $.ajax({
	        		url: '../getDocList.do',
	        		type: 'POST',
	        		dataType: 'JSON',
	        		success: function(res){
	        			doctorDatas = res;
	        			for(let i=0;i<res.length;i++){
	        				var status =  res[i].workStatus == 1?"正常":"请假";
	        				var id = "#time"+i;
	        				$("#doctors").append(
	        					"<div class='col-sm-4'>"+
	                                "<div class='panel panel-success'>"+
	                                    "<div class='panel-heading'>"+res[i].doctorName+" 相关信息</div>"+
	                                    "<div class='panel-body'>"+
	                                    	"<p>医生姓名: "+res[i].doctorName+"</p>"+
	                                        "<p class='des'>医生简介: "+res[i].doctorDes+"</p>"+
	                                        "<p>所属科室: "+res[i].deptName+"</p>"+
	                                        "<p>出诊时间: "+res[i].workTime+"</p>"+
	                                        "<p style='color:red'>当前工作状态: "+status+"</p>"+
	                                        
	                                        "<div class='form-group'>"+
	                                        	"<label class='col-sm-2 control-label' style='padding:0px'>挂号时间：</label>" +
		                                        "<div class='col-sm-10'>" +
		                                        	"<input id='time"+i+"' class='laydate-icon form-control layer-date'>" +
		                                        "</div>"+
	                                        "</div>" +
	                                        "<button class='btn btn-info' onclick='register("+i+")'>挂号</button>"+
	                                    "</div>"+
	                                "</div>"+
	                            "</div>"
	        				);
	        				laydate.render({
	        					  elem: '#time'+i //指定元素
	        				});
	        				
	        			}
	        			
	        		},
	        		error: function(res){
	        			layer.msg('加载失败');
	        		}
	        	});
		 });
		function register(index){
			var userData;
			var username = $.cookie('username');
			if(username == null){
				layer.msg("用户信息过期或未登录,前往登录界面！");
				setTimeout(function(){
					window.location.href="/note/";
				},1000);
			}
			$.ajax({
					url: '../getUserData.do',
	        		type: 'POST',
	        		data: {
	        			'username':username
	        		},
	        		dataType: 'JSON',
	        		success: function(result){
	        			userData = result;
	        		}
			})
			if(index >= 0){
				var data = doctorDatas[index];
			}else{
				var data = doctorDatas;
			}
			console.log(data);
			if(data.workStatus == 1){
				//选择时间
				var time = $('#time'+index).val();
				//当前系统时间 转换为年月日
				var now = new Date();
				var nowTime = now.getFullYear() + "-" +((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate();
				
				var timestamp =now.getTime();
				var registerTime = new Date(time).getTime();
				var cha = timestamp - registerTime;
				if(cha > =0){
					layer.msg("对不起，请预约今天之后的时间");
				}
				var week = getMyDay(new Date(time));
				if(data.workTime.indexOf(week)  > -1){
					layer.confirm('确认预约该医生的诊疗？', {
		        		  btn: ['确定','取消'] //按钮
		        		}, function(){
		        			//提交
							$.ajax({
								url: '../addReg.do',
				        		type: 'POST',
				        		data: {
				        			'hzUsername':userData.username,
				        			'hzName':userData.name,
				        			'hzId':userData.user_id,
				        			'address':userData.address,
				        			'tel':userData.tel,
				        			'doctorName':data.doctorName,
				        			'doctorId':data.doctorId,
				        			'deptName':data.deptName,
				        			'deptId':data.deptId,
				        			'registerTime':time,
				        			'createTime':nowTime
				        		},
				        		dataType: 'JSON',
				        		success: function(result){
				        			if(result=="success"){
				        				layer.alert('挂号预约成功',function(index){
				        					layer.close(index);
				        					parent.layer.closeAll();
				        				});
				        			}
				        		},
				        		error: function(res){
				        			layer.msg('挂号预约失败');
				        		}
							})
		        		},function(){
		        		});
				}else{
					layer.msg("请选择当前医生出诊的时间预约！");
				}
				
				
			}else if(data.workStatus == 0){
				layer.msg("对不起！当前医生处于请假状态，请选择其他医生");
			}
		}
		
		//判断周几
		function getMyDay(date){
			var week;
				if(date.getDay()==0) week="星期日"
				if(date.getDay()==1) week="星期一"
				if(date.getDay()==2) week="星期二"
				if(date.getDay()==3) week="星期三"
				if(date.getDay()==4) week="星期四"
				if(date.getDay()==5) week="星期五"
				if(date.getDay()==6) week="星期六"
			return week;
		}
		
	</script>

    
    

</body>

</html>
