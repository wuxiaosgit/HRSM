<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>职位发布登记</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../html/css/mine.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="../html/js/jquery-3.2.1.min.js"></script>
         <script type="text/javascript" src="../html/js/zhaopin.js"></script>
          <script type="text/javascript" src="../html/js/jquery.validate.js"></script>
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
            <form action="../zhaopin/updateByPrimaryKeySelective.do" method="post">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">部门<span style="color:red">*</span>：</td>
                    <td>
                   
                    <select id="demo1_up_select" name="deptName">
						<c:forEach items="${db}" var="dept">
							<option value="${dept.deptName }">${dept.deptName }</option>
						</c:forEach>
					</select></td>
                </tr>
                <tr>
                    <td>招聘类型<span style="color:red">*</span>：</td>
                    <td>
                     <select name="zhaopinType">
						<option>-请选择-</option>
						<option value="校园招聘" <c:if test="${zhaopinBean.zhaopinType eq '校园招聘'}">selected="selected" </c:if>>校园招聘</option>
						<option value="社会招聘" <c:if test="${zhaopinBean.zhaopinType eq '社会招聘'}">selected="selected" </c:if>>社会招聘</option>
					 </select>
                    </td>
                </tr>
               
                <tr>
                    <td>招聘人数<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="zhaopinNum" value="${zhaopinBean.zhaopinNum }" /></td>
                </tr>
                <tr>
                    <td>职位名称<span style="color:red">*</span>：</td>
                    <td>
						<select id="demo1_up_roleName">
						<option value="">${zhaopinBean.roleBean.roleName }</option>
					</select>
					</td>
                </tr>
				<tr>
                    <td>职位编码<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" id="demo1_up_roleNumber" readonly name="positionnum" value="${zhaopinBean.roleBean.roleNumber }" />
					</td>
                </tr>
				<tr>
                    <td>职位分类<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" id="demo1_up_deptShortname" readonly name="positioncategory" value="${zhaopinBean.roleBean.deptBean.deptShortName }" />
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
                        <input type="text" name="startTime" value="${zhaopinBean.endTime}"
                        onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
                    </td>
                </tr>
<tr>
                    <td>截止时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="endTime" value="${zhaopinBean.endTime }"
                        onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                    </td>
                </tr>

				<tr>
                    <td>职位描述<span style="color:red">*</span>：</td>
                    <td>
                       <textarea id="demo1_up_roleDescribe" cols="70" rows="12" name="jobmiaoshu">  
					
					 	${zhaopinBean.roleBean.roleDescribe }
					   </textarea>
                    </td>                
                </tr>

				<tr>
                    <td>招聘要求<span style="color:red">*</span>：</td>
                    <td>
                       <textarea cols="70" rows="12" name="yaoqiu"> 
							${zhaopinBean.yaoqiu }
					   </textarea>
                    </td>                
                </tr>
				
                <tr>
                    <td colspan="2" align="center">
                      <input type="hidden" name="zhaopinId" value="${zhaopinBean.zhaopinId }"/><br/>
            			<input type="hidden" name="method" value="change"/><br/>
           			 	<input type="hidden" name="roleId" value="${zhaopinBean.roleId }" id="demo1_up_hidden"/><br/>
                        <input type="submit" value=" 发布 " />
						<input type="button" value=" 返回 " onclick="javascript:history.back(-1);" />
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>