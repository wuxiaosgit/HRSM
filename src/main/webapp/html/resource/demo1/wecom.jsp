<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/html/";
%>

<!doctype html public "-//w3c//dtd xhtml 1.0 frameset//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-frameset.dtd">
<html>

<head>
	<base href="<%=basePath%>">
	 <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <link href="css/admin.css" type="text/css" rel="stylesheet" />

    </head>
    <body>
        <table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
            <tr height=28>
                <td background=img/title_bg1.jpg>&nbsp;&nbsp;当前位置: </td></tr>
            <tr>
                <td bgcolor=#b1ceef height=1></td></tr>
            <tr height=20>
                <td background=img/shadow_bg.jpg></td></tr></table>
        <table cellspacing=0 cellpadding=0 width="90%" align=center border=0>
            <tr height=100>
                <td align=middle width=100>
					<img height=100 src="img/admin_p.gif"  width=90>
				</td>
                <td width=60>&nbsp;</td>
                <td>
                    <table height=100 cellspacing=0 cellpadding=0 width="100%" border=0>

                        <tr>
                         <td><a href="../dept/getTopDept.do">添加部门</a></td>
						</tr>
						
                        <tr>
                            <td style="font-weight: bold; font-size: 16px">当前用户：${user.userName} &nbsp;&nbsp;</td>
						</tr>
                        
						<tr>
                            <td>欢迎进入网站管理中心！</td></tr></table></td>
						</tr>
            <tr>
         <td colspan=3 height=10></td></tr></table>
       

    </body>
</html>