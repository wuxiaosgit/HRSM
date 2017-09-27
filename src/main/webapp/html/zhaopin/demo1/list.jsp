<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

<title>会员列表</title>
<script language="javascript" type="text/javascript" src="../html/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function showMsg() {
		var msg = document.getElementById("msg").value;
		if (msg != null && msg != "") {
			alert(msg);
		}
	}
	function tiaozhuan(){
	
		var num =document.getElementById("num").value;
		alert(num);
		var totlePages = document.getElementById("tp").value;
		alert(totlePages);
		if(num < 1 || num > totlePages){
			if(totlePages != 1){
				alert("请输入1到"+totlePages+"的数字!");
			}else{
				alert("数据只有1页!");
			}
		}else{
			location.href="../zhaopin/selectZhaoRoleDeptPages.do?pageNum="+num;
		}
	}
</script>
<link href="../html/css/mine.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<style>
.tr_color {
	background-color: #9F88FF
}
</style>
	<div class="div_head">
		<span> <span style="float: left;">当前位置是：招聘管理-》职位发布管理</span> <span
			style="float: right; margin-right: 8px; font-weight: bold;"> <a
				style="text-decoration: none;" href="../zhaopin/SelectRoleDept.do">【添加】</a>
		</span>
		</span>
	</div>
	<div></div>
	<div class="div_search">
			<form action="../zhaopin/selectZhaoRoleDeptPage.do" method="post">
				职位名称:
				<input type="text" name="roleName" value="${roleName1 }" id="demo1_input_roleId" /> 
				
				职位分类:
				
				<input type="text" name="deptShortName" value="${deptShortName1 }"  />
				
				 登记日期:
				<input type="text" name="startTime" value="${startTime1 }"
					onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				截止日期:
				<input type="text" name="endTime" value="${endTime1 }"
					onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				<input value="查询" type="submit" />
			</form>
	</div>
	<!--  <div style="font-size: 13px; margin: 10px 5px;">
		  <p><a href="add.html"><button style="background-color:#E8F2FC">职位发布登记 </button></a></p>
		  </div> -->
	<div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_a" border="1" width="100%">
			<tbody>
				<tr style="font-weight: bold;">
					<td width="40px;">职位编码</td>
					<td width="40px;">职位名称</td>
					<td width="40px;">职位分类</td>
					<td width="40px;">所属部门</td>
					<td width="40px;">招聘人数</td>
					<td width="40px;">登记日期</td>
					<td width="40px;">截止日期</td>
					<td align="center" width="70px;">操作</td>
				</tr>
				<c:forEach items="${list}" var="list">
					<tr id="product1">
						<td>${list.roleBean.roleNumber}</td>
						<td><a
							href="../zhaopin/selectAZhaoRoleDept.do?zhaopinId=${list.zhaopinId}&method=view">${list.roleBean.roleName}</a></td>
						<td>${list.roleBean.deptBean.deptShortName }</td>
						<td>${list.roleBean.deptBean.deptName }</td>
						<td>${list.zhaopinNum }</td>
						<td>${list.startTime}</td>
						<td>${list.endTime }</td>
						<td><a
							href="../zhaopin/selectByPrimaryKey.do?zhaopinId=${list.zhaopinId}&method=change">变更</a>
							&nbsp;&nbsp; <a
							href="../zhaopin/updateByPrimaryKeySelective.do?zhaopinId=${list.zhaopinId}&method=del">删除</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="8" style="text-align: center;">
					<input type="hidden" value="${totlePages }" id="tp" />
					<span>显示第${(pageNum-1)*pageRows +1 }条到<c:choose>
								<c:when test="${((pageNum-1)*pageRows +pageRows) <= totleRows }">
				${(pageNum-1)*pageRows +pageRows }
			    </c:when>
								<c:otherwise>
				${totleRows }
			</c:otherwise>
							</c:choose>条记录，总共${totleRows }条
					</span> <span> <a href="../zhaopin/selectZhaoRoleDeptPages.do?pageNum=1">首页</a> <c:if
								test="${pageNum == 1 }">
				上一页
			</c:if> <c:if test="${pageNum > 1 }">
								<a href="../zhaopin/selectZhaoRoleDeptPages.do?pageNum=${pageNum-1 }">上一页</a>
							</c:if> <c:forEach begin="1" end="${totlePages }" step="1" var="pn">
								<c:if test="${pn == pageNum }">${pn }</c:if>
								<c:if test="${pn != pageNum }">
									<a href="../zhaopin/selectZhaoRoleDeptPages.do?pageNum=${pn }">${pn }</a>
								</c:if>
							</c:forEach> <c:if test="${pageNum == totlePages }">
				下一页
			</c:if> 
			<c:if test="${pageNum < totlePages }">
				<a href="../zhaopin/selectZhaoRoleDeptPages.do?pageNum=${pageNum+1 }">下一页</a>
			</c:if> <a href="../zhaopin/selectZhaoRoleDeptPages.do?pageNum=${totlePages }">尾页</a> 转到
			<input type="number" style="width: 50px" id="num" />页 
			<input type="button" value="GO" onclick="tiaozhuan()" /></span></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
