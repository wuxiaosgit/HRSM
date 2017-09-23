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
<meta charset="utf-8" />
<title>用户管理</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link href="css/mine.css" type="text/css" rel="stylesheet">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<script type="text/javascript">
	function selectrole(obj) {
		$.post("../role/ajaxRole.do", {
			deptId : obj
		}, function(result) {
			var role = document.getElementById("roleId");
			role.innerHTML = "";
			role.add(new Option("--请选择--", -1), null);
			for ( var sss in result) {
				role.add(new Option(result[sss].roleName, result[sss].roleId),
						null);
			}
		});

	}
</script>
<body>

	<div class="div_head">
		<span> <span style="float: left">当前位置是：-》资源管理》用户管理</span> <span
			style="float: right; margin-right: 8px; font-weight: bold"> <a
				style="text-decoration: none" href="../user/selectUser.do">【返回】</a>
		</span>
		</span>
	</div>
	<div></div>

	<div style="font-size: 13px; margin: 10px 5px">
		<form action="../user/insertUser.do" method="post">
			<input type="hidden" name="userId" value="${user.userId }" />
			<table border="1" width="100%" class="table_a">
				<tr>
					<td>登录账号<span style="color: red">*</span>：
					</td>
					<td><input type="text" id=1 name="userLogin" value="${user.userLogin }" />
					</td>
				</tr>

				<tr>
					<td>用户姓名<span style="color: red">*</span>：
					</td>
					<td><input type="text" id=2 name="userName" value="${user.userName }" /></td>
				</tr>
				<tr>
					<td>密码<span style="color: red">*</span>：
					</td>
					<td><input type="password" id=3 name="userPassword"
						value="${user.userPassword }" /></td>
				</tr>
				<tr>
					<td>所属部门<span style="color: red">*</span>：
					</td>
					<td><select name="deptId" onchange="selectrole(this.value);">

							<option value="-1">--请选择--</option>
							<c:forEach items="${deptBeans }" var="item">
								<option value="${item.deptId }">${item.deptName }</option>

							</c:forEach>

					</select></td>
				</tr>
				<tr>
					<td>所属职位<span style="color: red">*</span>：
					</td>
					<td><select name="roleId" id="roleId">
							<option value="-1">--请选择--</option>

					</select></td>
				</tr>



				<tr>
					<td>身份证<span style="color: red">*</span>：
					</td>
					<td><input type="text" id=4 name="userIdcard"
						value="${user.userIdcard }" /></td>
				</tr>

				<tr>
					<td>联系电话<span style="color: red">*</span>：
					</td>
					<td><input type="text" id=5 name="userPhone" value="${user.userPhone }" />
					</td>
				</tr>

				<tr>
					<td>邮箱<span style="color: red">*</span>：
					</td>
					<td><input type="text" id=6 name="userEmail" value="${user.userEmail }" />
					</td>
				</tr>

				<tr>
					<td>联系地址：</td>
					<td><input type="text" name="userAddress" id=7
						value="${user.userAddress }" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<button type="submit">提交</button>
					<button type="button" onclick="kong()">清空</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
function kong(){
	$("#1").val("");
	$("#2").val("");
	$("#3").val("");
	$("#4").val("");
	$("#5").val("");
	$("#6").val("");
	$("#7").val("");
	
}
</script>
</html>