<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/hrml/";
%>

<!DOCTYPE html>
<html>

<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	 <title>菜单管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》菜单管理</span>
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
                    <td width="120px;">菜单名称<span style="color:red">*</span>：</td>
                    <td><input type="text" name="f_goods_name" value="培训管理" /></td>
                </tr>
                <tr>
                    <td>上级菜单<span style="color:red">*</span>：</td>
                    <td>
                       <select>
						<option>顶级菜单</option>
						<option>个人信息</option>
						<option>薪酬管理</option>
						<option>人事管理</option>
					   </select>
                    </td>
                </tr>
				  <tr>
                    <td>URL<span style="color:red">*</span>：</td>
                    <td>
						<input type="text"  name="f_goods_image" value="" />
					</td>
                </tr>
               
                <tr>
                    <td>状态<span style="color:red">*</span>：</td>
                    <td>
						 <select>
							<option>启用</option>
							<option>禁用</option>						
						 </select>
					</td>
                </tr>
                <tr>
                    <td>备注：</td>
                    <td>
						<input type="text" readonly name="f_goods_image" value="" />
					</td>
                </tr>
              


				
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="添加">
						<input type="submit" value="清空">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>