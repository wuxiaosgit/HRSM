<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/html/";
%>

<!DOCTYPE html>
<html>

<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	   <title>个人信息</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：工作平台-》个人信息</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="./admin.php?c=goods&a=showlist">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../user/gerenUser.do" method="post" enctype="multipart/form-data">
          <input type="hidden" name="userId" value="${user.userId }" />
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px">姓名</td>
                    <td>
						<input type="text" name="userName" value="${user.userName }"/>
					</td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td>
                       	<input type="radio" name="userGender" 
                       	<c:if test="${user.userGender eq 1 }"> checked </c:if>
                       	 value="1"/>男
                       	<input type="radio" name="userGender" 
                       	<c:if test="${user.userGender eq 0 }"> checked </c:if>
                       	 value="0"/>女 
                    </td>
                </tr>
              
                <tr>
                    <td>身份证号：</td>
                    <td>
						<input type="text" name="userIdcard" value="${user.userIdcard }"/>
					</td>
                </tr>
                <tr>
                    <td>办公电话：</td>
                    <td>
						<input type="text" name="userTelephone" value="${user.userTelephone }"/>
					</td>
                </tr>
                <tr>
                    <td>手机：</td>
                    <td>
                       	<input type="text" name="userPhone" value="${user.userPhone }"/>
                    </td>
                </tr>
				<tr>
                    <td>邮箱：</td>
                    <td>
                        	<input type="text" name="userEmail" value="${user.userEmail }" />
                    </td>
                </tr>
				<tr>
                    <td>更换头像：</td>
                    <td>
						<input type="file" name="file" />
					</td>
                </tr>
				<tr>
                    <td>备注：</td>
                    <td>
                        <textarea name="userRemark" >${user.userRemark }</textarea>
                    </td>
                </tr>
                
				
				
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="修改">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>