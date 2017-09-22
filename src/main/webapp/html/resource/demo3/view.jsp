<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
	<base href="<%=basePath%>">
	 <title>职位管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../../css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》职位管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="list.html">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="./admin.php?c=goods&a=add" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">职位编码：</td>
                    <td>
					QMXC-001002
					</td>
                </tr>
                <tr>
                    <td>职位名称：</td>
                    <td>
						人事总监
					</td>
                </tr>
                <tr>
                    <td>职位分类：</td>
                     <td>
						管理
					</td>
                </tr>
                <tr>
                    <td>所属部门：</td>
                     <td>
						人事部
					</td>
                </tr>
                <tr>
                    <td>职位描述：</td>
                     <td>
						职位描述。。。
					</td>
                </tr>
                <tr>
                    <td>备  注：</td>
                     <td>
						备注。。。
					</td>
                </tr>


				<tr>
                    <td>是否启用：</td>
                     <td>
						12000 元
					</td>               
                </tr>

				
            </table>
            </form>
        </div>
    </body>
</html>