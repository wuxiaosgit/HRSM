<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>职位发布登记</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <link href="../html/css/mine.css" type="text/css" rel="stylesheet" />
         <link rel="stylesheet" href="../html/css/screen.css" />
         <script type="text/javascript" src="../html/js/jquery-3.2.1.min.js"></script>
         <script type="text/javascript" src="../html/js/zhaopin.js"></script>
          <script type="text/javascript" src="../html/js/jquery.validate.js"></script>
           <script type="text/javascript" src="../html/js/zhaopin_validate.js"></script>
         <script language="javascript" type="text/javascript" src="../html/My97DatePicker/WdatePicker.js"></script>
    </head>

    <body>
         <div class="div_head">
            <span>
                <span style="float:left">当前位置是：职位发布管理-》职位发布登记</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="#" onclick="javascript:history.back(-1);">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="../zhaopin/insertSelective.do" method="post" id="demo1_add_form">
       		
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">部门<span style="color:red">*</span>：</td>
                    <td>
                    <input type="hidden" name="roleId" id="demo1_add_hidden" />
                    <select id="demo1_add_select" >
						<option value="0">--请选择--</option>
						<c:forEach items="${db}" var="db">
							<option value="${db.deptName }">${db.deptName }</option>
						</c:forEach>
					</select></td>
					
                </tr>
               
                <tr>
                    <td>招聘类型<span style="color:red">*</span>：</td>
                    <td>
                     <select name="zhaopinType">
						<option>-请选择-</option>
						<option value="校园招聘">校园招聘</option>
						<option value="社会招聘">社会招聘</option>
					 </select>
                    </td>
                </tr>
               
                <tr>
                    <td>招聘人数<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" id="zhaopinNum" name="zhaopinNum"  /></td>
                </tr>
                <tr>
                    <td>职位名称<span style="color:red">*</span>：</td>
                    <td>
                    <select id="demo1_add_roleName">
						<option value="0">--请选择--</option>
					</select>
						<!-- <input type="text" id="demo1_add_roleName" readonly name="roleName" value="" /> -->
					</td>
                </tr>
				<tr>
                    <td>职位编码<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" readonly id="demo1_add_roleNumber" name="roleNumber" value="" />
					</td>
                </tr>
				<tr>
                    <td>职位分类<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" readonly id="demo1_add_deptShortname" name="deptShortname" value="" />
					</td>
                </tr>
				<tr>
                    <td>登记人<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" readonly name="dengjiren" value="${user.userName }" />
					</td>
                </tr>
                <tr>
                    <td>登记时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" id = "startTime" name="startTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
                    </td>
                </tr>
<tr>
                    <td>截止时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" id="endTime" name="endTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" required/>
                    </td>
                </tr>

				<tr>
                    <td>职位描述<span style="color:red">*</span>：</td>
                    <td>
                       <textarea cols="70" id="demo1_add_roleDescribe" rows="12" id="jobmiaoshu" name="jobmiaoshu">  
					
					 	${role.roleDescribe }
					   </textarea>
                    </td>                
                </tr>

				<tr>
                    <td>招聘要求<span style="color:red">*</span>：</td>
                    <td>
                       <textarea cols="70" rows="12" id="yaoqiu" name="yaoqiu"> 
					
					   </textarea>
                    </td>                
                </tr>
				
                <tr>
                    <td colspan="2" align="center">
                   		
                        <input type="submit" value=" 发布 "/>
						<input type="button" value=" 返回 " onclick="javascript:history.back(-1);"/>
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>