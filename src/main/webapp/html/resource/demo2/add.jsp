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
<!-- 验证框架 -->
<script type="text/javascript" src="js/jquery.validate.js"></script>
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
	function f(user1){
		var roleId=$("#roleId").val();
		var deptId=$("#deptId").val();
		//var userLogin=$("#1").val();
		var id=$("#6").val();
		 if (deptId == -1) {
			 alert("请选择部门");
			 return false;
		}
		 if (roleId == -1 ) {
			 alert("请选择角色");
			 return false;
		}
		 if (user1 == null ) {
			 //添加
		return ajaxLogin(userLogin);
		}else{
			//修改
			return true;
		}
	}
	
	function ajaxLogin(obj){
		var flagAjax="test";
		$.ajax({
    		type:"POST",
    		url:"../user/ajaxLogin.do?ajaxLogin="+obj,
    		async:false,
    		success:function(result) {
    			flagAjax=result;
    		}
    	});
		if (flagAjax == "no") {
			$("#4").html("数据库没有");
					return true;
		}else if(flagAjax == "yes"){
			$("#4").html("数据库有了,请换一个账号");
				return false;
		}
		return false;
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
		<form id="form" action="../user/insertUser.do" method="post" onsubmit="return f(${user1});">
			<input type="hidden" id=6 name="userId" value="${user1.userId }" />
			<table border="1" width="100%" class="table_a">
				<tr>
					<td>登录账号<span style="color: red">*</span>：
					</td>
					<td>
					<c:choose>
							<c:when test="${user1 eq null }">
					<input required="required" type="text" id=1 name="userLogin" value="${user1.userLogin }" onblur="ajaxLogin(this.value)"/>
					<span id=4></span>
							</c:when>
							<c:otherwise>
					<input required="required" type="text" id=1 name="userLogin" value="${user1.userLogin }" />
							</c:otherwise>
						</c:choose>
					</td>
				</tr>

				<tr>
					<td>用户姓名<span style="color: red">*</span>：
					</td>
					<td><input required="required" type="text" id=2 name="userName" value="${user1.userName }" /></td>
				</tr>
				<tr>
					<td>密码<span style="color: red">*</span>：
					</td>
					<td><input required="required" type="password" id=3 name="userPassword"
						value="${user1.userPassword }" /></td>
				</tr>
				<tr>
					<td>所属部门<span style="color: red">*</span>：
					</td>
					<td><select name="deptId" id=deptId required="required" onchange="selectrole(this.value);">

							<option value="-1">--必须选择--</option>
							<c:forEach items="${deptBeans }" var="item">
								<option value="${item.deptId }" <c:if test="${user1.roleBean.deptId eq item.deptId }">selected="selected"</c:if> >${item.deptName }</option>
							</c:forEach>

					</select></td>
				</tr>
				<tr>
					<td>所属职位<span style="color: red">*</span>：
					</td>
					<td><select name="roleId" id="roleId" required="required">
						<c:choose>
							<c:when test="${user1 eq null }">
								<option value="-1">--请选择--</option>
							</c:when>
							<c:otherwise>
								<option value="${user1.roleBean.roleId }">${user1.roleBean.roleName }</option>
							</c:otherwise>
						</c:choose>

					</select></td>
				</tr>



				<tr>
					<td>身份证<span style="color: red">*</span>：
					</td>
					<td><input type="text" id=4 name="userIdcard"
						value="${user1.userIdcard }" /></td>
				</tr>

				<tr>
					<td>联系电话<span style="color: red">*</span>：
					</td>
					<td><input type="text" id=5 name="userPhone" value="${user1.userPhone }" />
					</td>
				</tr>

				<tr>
					<td>邮箱<span style="color: red">*</span>：
					</td>
					<td><input type="text" id=6 name="userEmail" value="${user1.userEmail }" />
					</td>
				</tr>

				<tr>
					<td>联系地址：</td>
					<td><input type="text" name="userAddress" id=7
						value="${user1.userAddress }" /></td>
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