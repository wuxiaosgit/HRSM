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
                    <td width="120px;">职位编码<span style="color:red">*</span>：</td>
                    <td><input type="text" name="f_goods_name" value="QMXC-001002" /></td>
                </tr>
                <tr>
                    <td>职位编码<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="f_goods_name" value="人事总监" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>职位名称<span style="color:red">*</span>：</td>
                    <td>人事总监</td>
                </tr>
                <tr>
                    <td>职位分类<span style="color:red">*</span>：</td>
                    <td>
						<select>
							<option>管理</option>
							<option>技术</option>
							<option>实施</option>
						</select>
					</td>
                </tr>
                <tr>
                    <td>所属部门<span style="color:red">*</span>：</td>
                    <td>
                       
						 <select>
							<option>人事部</option>
							<option>财务</option>
						</select>
                    </td>
                </tr>
				
				<tr>
                    <td>菜单权限<span style="color:red">*</span>：</td>
                    <td>
                        <input type="checkbox"/>个人信息<br/>
					&nbsp;&nbsp;&nbsp;<input type="checkbox"/>个人信息修改<br/>
					&nbsp;&nbsp;&nbsp;<input type="checkbox"/>密码修改<br/>
					<input type="checkbox"/>薪酬管理<br/>
					&nbsp;&nbsp;&nbsp;<input type="checkbox" />薪酬标准管理<br/>
					&nbsp;&nbsp;&nbsp;<input type="checkbox"/>薪酬标准审批<br/>
					&nbsp;&nbsp;&nbsp;<input type="checkbox"/>薪酬发放管理<br/>
						 
                    </td>
                </tr>


				<tr>
                    <td>职位描述<span style="color:red">*</span>：</td>
                    <td>
                        <textarea name="f_goods_introduce"></textarea>
                    </td>                
                </tr>

				<tr>
                    <td>备       注：</td>
                    <td>
                        <textarea name="f_goods_introduce"></textarea>
                    </td>                
                </tr>
				<tr>
                    <td>是否启用：</td>
                    <td>
                        <select>
							<option>是</option>
							<option>否</option>
						</select>
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