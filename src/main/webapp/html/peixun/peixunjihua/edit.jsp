<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/html/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
	<title>培训管理</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link href="css/mine.css" type="text/css" rel="stylesheet">
</head>
<script type="text/javascript" src="html/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function saveTrain(i) {
		var o = document.getElementById("train_state");
		o.value = i; 
		//$("#train_state").val(i);
		$("#formId").submit();
	}
</script>

<body>
	<div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》培训管理 -》修改培训计划</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="../train/list.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../train/updateTrain.do" method="post">
            <input type="hidden" name="trainState" id="train_state" value="${train.trainState}">
            <input type="hidden" name="trainId" value="${train.trainId}">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">培训名称<span style="color:red">*</span>：</td>
                    <td><input type="text" name="trainName" value="${train.trainName}"/></td>
                </tr>
                <tr>
                    <td>培训讲师<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="trainTeacher" value="${train.trainTeacher}" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>培训时间<span style="color:red">*</span>：</td>
                    <td><input type="text" name="trainStarttime" value="${train.trainStarttime}"/></td>
                </tr>
                <tr>
                    <td>至</td>
                    <td><input type="text" name="trainEndtime" value="${train.trainEndtime }"/></td>
                </tr>
                <tr>
                    <td>培训目的<span style="color:red">*</span>：</td>
                    <td><textarea name="trainGoal" >${train.trainGoal}</textarea>
                    </td>
                </tr>

				<tr>
                    <td>参训人员<span style="color:red">*</span>：</td>
                    <td><textarea name="trainPeople" >${train.trainPeople}</textarea>
                    </td>                
                </tr>

				<tr>
                    <td>培训简介：</td>
                    <td>
                    <textarea name="trainJianjie" >${train.trainJianjie}</textarea>
                    </td>                
                </tr>

				<tr>
                    <td>培训资料：</td>
                    <td>
	                    <c:choose>
		                    <c:when test="${train.trainZiliao !=null && train.trainZiliao != ''}">
		                    	<input type="text" name="trainZiliao" value="${train.trainZiliao}">
		                    </c:when>
		                    <c:otherwise>
		                    	<input type="file" name="file"/>
		                    </c:otherwise>
	                    </c:choose>
                    </td>
                                 
                </tr>

				<!-- <tr>
                    <td></td>
                    <td>
                        <a href="" >技术专家和教学专家的合作.zip</a> &nbsp;&nbsp;<a href="">删除</a>
                    </td>                
                </tr> -->
				
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="保存"	 onclick="saveTrain(0);"> 
						<input type="submit" value="申请复核"	onclick="saveTrain(1);">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
</body>
</html>