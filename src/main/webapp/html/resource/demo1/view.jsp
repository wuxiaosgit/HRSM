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
	<title>部门管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-系统管理》部门管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
				    <a style="text-decoration: none" href="../dept/getTopDept.do?deptId=${deptBean.deptId }">【修改部门】</a>					
					<a style="text-decoration: none" href="../dept/getTopDept.do">【添加部门】</a>					
					<a style="text-decoration: none" href="../dept/noDeleteDept.do?deptId=${deptBean.deptId }" onclick="return confirm('确认删除？？');">【删除部门】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="./admin.php?c=goods&a=add" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">部门编码：</td>
                    <td>
						${deptBean.deptId }
					</td>
                </tr>
                <tr>
                    <td>部门简称：</td>
                    <td>
						${deptBean.deptShortName }
					</td>
                </tr>
                <tr>
                    <td>部门全称：</td>
                     <td>
						${deptBean.deptName }
					</td>
                </tr>
                <tr>
                    <td>上级部门：</td>
                     <td>
						${deptBean.deptBean.deptName }
					</td>
                </tr>
                <tr>
                    <td>地址：</td>
                     <td>
					${deptBean.deptAddress }
					</td>
                </tr>
                <tr>
                    <td>简介：</td>
                     <td>
						${deptBean.deptJianjie}
					</td>
                </tr>


				<tr>
                    <td>备注：</td>
                     <td>
						${deptBean.deptRemark }
					</td>               
                </tr>

				<tr>
                    <td>是否启用：</td>
                     <td>
						<c:choose>
						<c:when test="${deptBean.deptState  eq 1 }">启用</c:when>
						<c:otherwise>禁用</c:otherwise>
						</c:choose>
					</td>                
                </tr>
            </table>
            </form>
        </div>
    </body>
</html>