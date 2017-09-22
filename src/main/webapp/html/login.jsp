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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>

<link href="css/login.css" type="text/css" rel="stylesheet" />

</head>
<body id="userlogin_body">

	<div id="user_login">
		<dl>
			<dd id="user_top">
				<ul>
					<li class="user_top_l"></li>
					<li class="user_top_c"></li>
					<li class="user_top_r"></li>
				</ul>
			</dd>
			<dd id="user_main">
			<form action="../user/login.do" method="post">
				<ul>
					<li class="user_main_l"></li>
					<li class="user_main_c">
						<div class="user_main_box">
							<ul>
								<li class="user_main_text">用户名：</li>
								<li class="user_main_input"><input name="userLogin"
									maxlength="20" id="userLogin" class="txtusernamecssclass">
								</li>
							</ul>
							<ul>
								<li class="user_main_text">密 码：</li>
								<li class="user_main_input"><input type="password"
									name="userPassword" id="userPassword" class="txtpasswordcssclass">
								</li>
							</ul>
							<ul>
								<li class="user_main_text">Cookie：</li>
								<li class="user_main_input"><select name="DropExpiration"
									id="DropExpiration">
										<option selected="" value="None">不保存</option>
										<option value="Day">保存一天</option>
										<option value="Month">保存一月</option>
										<option value="Year">保存一年</option>
								</select></li>
							</ul>
						</div>
					</li>
					<li class="user_main_r"><a href="index.jsp"> <input
							type="image" id="image" src="img/user_botton.gif"
							class="ibtnentercssclass">
					</a></li>
				</ul>
				</form>
			</dd>
			<dd id="user_bottom">
				<ul>
					<li class="user_bottom_l"></li>
					<li class="user_bottom_c"></li>
					<li class="user_bottom_r"></li>
				</ul>
			</dd>
		</dl>
	</div>


</body>
</html>
