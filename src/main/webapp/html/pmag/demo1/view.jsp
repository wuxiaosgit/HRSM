<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
    <head>
   		 <base href="<%=basePath%>">
        <title>薪酬标准管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="<%=basePath%>html/css/mine.css" type="text/css" rel="stylesheet">
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
            <form action="./admin.php?c=goods&a=add" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">档案编码<span style="color:red">*</span>：</td>
                    <td><input type="text" name="f_goods_name" value="${pmag.pmagCode}" /></td>
                </tr>
                <tr>
                    <td>所属部门<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="f_goods_name" value="${pmag.pmagDept}" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>档案状态<span style="color:red">*</span>：</td>
                    <td>
						<c:if test="${pmag.pmagVerifyState==1}">试用期</c:if>
						<c:if test="${pmag.pmagVerifyState==2}">正式员工</c:if>
						<c:if test="${pmag.pmagVerifyState==3}">离职</c:if>
						<c:if test="${pmag.pmagVerifyState==4}">已删除</c:if>
						<c:if test="${pmag.pmagVerifyState==5}">实习员工</c:if> 
					</td>
                </tr>
                <tr>
                    <td>职位名称<span style="color:red">*</span>：</td>
                    <td>
						<input type="text"  name="f_goods_image"  value="${pmag.pmagDoom}" />
					</td>
                </tr>
                <tr>
                    <td>职位编码<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="f_goods_image"  value="${pmag.pmagDoomCode}" />
                    </td>
                </tr>
				<tr>
                    <td>职称<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${pmag.pmagCheng}" />
                    </td>
                </tr>

				<tr>
                    <td>姓名<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="f_goods_image"  value="${pmag.pmagName}"/>
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
                        <input type="text" name="f_goods_image"  value="${pmag.pmagEmail}"/>
                    </td>                
                </tr>

				<tr>
                    <td>联系电话：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${pmag.pmagPhone}" />
                    </td>                
                </tr>

				<tr>
                    <td>住址：</td>
                    <td>
                        <input type="text" name="f_goods_image"  value="${pmag.pmagAddress}" />
                    </td>                
                </tr>
				<tr>
                    <td>身份证号：</td>
                    <td>
                        <input type="text" name="f_goods_image"  value="${pmag.pmagShen}" />
                    </td>                
                </tr>
				<tr>
                    <td>户口所在地：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${pmag.pmagHuKou}" />
                    </td>                
                </tr>
				<tr>
                    <td>政治面貌：</td>
                    <td>
                        <input type="text" name="f_goods_image"  value="${pmag.pmagMiao}"/>
                    </td>                
                </tr>	

				<tr>
                    <td>毕业院校：</td>
                    <td>
						 <input type="text" readonly name="f_goods_name"  value="${pmag.pmagXiao}" />
                    </td>
                </tr>


				<tr>
                    <td>专业：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${pmag.pmagYe}"/>
                    </td>                
                </tr>
				<tr>
                    <td>学历：</td>
                    <td>
                     <c:if test="${pmag.pmagLi==1}">专科</c:if>
                     <c:if test="${pmag.pmagLi==2}">本科</c:if>
                     <c:if test="${pmag.pmagLi==3}">硕士</c:if>
                     <c:if test="${pmag.pmagLi==4}">博士</c:if>
                    </td>                
                </tr>
				<tr>
                    <td>薪酬标准：</td>
                    <td>
                     <input type="text" name="pmagMoney" value="${pmag.pmagMoney}"></input>
                  <%--   <c:if test="${pmag.pmagMoney==1}">高级软件工程师</c:if>
					<c:if test="${pmag.pmagMoney==2}">中级软件工程师</c:if>
					<c:if test="${pmag.pmagMoney==3}">初级软件工程师</c:if> --%>
                    </td>                
                </tr>
				<tr>
                    <td>开户行：</td>
                    <td>
                        <input type="text" name="f_goods_image"  value="${pmag.pmagBank}"/>
                    </td>                
                </tr>
				<tr>
                    <td>银行卡号：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${pmag.pmagBankId}"/>
                    </td>                
                </tr>
				<tr>
                    <td>社保卡号：</td>
                    <td>
                        <input type="text" name="f_goods_image"  value="${pmag.pmagInsuranceId}"/>
                    </td>                
                </tr>
				<tr>
                    <td>登记人：</td>
                    <td>
                        <input type="text" name="f_goods_image"  value="${pmag.pmagPeg}"/>
                    </td>                
                </tr>
				<tr>
                    <td>建档时间：</td>
                    <td>
                        <input type="text" name="f_goods_image"  value="${pmag.pmagTime}"/>
                    </td>                
                </tr>
				<tr>
                    <td>个人履历：</td>
                    <td>
                        <textarea>${pmag.pmagJing}</textarea>
                    </td>                
                </tr>
				<tr>
                    <td>家庭关系信息：</td>
                    <td>
                        <textarea >${pmag.pmagFamily}</textarea>
                    </td>                
                </tr>
				<tr>
                    <td>备注：</td>
                    <td>
                        <textarea >${pmag.pmagRemark}</textarea>
                    </td>                
                </tr>
				<tr>
                    <td>简历附件：</td>
                    <td>
                        <a href="pmag/download.do?pmagId=${pmag.pmagId}">${pmag.pmagFileName}</a>
                    </td>  
                                   
                </tr>
               
            </table>
            </form>
        </div>
    </body>
</html>