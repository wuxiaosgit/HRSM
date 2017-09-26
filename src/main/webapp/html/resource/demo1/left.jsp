<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/html/";
%>

<!doctype html public "-//w3c//dtd xhtml 1.0 frameset//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-frameset.dtd">
<html>

<head>
<base href="<%=basePath%>">
<meta http-equiv=content-type content="text/html; charset=utf-8" />
<link href="css/admin.css" type="text/css" rel="stylesheet" />

<link rel="StyleSheet" href="dtree.css" type="text/css" />

<script type="text/javascript" src="dtree.js"></script>
<script src="js/jquery-3.2.1.min.js" type="text/javascript"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">   
<script type="text/javascript" src="easyui/jquery.min.js"></script>   
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>  

<script language=javascript>
          /*   function expand(el)
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
            } */
            $(function(){

        		$('#tt').tree({
        			url : '../dept/deptTree.do',
        			animate : true,
        			onClick : function(node) {
        				if(node.id != 0){
        					//alert(node);
        					window.parent.frames['wecom'].location = '../dept/getDeptById.do?deptId='+node.id;
        					//window.ifm.frames['wecom'].location = 'html/login.jsp';
        				} 
        			}

        		});
            	
            });
        </script>
</head>
<body >
	
<ul id="tt" class="easyui-tree">   

</ul>   




  	<%-- <div class="div_head">
            <span>
                <span style="float:left">部门树</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                  
                </span>
            </span>
        </div>
        
        
	<c:forEach items="${deptBeans }" var="top">
		<table cellspacing=0 cellpadding=0 width=150 border=0 align="center">
			<tr height=22>
				<td style="padding-left: 30px" background=./img/menu_bt.jpg>
				<a class=menuparent onclick="expand(${top.deptId })"
				 href="../dept/getDeptById.do?deptId=${top.deptId }" target="wecom">
					${top.deptName }
					</a>
					</a></td>
			</tr>
			<tr height=4>
				<td></td>
			</tr>
		</table>
		<table id=${top.deptId } style="display: none" cellspacing=0
			cellpadding=0 width=150 border=0 align="center">
			<c:forEach items="${top.deptBeans }" var="item">
				<tr height=20 >
					<td align=middle width=30><img height=9
						src="img/menu_icon.gif" width=9></td>
					<td><a class=menuchild href="../dept/getDeptById.do?deptId=${item.deptId }" target="wecom">${item.deptName }</a>
					</td>
				</tr>
			</c:forEach>

			<tr height=4>
				<td colspan=2></td>
			</tr>
		</table>
	</c:forEach> --%>
	<script type="text/javascript">
					<!--
					d = new dTree('d');
					d.config.target = "main_right";
					d.add(0,-1,'部门管理');					
					d.add(1,0,'人事部','view.html');
					d.add(2,0,'财务部','view.html');
					d.add(3,0,'教学部','view.html');
					d.add(4,3,'教务','view.html');					
					d.add(5,3,'教学','view.html');
					d.add(6,3,'项目','view.html');					
					d.add(7,0,'业务部门','view.html');	
					d.add(8,7,'业务一部','view.html');	
					d.add(9,7,'业务二部','view.html');	
					d.add(10,7,'业务三部','view.html');	
					d.add(11,7,'业务四部','view.html');	
					d.add(12,7,'业务五部','view.html');	
					d.add(13,7,'业务六部','view.html');						
					document.write(d);
					//-->
				</script>

</body>
</html>