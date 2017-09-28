<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/html/pay/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 全部查询并且展示 -->
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

<title>薪酬标准管理</title>

<link href="../css/mine.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<style>
.tr_color {
	background-color: #9F88FF
}
</style>
	<div class="div_head">
		<span> <span style="float: left;">当前位置是：薪酬管理-》薪酬标准管理</span> <span
			style="float: right; margin-right: 8px; font-weight: bold;"> </span>
		</span>
	</div>
	<div></div>
	<div class="div_search">
		<span>
			<form action="selectBySta.do" method="get">
				薪酬标准编号: <input type="text" name="wageBm" value="${wageBm}"/> <input value="查询" type="submit" />
			</form>
		</span>
	</div>
	<div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_a" border="1" width="100%">
			<tbody>
				<tr style="font-weight: bold;">
					<td width="40px;">序号</td>
					<td width="80px;">薪酬编码</td>
					<td>薪酬标准类型</td>
					<td width="100px;">审核状态</td>
					<td width="120px;">时间</td>
					<td align="center" width="100px;">操作</td>
				</tr>
				<c:forEach items="${list}" var="wage">
					<tr id="product1">
						<td>2</td>
						<td>${wage.wageBm}</td>
						<td><a href="standard_view_sp.do?wageId=${wage.wageId }">${wage.wageName}</a></td>
						<c:choose>
							<c:when test="${wage.wageStatment=='0'}"><td>正在写</td></c:when>
							<c:when test="${wage.wageStatment=='1'}"><td>审核中</td></c:when>
							<c:when test="${wage.wageStatment=='2'}"><td>审核通过</td></c:when>
						</c:choose>
						<td>${wage.wageDate}</td>
						<td><a href="auditing.do?wageId=${wage.wageId}">审核</a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="20" style="text-align: center;">
							<c:if test="${page.pageNum==1}">
		             			首页&nbsp;&nbsp;&nbsp;&nbsp;
			 				        上一页&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if> 
							<c:if test="${page.pageNum > 1 }">
							<a href="selectBySta.do?pageNum=1&wagebmm=${wageBm }">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="selectBySta.do?pageNum=${page.pageNum - 1 }&wagebmm=${wageBm }">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if> 
							<c:if test="${page.pageNum == page.totlePages}">
									 下一页&nbsp;&nbsp;&nbsp;&nbsp;
			 					           尾页&nbsp;&nbsp;&nbsp;&nbsp;
							 </c:if> 
							 <c:if test="${page.pageNum != page.totlePages }">
							 <a href="selectBySta.do?pageNum=${page.pageNum + 1 }&wagebmm=${wageBm }">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
							 <a href="selectBySta.do?pageNum=${page.totlePages}&wagebmm=${wageBm }">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
			 				 </c:if> 当前页 ${page.pageNum }&nbsp;&nbsp;&nbsp;&nbsp;
						分页单位${page.pageRows }&nbsp;&nbsp;&nbsp;&nbsp; 总页数${page.totlePages }&nbsp;&nbsp;&nbsp;&nbsp;
						总条数${page.totleRows }
						</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>