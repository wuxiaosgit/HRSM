<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/html/";
%>

<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<title>职位管理</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link href="css/mine.css" type="text/css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js" type="text/javascript"
	charset="utf-8"></script>
</head>
<script type="text/javascript">

	function testdeptId() {
		var deptId = document.getElementById("deptId").value;
		if (deptId == -1) {
			alert("部门必须选择");
			return false;
		} else {
			return true;
		}
	}
	
	function c(){
		
			 var alls = document.getElementsByName("menu");
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
	function confirm() {

		if (testdeptId()) {
			return true;
		}

		return false;
	}
</script>

<body>

	<div class="div_head">
		<span> <span style="float: left">当前位置是：-》职位管理</span> <span
			style="float: right; margin-right: 8px; font-weight: bold"> <a
				style="text-decoration: none" href="../role/selectRole.do">【返回】</a>
		</span>
		</span>
	</div>
	<div></div>

	<div style="font-size: 13px; margin: 10px 5px">
		<form action="../role/insertRole.do" method="post"
			onsubmit="return confirm();" enctype="multipart/form-data">
			<input type="hidden" name="roleId" value="${roleBean.roleId }">
			<table border="1" width="100%" class="table_a">
				<tr>
					<td width="120px;">职位编码<span style="color: red">*</span>：
					</td>
					<td><input type="text" required="required" name="roleNumber"
						value="${roleBean.roleNumber }" /></td>
				</tr>

				<tr>
					<td>职位名称<span style="color: red">*</span>：
					</td>
					<td><input type="text" required="required" name="roleName"
						value="${roleBean.roleName }"/> <span id="nameInfo"></span></td>
				</tr>

				<tr>
					<td>所属部门<span style="color: red">*</span>：
					</td>
					<td><select name="deptId" id="deptId" required="required">
							<option value="-1">--请选择--</option>
							<c:forEach items="${deptBeans }" var="item">
								<option value="${item.deptId }"
									<c:if test="${roleBean.deptId eq item.deptId  }">selected="selected"</c:if>>${item.deptName }</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<td>菜单权限<span style="color: red">*</span>：<br>
					 <input type="checkbox" onChange="c()" id="checkall"/>
					</td>
					<td><c:forEach items="${menus }" var="top">
							<input type="checkbox" name="menu"
								<c:forEach items="${roleMenus }" var="roleMenu">
									<c:if test="${roleMenu.menuId eq top.menuId  }">
					  checked="checked"
                   	 </c:if>
						</c:forEach>
								value="${top.menuId }" />${top.menuName }<br />
							<c:forEach items="${top.menuList }" var="item">
						&nbsp;&nbsp;&nbsp;<input type="checkbox" name="menu"
									<c:forEach items="${roleMenus }" var="roleMenu">
										<c:if test="${roleMenu.menuId eq top.menuId  }">
					  checked="checked"
                    </c:if>
						</c:forEach>
									value="${item.menuId }" />${item.menuName }<br />
							</c:forEach>
						</c:forEach></td>
				</tr>


				<tr>
					<td>职位描述<span style="color: red">*</span>：
					</td>
					<td><textarea name="roleDescribe">
                        ${roleBean.roleDescribe }
                        </textarea></td>
				</tr>

				<tr>
					<td>备 注：</td>
					<td><textarea name="roleRemark">
                        ${roleBean.roleRemark }
                        </textarea></td>
				</tr>
				<tr>
					<td>是否启用：</td>
					<td><select name="roleState">

							<option value="1"
								<c:if test="${roleBean.roleState eq 1 }">selected="selected"</c:if>>是</option>
							<option value="0"
								<c:if test="${roleBean.roleState eq 0 }">selected="selected"</c:if>>否</option>
					</select></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="添加">
						<input type="reset" value="清空"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
