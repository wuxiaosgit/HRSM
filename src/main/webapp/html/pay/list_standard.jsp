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
        <link href="../../css/mine.css" type="text/css" rel="stylesheet" />
    </head>
 <script type="text/javascript">
	function checkall() {
		var alls = document.getElementsByName("check");
		var ch = document.getElementById("checkall");
		if (ch.checked) {
			for ( var i = 0; i < alls.length; i++) {
				alls[i].checked = true;
			}
		} else {
			for ( var i = 0; i < alls.length; i++) {
				alls[i].checked = false;
			}
		}
	}
	function delAll() {
		var alls = document.getElementsByName("check");
		var ids = new Array();
		for ( var i = 0; i < alls.length; i++) {
			if (alls[i].checked) {
				ids.push("ids=" + alls[i].value);
			}
		}
		var params = ids.join("&");
		if (ids.length > 0) {
			if (confirm("确认操作?")) {
				window.location.href = "deleteList.do?" + params;
			}
		} else {
			alert("请选中要操作的项");
		}
	}
    </script>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：薪酬管理-》薪酬标准管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="http://localhost:8080/YXSS/html/pay/standard_add.jsp">【添加】</a>
					<a style="text-decoration: none;" href="javascript:delAll()">【删除】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="list.do" method="post">
                  		  薪酬标准编码: 
					<input type="text" name="wagebmm" value="${wageBm}"/>
					 审核状态: 
					<select name="wagestat">
						<option  value="0" 
						<c:if test="${wagestat eq 0}"> selected="selected"</c:if>
						>-- 请选择--</option>
						
						<option  value="1" 
						<c:if test="${wagestat eq 1}"> selected="selected"</c:if>
						>-- 审核中--</option>
						
						<option  value="2"
						<c:if test="${wagestat eq 2}"> selected="selected"</c:if>
						>-- 已通过--</option>
					</select>
					   <input value="查询" type="submit" />
                </form>
            </span>
        </div>
	<div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_a" border="1" width="100%">
			<tbody>
				<tr style="font-weight: bold;">
					<td width="40px;">序号</td>
					<td width="30px;"><input type="checkbox" id="checkall"
						onchange="checkall()" /></td>
					<td width="80px;">薪酬编码</td>
					<td>薪酬标准类型</td>
					<td width="100px;">审核状态</td>
					<td width="120px;">时间</td>
					<td align="center" width="100px;">操作</td>
				</tr>
				<c:set var="index" value="1"></c:set>
				<c:forEach items="${list}" var="wage">
					<tr id="product1">
						<td>${index}</td>
						<c:set var="index" value="${index+1}"></c:set>
						<td><input type="checkbox" name="check"
							value="${wage.wageId}" /></td>
						<td id="bm">${wage.wageBm}</td>
						<td><a href=" standard_view.do?wageId=${wage.wageId}">${wage.wageName}</a></td>
						<c:if test="${wage.wageStatment=='0'}">
							<td>正在写</td>
						</c:if>
						<c:if test="${wage.wageStatment=='1'}">
							<td>审核中</td>
						</c:if>
						<c:if test="${wage.wageStatment=='2'}">
							<td>审核通过</td>
						</c:if>
						<td>${wage.wageDate}</td>
						<td><a href="standard_update.do?wageId=${wage.wageId }">修改</a>
							<a
							href="javascript:if(confirm('确定删除？')){location.href='wagedelete.do?wageId=${wage.wageId }'};">删除</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="20" style="text-align: center;">
							<c:if test="${page.pageNum==1}">
		             			首页&nbsp;&nbsp;&nbsp;&nbsp;
			 				        上一页&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if> 
							<c:if test="${page.pageNum > 1 }">
							<a href="list.do?pageNum=1&wagebmm=${wageBm }&wageStat=${wageStat}">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="list.do?pageNum=${page.pageNum - 1 }&wagebmm=${wageBm }&wageStat=${wageStat}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if> 
							<c:if test="${page.pageNum == page.totlePages}">
									 下一页&nbsp;&nbsp;&nbsp;&nbsp;
			 					           尾页&nbsp;&nbsp;&nbsp;&nbsp;
							 </c:if> 
							 <c:if test="${page.pageNum != page.totlePages }">
							 <a href="list.do?pageNum=${page.pageNum + 1 }&wagebmm=${wageBm }&wageStat=${wageStat}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
							 <a href="list.do?pageNum=${page.totlePages}&wagebmm=${wageBm }&wageStat=${wageStat}">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
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