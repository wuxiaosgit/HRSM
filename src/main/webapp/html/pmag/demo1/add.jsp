<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	
<html>
    <base href="<%=basePath%>">
    <head>
    <script type="text/javascript" src="html/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="html/js/jquery.validate.js"></script>
     <script type="text/javascript">
   				$(function(){
   					$("#form").validate({
   						rules:{
   							pmagCode:{
   								required:true,
   							},
   							pmagDept:{
   								required:true,
   							},
   							pmagDoom:{
   								required:true,
   							},
   							pmagDoomCode:{
   								required:true,
   							},
   							pmagCheng:{
   								required:true,
   							},
   							
   							pmagName:{
   								required:true,
   								rangelength : [5,10]
   							},
   							
   							
   							pmagTime:{
   								required:true,
   								date:true
   							},
   							pmagEmail:{
   								required:true,
   								email:true,
   								maxlength:20
   							},
   							pmagBankId:{
   								required:true
   							},
   							upload:{
   								required:true
   							}
   						},
   						messages:{
   							pmagCode:{
   								required:'请输入档案编码',
   							},
   							pmagDept:{
   								required:'请输入您的部门',
   							},
   							pmagDoom:{
   								required:'请输入您的职位名称',
   							},
   							pmagDoomCode:{
   								required:'请输入您的职位编码',
   							},
   							pmagCheng:{
   								required:'请输入您的职称',
   							},
   							pmagName:{
   								required:'名字必填长度在5~10之间'
   							},
   							
   							
   							pmagEmail:{
   								required:'请确认您的邮箱格式',
   								maxlength:'您的长度不能大于20'
   							},
   							pmagBankId:{
   								required:'请您确认您的卡号是否正确'
   							},
   							pmagTime:{
   								required:'您输入的日期格式错误'
   							},
   							upload:{
   								required:'请选择您的简历'
   							}
   							
   						}
   					})
   				});
   				function fun(){
   	   				var form = document.getElementsByTagName("form")[0];
   	   				if(form){
   	   					form.action="pmag/add2.do";
   	   					form.submit();
   	   				}
   	   			 } 
   	    	</script>
        <title>薪酬标准管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
        <link href="<%=basePath%>html/css/mine.css" type="text/css" rel="stylesheet"/>
      <style>
      	.error{
      		color:red;
      	}
      </style>
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》人事管理 -》人事档案管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="pmag/querylike.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="pmag/add.do" id="form" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">档案编码<span style="color:red">*</span>：</td>
                    <td><input type="text" name="pmagCode" value="" /></td>
                </tr>
                <tr>
                    <td>所属部门<span style="color:red">*</span>：</td>
                    <td>
                       <select name="pmagDept" value=''>
							<option value="0">--请选择--</option>
							<c:forEach items="${depts}" var="dept">
								<option value="${dept.deptId}">${dept.deptName}</option>
							</c:forEach>
						</select>
                    </td>
                     
                </tr>
               
                <tr>
                    <td>档案状态<span style="color:red">*</span>：</td>
                    <td>
						<select name="pmagVerifyState">
							<option value="">--请选择--</option>
							<option value="1">试用期</option>
							<option value="2">正式员工</option>
							<option value="3">离职</option>
							<option value="4">已删除</option>
							<option value="5">实习员工</option>
						</select>
					</td>
                </tr>
                <tr>
                    <td>职位名称<span style="color:red">*</span>：</td>
                    <td>
						<input type="text"  name="pmagDoom" value="" />
					</td>
                </tr>
                <tr>
                    <td>职位编码<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="pmagDoomCode" value="" />
                    </td>
                </tr>

				 <tr>
                    <td>职称<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="pmagCheng" value="" />
                    </td>
                </tr>
				<tr>
                    <td>姓名<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="pmagName"  value=""/>
                    </td>                
                </tr>

				<tr>
                    <td>性别：</td>
                    <td>
                        <input type="text" name="pmagSex"  value=""/>
                    </td>                
                </tr>

				<tr>
                    <td>EMAIL：</td>
                    <td>
                        <input type="text" name="pmagEmail" value=""/>
                    </td>                
                </tr>

				<tr>
                    <td>联系电话：</td>
                    <td>
                        <input type="text" name="pmagPhone" value="" />
                    </td>                
                </tr>

				<tr>
                    <td>住址：</td>
                    <td>
                        <input type="text" name="pmagAddress" value="" />
                    </td>                
                </tr>
				<tr>
                    <td>身份证号：</td>
                    <td>
                        <input type="text" name="pmagShen" value="" />
                    </td>                
                </tr>
				<tr>
                    <td>户口所在地：</td>
                    <td>
                        <input type="text" name="pmagHuKou" value="" />
                    </td>                
                </tr>
				<tr>
                    <td>政治面貌：</td>
                    <td>
                        <input type="text" name="pmagMiao" value=""/>
                    </td>                
                </tr>	

				<tr>
                    <td>毕业院校：</td>
                    <td>
						 <input type="text" name="pmagXiao" value="" />
                    </td>
                </tr>


				<tr>
                    <td>专业：</td>
                    <td>
                        <input type="text" name="pmagYe" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>学历：</td>
                    <td>
                        <select name="pmagLi">
							<option value="">--请选择--</option>
							<option value="1">专科</option>
							<option value="2">本科</option>
							<option value="3">硕士</option>
							<option value="4">博士</option>
						</select>
                    </td>                
                </tr>
				<tr>
                    <td>薪酬标准：</td>
                    <td>
                        <select name="pmagMoney">
							<option value="0">--请选择--</option>
							<c:forEach items="${wages }" var="wage">
								<option value="${wage.wageId }">${wage.wageName }</option>
							</c:forEach>
						</select>
                    </td>                
                </tr>
				<tr>
                    <td>开户行：</td>
                    <td>
                        <input type="text" name="pmagBank" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>银行卡号：</td>
                    <td>
                        <input type="text" name="pmagBankId" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>社保卡号：</td>
                    <td>
                        <input type="text" name="pmagInsuranceId" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>登记人：</td>
                    <td>
                        <input type="text" name="pmagPeg" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>建档时间：</td>
                    <td>
                        <input type="text" name="pmagTime" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>个人履历：</td>
                    <td>
                        <textarea name="pmagJing"></textarea>
                    </td>                
                </tr>
				<tr>
                    <td>家庭关系信息：</td>
                    <td>
                        <textarea name="pmagFamily"></textarea>
                    </td>                
                </tr>
				<tr>
                    <td>备注：</td>
                    <td>
                        <textarea name="pmagRemark"></textarea>
                    </td>                
                </tr>
				<tr>
                    <td>简历附件：</td>
                    <td>
                       <input type="file" name="upload" /> 

                    </td>                
                </tr>
			
                <tr>
                    <td colspan="2" align="center">
                    	<input type="submit" value="添加"/>
						<input type="reset" value="清空" />
						<input type="button" onclick="fun()" value="提交审核"/>
                    </td>
                </tr>  
            </table>
            </form>
            
        </div>
    </body>
</html>