<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>培训管理</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link href="html/css/mine.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="html/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="html/js/jquery.validate.js"></script>
<script type="text/javascript" language="javascript" src="<%=basePath %>html/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$().ready(function(){
		$("#formId").validate({
			rules:{
				trainName:"required",
				trainTeacher:"required",
				trainStarttime:"required",
				trainEndtime:"required",
				trainGoal:"required",
				trainPeople:{
					required:true,
				},
				file:"required"
			},
			messages:{
				trainName:{
					required:'培训名称不能为空'
				},
				trainTeacher:{
					required:'培训讲师不能为空'
				},
				trainStarttime:{
					required:'培训开始时间不能为空'
				},
				trainEndtime:{
					required:'培训结束时间不能为空'
				},
				trainGoal:{
					required:'培训目的不能为空'
				},
				trainPeople:{
					required:'参训人员不能为空'
				},
				file:{
					required:'文件不能为空'
				}
			}
		});
	})
</script>
</head>
<body>
	<div class="div_head">
		<span> <span style="float: left">当前位置是：-》培训管理 -》添加培训计划</span> <span
			style="float: right; margin-right: 8px; font-weight: bold"> <a
				style="text-decoration: none" href="train/list.do">【返回】</a>
		</span>
		</span>
	</div>
	<div style="font-size: 13px; margin: 10px 5px">
		<form action="train/insert.do" id="formId" method="post"
			enctype="multipart/form-data">
			<input type="hidden" id="train_state" name="trainState" value="">
			<table border="1" width="100%" class="table_a">
				<tr>
					<td width="120px;">培训名称<span style="color: red">*</span>：
					</td>
					<td><input type="text"  name="trainName" /></td>
				</tr>
				<tr>
					<td>培训讲师<span style="color: red">*</span>：
					</td>
					<td><input type="text"  name="trainTeacher"/></td>
				</tr>
				<tr>
					<td>培训时间<span style="color: red">*</span>：
					</td>
					<td><input type="text" name="trainStarttime"  onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>
				</tr>
				<tr>
					<td>至</td>
					<td><input type="text" name="trainEndtime"  onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/></td>

				</tr>
				<tr>
					<td>培训目的<span style="color: red">*</span>：
					</td>
					<td><textarea name="trainGoal" ></textarea></td>
				</tr>

				<tr>
					<td>参训人员<span style="color: red">*</span>：
					</td>
					<td><textarea name="trainPeople" ></textarea></td>
				</tr>
				<tr>
					<td>培训简介：</td>
					<td><textarea name="trainJianjie" ></textarea></td>
				</tr>
				<tr>
					<td>培训资料<span style="color: red">*</span>：</td>
					<td><input type="file" name="file" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="保存"	 onclick="javascript:saveTrain(0);"> 
						<input type="button" value="申请复核"	onclick="javascript:saveTrain(1);">
					</td>
				</tr>
			</table>
		</form>
	</div>
<script type="text/javascript">
	function saveTrain(i) {
		var o = document.getElementById("train_state");
		o.value = i; 
		$("#formId").submit(); 
	}
	
</script>
</body>
</html>