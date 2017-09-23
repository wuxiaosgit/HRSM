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
	 <title>职位管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="css/mine.css" type="text/css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
</head>
	<script type="text/javascript">
		$(function(){
				$.post("../dept/ajaxdept.do","", function(result) {
					/* alert(reslut); */
					var dept=document.getElementById("deptId");
					for ( var i in result) {
						dept.add(new Option(result[i].deptName,result[i].deptId),null);
					}
				});
				
			
		});
	</script>
    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》职位管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="../role/selectRole.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../role/insertRole.do" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">职位编码<span style="color:red">*</span>：</td>
                    <td><input type="text" name="roleNumber" value="${roleNumber }" /></td>
                </tr>
               
                <tr>
                    <td>职位名称<span style="color:red">*</span>：</td>
                    <td><input type="text" name="roleName" value="${roleName }" /></td>
                </tr>
                
                <tr>
                    <td>所属部门<span style="color:red">*</span>：</td>
                    <td>
                       
						 <select name="deptId" id="deptId" >
							
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
                        <textarea name="roleDescribe" >
                        ${roleDescribe }
                        </textarea>
                    </td>                
                </tr>

				<tr>
                    <td>备       注：</td>
                    <td>
                        <textarea name="roleRemark">
                        ${roleRemark }
                        </textarea>
                    </td>                
                </tr>
				<tr>
                    <td>是否启用：</td>
                    <td>
                        <select name="roleState">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
                    </td>                
                </tr>
				
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="添加">
						<input type="reset" value="清空">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>