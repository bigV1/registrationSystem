<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 基本表单</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="../static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="../static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="../static/css/animate.css" rel="stylesheet">
    <link href="../static/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>更新科室资料</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12">
                                <form role="form">
                                	<input type="hidden" id="deptId">
                                    <div class="form-group">
                                        *<label>科室名字(必填)</label>
                                        <input id="deptName" type="text" placeholder="请输入科室名字" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        *<label>科室位置(必填)</label>
                                        <input id="deptArea" type="text" placeholder="请输入科室位置" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>科室简介</label>
                                        <input id="deptDes" type="text" placeholder="请输入科室简介" class="form-control">
                                    </div>
                                    <div>
                                        <button type="button" class="btn btn-sm btn-primary pull-right m-t-n-xs" onclick="updateDept()">
                                        	<strong>更 新</strong>
                                        </button>
                                    </div>
                                </form>
                            </div>
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

    <!-- iCheck -->
    <script src="../static/js/plugins/iCheck/icheck.min.js"></script>
    <script src="../static/layer/layer.js"></script>
    <script>
	    function getDeptById(id){
	    	$.ajax({
        		url: '../getDeptById.do',
        		type: 'POST',
        		data: {'departmentId':id},
        		dataType: 'JSON',
        		success: function(res){
        			$('#deptId').val(res.departmentId);
        			$('#deptName').val(res.departmentName);
                	$('#deptArea').val(res.departmentArea);
                	$('#deptDes').val(res.departmentDes);
        		},
        		error: function(res){
        			layer.msg('编辑失败');
        		}
        	});
	    }
	    
        function updateDept(){
        	var deptId = $('#deptId').val();
        	var deptName = $('#deptName').val();
        	var deptArea = $('#deptArea').val();
        	var deptDes = $('#deptDes').val();
        	if(deptName == "" || deptArea == ""){
        		layer.msg("请输入科室必填信息!");
        	}
        	$.ajax({
        		url: '../updateDept.do',
        		type: 'POST',
        		data: {'departmentId':deptId,'departmentName':deptName,'departmentDes':deptDes,'departmentArea':deptArea},
        		dataType: 'JSON',
        		success: function(result){
        			var frameIndex = parent.layer.getFrameIndex(window.name); //获取窗口索引
        			
        			if(result=="success"){
        				layer.alert('更新成功',function(index){
        					layer.close(index);
        					parent.reload();
        					parent.layer.close(frameIndex);
        					
        				});
        			}
        		},
        		error: function(res){
        			layer.msg('更新失败');
        		}
        	});
        }
    </script>

    
    

</body>

</html>
