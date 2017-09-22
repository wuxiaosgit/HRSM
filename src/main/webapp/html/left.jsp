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
	 <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <link href="css/admin.css" type="text/css" rel="stylesheet" />
        <script language=javascript>
            function expand(el)
            {
                childobj = document.getElementById(el);

                if (childobj.style.display == 'none')
                {
                    childobj.style.display = 'block';
                }
                else
                {
                    childobj.style.display = 'none';
                }
                return;
            }
        </script>
    </head>
    <body background=img/menu_bg.jpg >
        <table height="100%" cellspacing=0 cellpadding=0 width=170   background=./img/menu_bg.jpg border=0>
            <tr>
                <td valign=top align=middle>
                    <table cellspacing=0 cellpadding=0 width="100%" border=0>
						<tr>
                            <td height=10></td>
						</tr>
					</table>
					<hr>
					
					<c:forEach items="${menus }" var="top">
	                    <table cellspacing=0 cellpadding=0 width=150 border=0>
	                        <tr height=22>
	                            <td style="padding-left: 30px" background=./img/menu_bt.jpg>
								   <a class=menuparent onclick="expand(${top.menuId })"
								href="javascript:void(0);">${top.menuName }</a>
							</td>
							</tr>
	                        <tr height=4>
	                            <td></td>
							</tr>
						</table>				
                    <table id=${top.menuId } style="display: none" cellspacing=0 cellpadding=0  width=150 border=0>
                        <c:forEach items="${top.menuList }" var="item">
						<tr height=20>
                            <td align=middle width=30>
								<img height=9 src="img/menu_icon.gif" width=9>
							</td>
                            <td>
								<a class=menuchild  href="${item.menuUrl }"  target="right">${item.menuName }</a>
							</td>
						</tr>
                        </c:forEach>
                       
                        <tr height=4>
                            <td colspan=2></td>
						</tr>
					</table>
					</c:forEach>
					<hr>
					
					
					
					
					
                  
						
						
						<!--
						<tr height=20>
                            <td align=middle width=30>
								<img height=9 src="./img/menu_icon.gif" width=9>
							</td>
                            <td>
								<a class=menuchild  href="resource/demo4/list.html"  target="right">职称设置</a>
							</td>
						</tr>
						
						x
						<tr height=20>
                            <td align=middle width=30>
								<img height=9 src="./img/menu_icon.gif" width=9>
							</td>
                            <td>
								<a class=menuchild  href="resource/demo5/list.html"  target="right">题库管理设置</a>
							</td>
						</tr>
						
						-->
						<!--
						<tr height=20>
                            <td align=middle width=30>
								<img height=9 src="./img/menu_icon.gif" width=9>
							</td>
                            <td>
								<a class=menuchild  href="resource/demo6/list.html"  target="right">公共属性设置</a>
							</td>
						</tr>
					
						<tr height=20>
                            <td align=middle width=30>
								<img height=9 src="./img/menu_icon.gif" width=9>
							</td>
                            <td>
								<a class=menuchild  href="resource/demo7/list.html"  target="right">酬薪项目设置</a>
							</td>
						</tr>	

	                      -->						
                        <tr height=4>
                            <td colspan=2></td>
						</tr>
					</table>						
				</td>
                <td width=1 bgcolor=#d1e6f7></td>
            </tr>
        </table>
    </body>
</html>