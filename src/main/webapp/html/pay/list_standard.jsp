<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/html/pay/";
%> 
<!-- 审核页面 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <title>薪酬标准管理</title>

        <link href="../css/mine.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：薪酬管理-》薪酬标准管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="http://localhost:8080/YXSS/html/pay/standard_add.jsp">【添加】</a>
					<a style="text-decoration: none;" href="#">【删除】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="queryListByLike.do" method="post">
                  		  薪酬标准类型: 
					<input type="text" name="wagebmm" />
					 审核状态: 
					<select name="wagestat">
						<option  value="0">-- 请选择--</option>
						<option  value="1">-- 审核中--</option>
						<option  value="2">-- 已通过--</option>
					</select>
					   <input value="查询" type="submit" />
                </form>
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td width="40px;">序号</td>
                        <td width="30px;"><input type="checkbox" /></td>						
                        <td width="80px;">薪酬编码</td>
                        <td >薪酬标准类型</td>
						<td width="100px;">审核状态</td>
                        <td width="120px;">时间</td>                       
                        <td align="center" width="100px;">操作</td>
                    </tr>
                    <c:set var="index" value="1"></c:set>
                    <c:forEach items="${list}" var="wage" >
                    	<tr id="product1">
                        <td>${index}</td>
                        <c:set var="index" value="${index+1}"></c:set>
                        <td><input type="checkbox" /></td>
						<td id="bm">${wage.wageBm}</td>
                        <td><a href=" standard_view.do?wageId=${wage.wageId}">${wage.wageName}</a></td> 
						<%-- <td>${wage.wageStatment}</td> --%>
					    <c:choose>
							<c:when test="${wage.wageStatment=='0'}"><td>正在写</td></c:when>
							<c:when test="${wage.wageStatment=='1'}"><td>审核中</td></c:when>
							<c:when test="${wage.wageStatment=='2'}"><td>审核通过</td></c:when>
						</c:choose>
						<%-- <c:if test="${wage.wageStatment=='0'}"><td>正在写</td></c:if>
						<c:if test="${wage.wageStatment=='1'}"><td>审核中</td></c:if>
						<c:if test="${wage.wageStatment=='2'}"><td>审核通过</td></c:if> --%>
						<td>${wage.wageDate}</td>
                        <td>
							<a href="standard_update.do?wageId=${wage.wageId }">修改</a>						   
							<a href="javascript:if(confirm('确定删除？')){location.href='wagedelete.do?wageId=${wage.wageId }'};">删除</a>
						</td>                        
                    </tr> 
                    </c:forEach>
                    <tr>
                        <td colspan="20" style="text-align: center;">						
						<a style="text-decoration: none;" href="#">
                            首页 上一页  ... 7 8 9 10 11 12 ... 下一页 尾页 共1234条 每页显示 10/23 </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>