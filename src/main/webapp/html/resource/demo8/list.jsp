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
	 <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <title>薪酬标准管理</title>

        <link href="css/mine.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：系统管理-》菜单管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="add.html">【添加】</a>
					<a style="text-decoration: none;" href="#">【删除】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
            <span>
                <form action="../menu/selectMenu.do" method="post">
                  	  菜单名称: 
					<input type="text" name="menuName" value="${menuName }" />
					 状态: 
					<select name="menuState">
						<option value=-1>--请选择--</option>
						<option value=1>启用</option>
						<option value=0>禁用</option>
					
					</select>
                    <input value="查询" type="submit" />
					
                </form>
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td width="40px;">序号</td>
                        <td width="30px;"><input type="checkbox" /></td>						
                        <td width="80px;">菜单名称</td>
                        <td >URL</td>
						<td width="100px;">状态</td>
                        
                        <td align="center" width="100px;">操作</td>
                    </tr>
				<c:forEach items="${menuBeans }" var="item">
                    <tr id="product1">
                        <td>${item.menuId }</td>
                        <td><input type="checkbox" /></td>
						<td>${item.menuName }</td>
                        <td><a href="view.html">${item.menuUrl }</a></td> 
						<td>${item.menuState }</td> 						
                        <td>
							<a href="add.html">修改</a>						   
							<a href="#">删除</a>
						</td>                        
                    </tr>
				</c:forEach>
                    
                
                    <tr>
                        <td colspan="20" style="text-align: center;">						
						<a style="text-decoration: none;" href="#">
                            首页 上一页  ... 7 8 9 10 11 12 ... 下一页 尾页 共1234条 每页显示 10/23 </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>