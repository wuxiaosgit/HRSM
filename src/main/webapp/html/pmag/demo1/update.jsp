<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<base href="<%=basePath%>">
    <head>
    <script type="text/javascript" src="/heml/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/html/js/jquery.validate.js"></script>
    
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
							required:true,
							creditcard:true
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
						}
					}
				})
			});
    	</script>
        <title>薪酬标准管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="<%=basePath%>html/css/mine.css" type="text/css" rel="stylesheet">
    </head>
	  <style>
      	.error{
      		color:red;
      	}
      </style>
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
            <form action="pmag/pmagupdate.do" method="post" enctype="multipart/form-data">
            	<input type="hidden" id="pmag_state" name="pmagState" value="2"/>
            	<input type="hidden" id="pmag_id" name="pmagId" value="${pmag.pmagId}"/>
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">档案编码<span style="color:red">*</span>：</td>
                    <td><input type="text" name="pmagCode" value="${pmag.pmagCode}" /></td>
                </tr>
                <tr>
                    <td>所属部门<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="pmagDept" value="${pmag.pmagDept}" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>档案状态<span style="color:red">*</span>：</td>
                    <td>
						<select name="pmagVerifyState">
							<option value="">请选择</option>
	                    	<option value="1" <c:if test="${pmag.pmagVerifyState==1}">selected = 'selected'</c:if>>试用期</option>	
	                    	<option value="2" <c:if test="${pmag.pmagVerifyState==2}">selected = 'selected'</c:if>>正式员工</option>	
	                    	<option value="3" <c:if test="${pmag.pmagVerifyState==3}">selected = 'selected'</c:if>>离职</option>	
	                    	<option value="4" <c:if test="${pmag.pmagVerifyState==4}">selected = 'selected'</c:if>>已删除</option>	
	                    	<option value="5" <c:if test="${pmag.pmagVerifyState==5}">selected = 'selected'</c:if>>实习员工</option>	
                    	</select>
					</td>
                </tr>
                <tr>
                    <td>职位名称<span style="color:red">*</span>：</td>
                    <td>
						<input type="text"  name="pmagDoom" value="${pmag.pmagDoom}" />
					</td>
                </tr>
                <tr>
                    <td>职位编码<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="pmagDoomCode" value="${pmag.pmagDoomCode}" />
                    </td>
                </tr>

				 <tr>
                    <td>职称<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="pmagCheng" value="${pmag.pmagCheng}" />
                    </td>
                </tr>
				<tr>
                    <td>姓名<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="pmagName"  value="${pmag.pmagName}"/>
                    </td>                
                </tr>

				<tr>
                    <td>性别：</td>
                    <td>                    	
                   			<input type="text" name="pmagSex" value="${pmag.pmagSex}"/>                  		                
                    </td>                
                </tr>

				<tr>
                    <td>EMAIL：</td>
                    <td>
                        <input type="text" name="pmagEmail" value="${pmag.pmagEmail}"/>
                    </td>                
                </tr>

				<tr>
                    <td>联系电话：</td>
                    <td>
                        <input type="text" name="pmagPhone" value="${pmag.pmagPhone}" />
                    </td>                
                </tr>

				<tr>
                    <td>住址：</td>
                    <td>
                        <input type="text" name="pmagAddress" value="${pmag.pmagAddress}" />
                    </td>                
                </tr>
				<tr>
                    <td>身份证号：</td>
                    <td>
                        <input type="text" name="pmagShen" value="${pmag.pmagShen}" />
                    </td>                
                </tr>
				<tr>
                    <td>户口所在地：</td>
                    <td>
                        <input type="text" name="pmagHuKou" value="${pmag.pmagHuKou}" />
                    </td>                
                </tr>
				<tr>
                    <td>政治面貌：</td>
                    <td>
                        <input type="text" name="pmagMiao" value="${pmag.pmagMiao}"/>
                    </td>                
                </tr>	

				<tr>
                    <td>毕业院校：</td>
                    <td>
						 <input type="text" name="pmagXiao" value="${pmag.pmagXiao}" />
                    </td>
                </tr>


				<tr>
                    <td>专业：</td>
                    <td>
                        <input type="text" name="pmagYe" value="${pmag.pmagYe}"/>
                    </td>                
                </tr>
				<tr>
                    <td>学历：</td>
                    <td>
                        <select name="pmagLi">
                        	<option value="">请选择</option>
	                    	<option value="1" <c:if test="${pmag.pmagLi==1}">selected = 'selected'</c:if>>专科</option>	
	                    	<option value="2" <c:if test="${pmag.pmagLi==2}">selected = 'selected'</c:if>>本科</option>	
	                    	<option value="3" <c:if test="${pmag.pmagLi==3}">selected = 'selected'</c:if>>硕士</option>	
	                    	<option value="4" <c:if test="${pmag.pmagLi==4}">selected = 'selected'</c:if>>博士</option>	                    		
                    	</select> 
                    </td>                
                </tr>
				<tr>
                    <td>薪酬标准：</td>
                    <td>
                    	<input type="text" name="pmagMoney" value="${pmag.pmagMoney}"></input>
                       <%-- <select name="pmagMoney">
                       		<option value="">请选择</option>
                    		<option value="1" <c:if test="${pmag.pmagMoney==1}">selected = 'selected'</c:if>>高级软件工程师</option>	
	                    	<option value="2" <c:if test="${pmag.pmagMoney==2}">selected = 'selected'</c:if>>中级软件工程师</option>	
	                    	<option value="3" <c:if test="${pmag.pmagMoney==3}">selected = 'selected'</c:if>>初级软件工程师</option>	
                    	</select>	 --%>
                    </td>                
                </tr>
				<tr>
                    <td>开户行：</td>
                    <td>
                        <input type="text" name="pmagBank" value="${pmag.pmagBank}"/>
                    </td>                
                </tr>
				<tr>
                    <td>银行卡号：</td>
                    <td>
                        <input type="text" name="pmagBankId" value="${pmag.pmagBankId}"/>
                    </td>                
                </tr>
				<tr>
                    <td>社保卡号：</td>
                    <td>
                        <input type="text" name="pmagInsuranceId" value="${pmag.pmagInsuranceId}"/>
                    </td>                
                </tr>
				<tr>
                    <td>登记人：</td>
                    <td>
                        <input type="text" name="pmagPeg" value="${pmag.pmagPeg}"/>
                    </td>                
                </tr>
				<tr>
                    <td>建档时间：</td>
                    <td>
                        <input type="text" name="pmagTime" value="${pmag.pmagTime}"/>
                    </td>                
                </tr>
				<tr>
                    <td>个人履历：</td>
                    <td>
                        <textarea name="pmagJing">${pmag.pmagJing}</textarea>
                    </td>                
                </tr>
				<tr>
                    <td>家庭关系信息：</td>
                    <td>
                        <textarea name="pmagFamily">${pmag.pmagFamily}</textarea>
                    </td>                
                </tr>
				<tr>
                    <td>备注：</td>
                    <td>
                        <textarea name="pmagRemark">${pmag.pmagRemark}</textarea>
                    </td>                
                </tr>
				<tr>
                    <td>简历附件：</td>
                    <td>
                    	<input type="file" name="upload" value="${pmag.pmagFileName}"/> 
                    </td>
                    
                </tr>
				<tr>
                    <td></td>
                    <td>
                        <a href="pmag/download.do?pmagId=${pmag.pmagId}">${pmag.pmagFileName}</a>
                    </td>                
                </tr>
				
                <tr>
                    <td colspan="2" align="center">		
						<input type="submit" value="提交审核">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>