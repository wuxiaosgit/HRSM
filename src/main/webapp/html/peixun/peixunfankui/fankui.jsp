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
		$("#formId").submit();
	}
</script>

<body>
	<div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》培训管理 -》培训反馈</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="../train/fankuiList.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../train/updateFuheTrain.do" method="post">
            <input type="hidden" name="trainState" id="train_state" value="${train.trainState}">
            <input type="hidden" name="trainId" value="${train.trainId}">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">培训名称<span style="color:red">*</span>：</td>
                    <td><input type="text" name="trainName" readonly="readonly" value="${train.trainName}"/></td>
                </tr>
                <tr>
                    <td>培训讲师<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="trainTeacher" readonly="readonly" value="${train.trainTeacher}" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>培训时间<span style="color:red">*</span>：</td>
                    <td><input type="text" name="trainStarttime" readonly="readonly" value="${train.trainStarttime}"/></td>
                </tr>
                <tr>
                    <td>至</td>
                    <td><input type="text" name="trainEndtime" readonly="readonly" value="${train.trainEndtime }"/></td>
                </tr>
                <tr>
                    <td>培训目的<span style="color:red">*</span>：</td>
                    <td><textarea name="trainGoal" readonly="readonly" >${train.trainGoal}</textarea>
                    </td>
                </tr>

				<tr>
                    <td>参训人员<span style="color:red">*</span>：</td>
                    <td><textarea name="trainPeople" readonly="readonly">${train.trainPeople}</textarea>
                    </td>                
                </tr>

				<tr>
                    <td>培训简介：</td>
                    <td>
                    <textarea name="trainJianjie" readonly="readonly">${train.trainJianjie}</textarea>
                    </td>                
                </tr>

				<tr>
                    <td>培训资料：</td>
                    <td>
	                    <c:choose>
		                    <c:when test="${train.trainZiliao !=null && train.trainZiliao != ''}">
		                    	<input type="text" name="trainZiliao" readonly="readonly" value="${train.trainZiliao}">
		                    </c:when>
		                    <c:otherwise>
		                    	<input type="file" name="file"/>
		                    </c:otherwise>
	                    </c:choose>
                    </td>
                                 
                </tr>
                
                <tr>
                    <td>审核意见：</td>
                    <td>
                    <textarea name="trainAdvice" readonly="readonly" >${train.trainAdvice}</textarea>
                    </td>                
                </tr>
                <tr>
                	<label>培训反馈</label><br/>
                	<td>培训反馈:</td>
                	<select name="trainFeekBack">
                		<option value="">请选择</option>
                		<option value="1">优</option>
                		<option value="2">良</option>
                		<option value="3">差</option>
                	</select>
                </tr>
                <tr>
	                <td>培训总结:</td>
	                <td><textarea name="trainSumup">${train.trainSumup}</textarea></td>
                </tr>
                <tr>
	                <td>考核结果:</td>
	                <td><textarea name="trainResult" >${train.trainResult}</textarea></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="保存"	 onclick="saveTrain(2);"> 
                    </td>
                </tr>  
            </table>
            </form>
        </div>
</body>
</html>