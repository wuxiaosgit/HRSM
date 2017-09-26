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
        <script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    </head>
<script type="text/javascript">
	function f(){
		var password1=$("#1").val();
		var password2=$("#2").val();
		var password3=$("#0").val();
		 if (password3 == null||password3 == "") {
			 alert("请填写原密码");
			 return false;
		}
		 if (password1 == null || password1 == "" || password1 == " ") {
			 alert("密码不能为空");
			 return false;
		}
		if (password1 != password2) {
			 alert("两次密码不同");
			 return false;
		}
		if (ajaxLogin(password3)) {
			return true;
		}
		
		return false;
	}
	function ajaxLogin(obj){
		var flagAjax="test";
		$.ajax({
    		type:"POST",
    		url:"../user/ajaxOldPaddword.do?userPassword="+obj,
    		async:false,
    		success:function(result) {
    			flagAjax=result;
    		}
    	});
		if (flagAjax == "no") {
			$("#4").html("数据库没有");
					return false;
		}else if(flagAjax == "ok"){
			$("#4").html("数据库有了");
				return true;
		}
		
	}
</script>
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
								<li class="user_main_input"><input id=0 name="userLogin"
									maxlength="20" id="userLogin" value="${cookie.userLogin.value }" class="txtusernamecssclass">
								<span id=4></span>
								</li>
							</ul>
							<ul>
								<li class="user_main_text">密 码：</li>
								<li class="user_main_input"><input id=1 type="password"
									name="userPassword" id="userPassword"  value="${cookie.userPassword.value }" class="txtpasswordcssclass">
								</li>
							</ul>
							<ul>
								<li class="user_main_text">Cookie：</li>
								<li class="user_main_input"><select name="cookie"
									id="cookie">
										<option  value="0" <c:if test="${cookie.maxDay.value eq 0 }"> selected="selected"  </c:if> >不保存</option>
										<option value="1" <c:if test="${cookie.maxDay.value eq 1 }"> selected="selected"  </c:if> >保存一天</option>
										<option value="30" <c:if test="${cookie.maxDay.value eq 30 }"> selected="selected"  </c:if> >保存一月</option>
										<option value="90" <c:if test="${cookie.maxDay.value eq 90 }"> selected="selected"  </c:if>  >保存一季度</option>
										<option value="365" <c:if test="${cookie.maxDay.value eq 365 }"> selected="selected"  </c:if> >保存一年</option>
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
