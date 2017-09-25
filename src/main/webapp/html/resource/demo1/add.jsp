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
	  <title>部门管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-系统管理》部门管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                  
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
           <form action="../dept/insertDept.do" method="post" >
            <input type="hidden" name="deptId" value="${deptBean.deptId }">
            <table border="1" width="100%" class="table_a">
                
                <tr>
                    <td>部门简称：<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" required="required" name="deptShortName" value="${deptBean.deptShortName }" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>部门全称：<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" required="required" name="deptName" value="${deptBean.deptName }" /></td>
                </tr>
                <tr>
                    <td>上级部门：<span style="color:red">*</span>：</td>
                    <td>
						<select name="deptUp">
						<option value="0">
						顶级部门</option>
						
						<c:forEach  items="${topDepts }" var="top">
						<option value="${top.deptId }">
						${top.deptName }</option>
						</c:forEach> 
						</select>
					</td>
                </tr>
                <tr>
                    <td>地址<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="deptAddress"  value="${deptBean.deptAddress }" />
                    </td>
                </tr>


				<tr>
                    <td>简介：</td>
                    <td>
                        
						 <textarea name="deptJianjie">
						 ${deptBean.deptJianjie }</textarea>
                    </td>                
                </tr>

				<tr>
                    <td>备注：</td>
                    <td>
                        
						 <textarea name="deptRemark">
						 ${deptBean.deptRemark }
						 </textarea>
                    </td>                
                </tr>

				<tr>
                    <td>是否启用：</td>
                    <td>
                        <select name="deptState">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
                    </td>                
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="提交">
						<input type="reset" value="清空">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>