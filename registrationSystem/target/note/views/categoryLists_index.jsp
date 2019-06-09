<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 数据表格</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="../static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
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
                        <h5>科室<small>列表</small></h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>科室ID</th>
                                    <th>科室名称</th>
                                    <th>科室位置</th>
                                    <th>科室简介</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="deptList">
                            
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
        		url: '../getDeptList.do',
        		type: 'POST',
        		dataType: 'JSON',
        		success: function(res){
        			var data = res;
        			//然后 DataTables 这样初始化：
                    $('.dataTables-example').DataTable( {
                        data: data,
                        columns: [
                            { data: 'departmentId' },
                            { data: 'departmentName' },
                            { data: 'departmentArea' },
                            { data: 'departmentDes' },
                            { data: null}
                        ],
                        columnDefs:[{
                            targets: 4,
                            render: function (data, type, row, meta) {
                                return '<a type="button" class="btn btn-info" href="#" onclick=register(' + row.departmentId + ') >我要挂号 </a>';
                            }
                        },
                            { "orderable": false, "targets": 4 },
                        ],
                    } );
        		},
        		error: function(res){
        			layer.msg('新增失败');
        		}
        	});
        });
        function register(id){
        	//根据科室id获取科室下的医生列表
        	layer.open({
      		  type: 2,
      		  title: '医生列表',
      		  shadeClose: true,
      		  shade: 0.8,
      		  area: ['90%', '80%'],
      		  content: './tabs_doctor.jsp',
      		  success: function (layero, index) {
      			var iframe = window['layui-layer-iframe' + index];
                iframe.getDoctorByDeptId(id)
              }
      		});
        }
        //重新加载
        function reload(){
        	window.location.reload();
        }
    </script>
	
    
    

</body>

</html>
