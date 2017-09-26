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
                       <input type="text" id=1 required="required" name="deptShortName" value="${deptBean.deptShortName }" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>部门全称：<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" id=2 required="required" name="deptName" value="${deptBean.deptName }" /></td>
                </tr>
                <tr>
                    <td>上级部门：<span style="color:red">*</span>：</td>
                    <td>
						<select name="deptUp" id=3>
						<option value="0">
						顶级部门</option>
						
						<c:forEach  items="${topDepts }" var="top">
						<option value="${top.deptId }" 
						<c:if  test="${top.deptId eq deptBean.deptUp }" >selected="selected"</c:if>
						>	${top.deptName }</option>
						</c:forEach> 
						</select>
					</td>
                </tr>
                <tr>
                    <td>地址<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" id=4 name="deptAddress"  value="${deptBean.deptAddress }" />
                    </td>
                </tr>


				<tr>
                    <td>简介：</td>
                    <td>
                        
						 <textarea name="deptJianjie" id=5>
						 ${deptBean.deptJianjie }</textarea>
                    </td>                
                </tr>

				<tr>
                    <td>备注：</td>
                    <td>
                        
						 <textarea name="deptRemark" id=6>
						 ${deptBean.deptRemark }
						 </textarea>
                    </td>                
                </tr>

				<tr>
                    <td>是否启用：</td>
                    <td>
                        <select name="deptState" id=7>
							<option value="1" 
							<c:if  test="${1 eq deptBean.deptState }" >selected="selected"</c:if>
							>是</option>
							<option value="0"
							<c:if  test="${0 eq deptBean.deptState }" >selected="selected"</c:if>
							>否</option>
						</select>
                    </td>                
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="提交">
						<button type="button" onclick="kong()">清空</button>
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>
<script type="text/javascript">
function kong(){
	$("#1").val("");
	$("#2").val("");
	$("#3").val("0");
	$("#4").val("");
	$("#5").val("");
	$("#6").val("");
	$("#7").val("0");
	
}
</script>