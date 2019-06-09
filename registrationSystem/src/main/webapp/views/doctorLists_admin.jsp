<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 数据表格</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="../static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="../static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="../static/css/animate.css" rel="stylesheet">
    <link href="../static/css/style.css?v=4.1.0" rel="stylesheet">
    <style>
    	.float-e-margins .btn {margin-bottom: 0px;}		
		.tableBtn{float:left;width:30%;margin-top:0px;margin-left:5px;padding:2px 8px;}
    </style>
	
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>医生<small>列表</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link" onclick="addDoctor()">
                                <i class="fa fa-plus-square" aria-hidden="true" ></i>
                                	新增医生
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>医生ID</th>
                                    <th>医生名字</th>
                                    <th>所在科室</th>
                                    <th>出诊时间</th>
                                    <th>上班状态</th>
                                    <th>医生简介</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        
    </div>

    <!-- 全局js -->
    <script src="../static/js/jquery.min.js?v=2.1.4"></script>
    <script src="../static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="../static/js/plugins/jeditable/jquery.jeditable.js"></script>
    <!-- Data Tables -->
    <script src="../static/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="../static/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <!-- 自定义js -->
    <script src="../static/js/content.js?v=1.0.0"></script>
	<script src="../static/layer/layer.js"></script>

    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {
        	
        	$.ajax({
        		url: '../getDocList.do',
        		type: 'POST',
        		dataType: 'JSON',
        		success: function(res){
        			var data = res;
        			//然后 DataTables 这样初始化：
                    $('.dataTables-example').DataTable( {
                    	"bAutoWidth": false,
                        data: data,
                        columns: [
                            { data: 'doctorId',width:"10%"},
                            { data: 'doctorName' ,width:"10%"},
                            { data: 'deptName' ,width:"10%"},
                            { data: 'workTime' ,width:"15%"},
                            { data: 'workStatus',render:function(data,type,row){
	                                if(data == 1){
	                                    return "<button class='btn btn-success'>正常</a>";
	                                }else{
	                                    return "<button class='btn btn-danger'>请假</a>";
	                                }
                            	},width:"10%"
                            },
                            { data: 'doctorDes',width:"25%",render:function(data,type,row){
	                                if(data.length > 20){
	                                    return "<a onclick='show("+data+")'>"+data.substring(0,20) + "..."+"</a>";
	                                }else{
	                                    return "<a onclick='show("+data+")'>"+data+"</a>";
	                                }
                            	}
                            },
                            { data: null,width:"20%"}
                        ],
                        columnDefs:[{
                            targets: 6,
                            render: function (data, type, row, meta) {
                                return '<a type="button" class="btn btn-danger tableBtn" href="#" onclick=delFromByID(' + row.doctorId + ') >删除</a>'+
                                		'<a type="button" class="btn btn-info tableBtn" href="#" onclick=editFromByID(' + row.doctorId + ') >编辑</a>'+
                                		'<a type="button" class="btn btn-success tableBtn" href="#" onclick=changeFromByID(' + row.doctorId + ','+row.workStatus+') >修改状态</a>';
                            }
                        },
                            { "orderable": false, "targets": 6 },
                        ]
                    } );
        		},
        		error: function(res){
        			layer.msg('新增失败');
        		}
        	});

        });
        
        function addDoctor(){
        	layer.open({
        		  type: 2,
        		  title: '新增医生信息',
        		  shadeClose: true,
        		  shade: 0.8,
        		  area: ['50%', '50%'],
        		  content: './addDoc.jsp' //iframe的url
        		}); 
        }
        //删除
        function delFromByID(id){
        	layer.confirm('确认删除该医生信息？', {
        		  btn: ['确定','取消'] //按钮
        		}, function(){
        			$.ajax({
                		url: '../updateDoctorStatus.do',
                		type: 'POST',
                		data: {'doctorId':id},
                		dataType: 'JSON',
                		success: function(result){
                			if(result=="success"){
                				layer.alert('删除成功',function(index){
                					layer.close(index);
                					reload();
                				});
                			}
                		},
                		error: function(res){
                			layer.msg('删除失败');
                		}
                	});
        		}, function(){
        		});
        }
        //编辑
        function editFromByID(id){
        	layer.open({
      		  type: 2,
      		  title: '更新医生信息',
      		  shadeClose: true,
      		  shade: 0.8,
      		  area: ['50%', '50%'],
      		  content: './editDoc.jsp', //iframe的url
      		  success: function (layero, index) {
      			var iframe = window['layui-layer-iframe' + index];
                iframe.getDocById(id)
              }
      		});
        }
      //修改工作状态
        function changeFromByID(id,status){
        	var workStatus = status == 1 ? 0 : 1;
        	layer.confirm('确认修改该医生的工作状态？', {
      		  btn: ['确定','取消'] //按钮
      		}, function(){
      			$.ajax({
              		url: '../updateDocWorkStatus.do',
              		type: 'POST',
              		data: {'doctorId':id,'workStatus':workStatus},
              		dataType: 'JSON',
              		success: function(result){
              			if(result=="success"){
              				layer.alert('修改成功',function(index){
              					layer.close(index);
              					reload();
              				});
              			}
              		},
              		error: function(res){
              			layer.msg('修改失败');
              		}
              	});
      		}, function(){
      		});
        }
        //重新加载
        function reload(){
        	window.location.reload();
        }
        
        function show(data){
        	layer.alert(data);
        }
    </script>

    
    

</body>

</html>
