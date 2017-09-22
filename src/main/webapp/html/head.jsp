<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path +"/html/";
%>

<!DOCTYPE html>
<html>

<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	 <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <link href="./css/admin.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <table cellspacing=0 cellpadding=0 width="100%"  background="./img/header_bg.jpg" border=0>
            <tr height=56>
                <td width=520 style="font-size:28px;color:white">
					银杏树信息技术服务(北京)有限公司
				</td>
                <td style="font-weight: bold; color: #fff; padding-top: 20px" 
                    >当前用户：${user.userName} &nbsp;&nbsp; 
					<a style="color: #fff"  href=""  target=main>修改口令</a> 
					&nbsp;&nbsp; 
					<a style="color: #fff"  href="../html/login.jsp" target=_top>退出系统</a> 
														<!-- onclick="if (confirm('确定要退出吗？')) return true; else return false;"  -->
                </td>
                <td align=right width=268><a href="index.html"><img height=56 
                                               src="./img/header_right.jpg" width=268></a></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="100%" border=0>
            <tr bgcolor=#1c5db6 height=4>
                <td></td>
            </tr>
        </table>
    </body>
</html>