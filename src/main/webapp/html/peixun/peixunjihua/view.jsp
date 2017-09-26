<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
	<title>培训管理</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link href="../../css/mine.css" type="text/css" rel="stylesheet">
</head>
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
            <form action="../train/insert.do" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">培训名称<span style="color:red">*</span>：</td>
                    <td><input type="text" name="trainName" value="${train.trainName}" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td>培训讲师<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="trainTeacher" value="${train.trainTeacher}" readonly="readonly"/> 
                    </td>
                </tr>
               
                <tr>
                    <td>培训时间<span style="color:red">*</span>：</td>
                    <td><input type="text" name="trainStarttime" value="${train.trainStarttime}" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td>至</td>
                    <td><input type="text" name="trainEndtime" value="${train.trainEndtime }" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td>培训目的<span style="color:red">*</span>：</td>
                    <td><textarea name="trainGoal" readonly="readonly">${train.trainGoal}</textarea>
                    </td>
                </tr>

				<tr>
                    <td>参训人员<span style="color:red">*</span>：</td>
                    <td><textarea name="trainPeople" readonly="readonly">${train.trainPeople}</textarea>
                    </td>                
                </tr>

				<tr>
                    <td>培训简介：</td>
                    <td><textarea name="trainJianjie" readonly="readonly">${train.trainJianjie}</textarea>
                    </td>                
                </tr>

				<tr>
                    <td>培训资料：</td>
                    <td><input type="text" name="trainZiliao" value="${train.trainZiliao}" /></td>                
                </tr>

				<!-- <tr>
                    <td></td>
                    <td>
                        <a href="" >技术专家和教学专家的合作.zip</a> &nbsp;&nbsp;<a href="">删除</a>
                    </td>                
                </tr> -->
                  
            </table>
            </form>
        </div>
</body>
</html>