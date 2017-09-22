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

        <title>用户管理</title>

        <link href="css/mine.css" type="text/css" rel="stylesheet" />
        <meta name="viewport"
		content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<script src="js/jquery-3.2.1.min.js" type="text/javascript"
		charset="utf-8"></script>
    </head>
    
    <script type="text/javascript">
    	function selectrole(obj){
    		
    		$.post("../role/ajaxRole.do",{deptId:obj},function(result){
    			alert(result);
    			/* var $json=$.parseJSON(result);
    			 var docselect = document.getElementById("docid"); 
    			docselect.innerHTML="";
    			docselect.add(new Option("--请选择--",-1),null);
    			$($json).each(function(i,item){
    				 var a=parseInt(item.countmax)-parseInt(item.count); 
    				if(a>0){
    					 docselect.add(new Option(item.dname+"可以出诊"+a+"次",item.did),null);
    				}
    				 
    			}); */
    		
    		});
    		
    	}
    </script>
    
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：系统管理-》用户管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="add.html">【添加】</a>
					<a style="text-decoration: none;" href="#">【删除】</a>
                </span>
            </span>
        </div>
        
        <div></div>
        <div class="div_search">
           
                <form action="../user/selectUser.do" method="post">
                  	   姓名：
					<input type="text"  name="userName" value="${userName }" />
					 所属部门: 
					<select name="deptId" onclick="selectrole(this.value);">
				
					<option value="-1">--请选择--</option>
					<c:forEach items="${deptBeans }" var="item">
					<option value="${item.deptId }">${item.deptName }</option>
					
					</c:forEach>
				
					</select>	
					 角色: 
					<select name="roleId" id="roleId">
					<option value="1">1</option>
				
					</select>
                    <input value="查询" type="submit" />
					
                </form>
           
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody>
						<tr style="font-weight: bold;">						
                        <td width="40px;">序号</td>
                        <td width="30px;"><input type="checkbox" /></td>						
						<td width="80px;">账号</td>
                        <td width="80px;">姓名</td>
                        <td >角色</td>
						<td width="100px;">所属部门</td>                                        
                        <td align="center" width="100px;">操作</td>
                    </tr>
				<c:forEach items="${userBeans }" var="item">
                    <tr id="product1">
                        <td>${item.userId }</td>
                        <td><input type="checkbox" /></td>
						<td>${item.userLogin }</td>
                        <td><a href="view.html">${item.userName }</a></td> 
						<td>人力资源负责人</td> 	
						<td>人力资源</td> 						                        
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