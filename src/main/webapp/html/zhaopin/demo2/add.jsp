<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>简历管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <link href="../html/css/mine.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../html/css/screen.css" />
          <script type="text/javascript" src="../html/js/jquery-3.2.1.min.js"></script>
         <script type="text/javascript" src="../html/js/zhaopin.js"></script>
          <script type="text/javascript" src="../html/js/jquery.validate.js"></script>
           <script type="text/javascript" src="../html/js/validate_ex.js"></script>
           <script type="text/javascript" src="../html/js/jianli_validate.js"></script>
           
        <script language="javascript" type="text/javascript" src="../html/My97DatePicker/WdatePicker.js"></script>
   
   <style type="text/css">
   	.error{
   		color:red;
   	}
   </style>
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：招聘管理-》简历管理-》简历登记</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="#" onclick="javascript:history.back(-1);">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
             <form action="../jianli/insertSelective.do" method="post" id="demo2_add_form"  enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">应聘职位名称<span style="color:red">*</span>：</td>
                    <td>
                    <input type="hidden" id="demo2_add_hidden" name="jobId" />
             		 <input type="hidden" id="demo2_add_hidden2" name="zhaopinId" />
					<select id="demo2_add_roleName" name="roleName">
						<option value="">-请选择- </option>
						<c:forEach items="${ zhaopinBean}" var = "role">
							<option value="${role.roleBean.roleName }">${role.roleBean.roleName}</option>
						</c:forEach>
					</select>
					
					</td>
                </tr>
				
                <tr>
                    <td>应聘职位编码<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" readonly id="demo2_add_roleNumber" name="roleNumber" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>职位分类<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" readonly id="demo2_add_deptShortname" name="deptShortName" value="" />
					</td>
                </tr>
                <tr>
                    <td>姓名<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" id="xingming" name="xingming" value="" />
					</td>
                </tr>
                <tr>
                    <td>性别<span style="color:red">*</span>：</td>
                    <td>
                        <input type="radio" value="男" checked="checked" name="xingbie"  />男&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="女" name="xingbie"  /> 女
                    </td>
                </tr>


				<tr>
                    <td>招聘类型<span style="color:red">*</span>：</td>
                    <td>
                       <select name="zhaopinType" id="zhaopinType">
						<option value="">-请选择- </option>
						<option value="社会招聘">社会招聘</option>
						<option value="校园招聘">校园招聘</option>
					   </select>
                    </td>                
                </tr>

				<tr>
                    <td>EMAIL<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" id="email" name="email"  />
                    </td>                
                </tr>

				<tr>
                    <td>联系电话<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" id="tel" name="tel" />
                    </td>                
                </tr>

				<tr>
                    <td>户口所在地：</td>
                    <td>
                        <input type="text" name="address"  />
                    </td>                
                </tr>

				<tr>
                    <td>住址：</td>
                    <td>
                        <input type="text" name="live"  />
                    </td>                
                </tr>
				<tr>
                    <td>政治面貌：</td>
                    <td>
                        <input type="text" name="mianmao"  />
                    </td>                
                </tr>
				<tr>
                    <td>身份证号：</td>
                    <td>
                        <input type="text" name="idcard"  />
                    </td>                
                </tr>
				<tr>
                    <td>毕业院校：</td>
                    <td>
                        <input type="text" name="school" />
                    </td>                
                </tr>	

				<tr>
                    <td>学历：</td>
                    <td>
						  <select name="xueli">
						<option value="">-请选择-</option>
						<option value="本科">本科</option>
						<option value="硕士">硕士</option>
					   </select>
                    </td>
                </tr>
				<tr>
                    <td>专业：</td>
                    <td>
                        <input type="text" name="zhuanye" />
                    </td>                
                </tr>
					<tr>
                    <td>工作经验：</td>
                    <td>
                        <input type="text" name="jianyan" />
                    </td>                
                </tr>
					<tr>
                    <td>薪资要求<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="xizi" />（月薪）
                    </td>                
                </tr>
					<tr>
                    <td>是否在职：</td>
                    <td>
                        <select name="zizhi">
							<option value="">-请选择-</option>
							<option value="在职">在职</option>
							<option value="离职">离职</option>
						</select>
                    </td>                
                </tr>
					<tr>
                    <td>是否应届生：</td>
                    <td>
                         <select name="yinjiesheng">
							<option value="">-请选择-</option>
							<option value="应届">应届</option>
							<option value="毕业">毕业</option>
						</select>
                    </td>                
                </tr>
			
					<tr>
                    <td>登记时间：</td>
                     <%
			
              		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              		String date = sdf.format(new Date());
              %>
                    <td>
                        <input type="text" name="dtime"   value="<%=date %>" />
                    </td>                
                </tr>
				
					<tr>
                    <td>个人履历：</td>
                    <td>
                       <textarea cols="70" rows="13" name="jianli"></textarea>
                    </td>                
                </tr>
				
					<tr>
                    <td>简历附件：</td>
                    <td>
                        <input type="file" name="newfile" />
                    </td>                
                </tr>
			
					<tr>
                    <td>
                    	推荐人：   
                    
                    </td>
                    <td>
						  <input type="text" name="tuijianren" value="" />
						推荐时间：<input type="text" name="tuijiantime" id="tuijiantime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                    </td>                
                </tr>
			
					<tr>
                    <td>推荐面试意见：</td>
                    <td>
                       <textarea cols="70" rows="13" name="yijian"></textarea>
                    </td>                
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="保存" />
						<input type="button" value="返回" onclick="javascript:history.back(-1);" />
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>