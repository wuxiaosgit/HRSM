<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
	<title>培训管理</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link href="html/css/mine.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="html/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="html/js/jquery.validate.js"></script>
	<script type="text/javascript">
	$().ready(function(){
		$("#formId").validate({
			rules:{
				trainFeekBack:"required",
				trainSumup:"required",
				trainResult:"required",
			},
			messages:{
				trainFeekBack:{
					required:'培训反馈不能为空'
				},
				trainSumup:{
					required:'培训总结不能为空'
				},
				trainResult:{
					required:'考核结果不能为空'
				}
			}
		});
	});
	
</script>
<style type="text/css">
.error{
	color: red;
}
</style>
</head>
<body>
	<div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》培训管理 -》培训反馈</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="train/fankuiList.do">【返回】</a>
                </span>
            </span>
    </div>
    <div style="font-size: 13px;margin: 10px 5px">
        <form action="train/updateFankuiTrain.do"  id="formId" method="post">
            <input type="hidden" name="trainState" id="train_state" value="${train.trainState}">
            <input type="hidden" name="trainId" value="${train.trainId}">
          <table border="1" width="100%" class="table_a">
             <tr>
                 <td width="120px;">培训名称<span style="color:red">*</span>：</td>
                 <td>
                 	<input type="text" name="trainName" readonly="readonly" value="${train.trainName}"/></td>
             </tr>
             <tr>
                  <td>培训讲师<span style="color:red">*</span>：</td>
                  <td>
                     <input type="text" name="trainTeacher" readonly="readonly" value="${train.trainTeacher}" /> 
                  </td>
              </tr>
              <tr>
                  <td>培训时间<span style="color:red">*</span>：</td>
                  <td>
                  	<input type="text" name="trainStarttime" readonly="readonly" value="${train.trainStarttime}"/></td>
              </tr>
              <tr>
                  <td>至</td>
                  <td>
                  	<input type="text" name="trainEndtime" readonly="readonly" value="${train.trainEndtime }"/></td>
              </tr>
              <tr>
                  <td>培训目的<span style="color:red">*</span>：</td>
                  <td>
                  	<textarea name="trainGoal" readonly="readonly" >${train.trainGoal}</textarea>
                  </td>
              </tr>
			  <tr>
                   <td>参训人员<span style="color:red">*</span>：</td>
                   <td>
                   	   <textarea name="trainPeople" readonly="readonly">${train.trainPeople}</textarea>
                   </td>                
               </tr>
			   <tr>
                   <td>培训简介：</td>
                   <td>
                   	   <textarea name="trainJianjie" readonly="readonly">${train.trainJianjie}</textarea>
                   </td>                
               </tr>
				<tr>
                   <td>培训资料：</td>
                   <td>
                    <c:choose>
	                    <c:when test="${train.trainZiliao !=null && train.trainZiliao != ''}">
	                    	<input type="text" name="trainZiliao" readonly="readonly" value="${train.trainZiliao}">
	                    </c:when>
	                    <c:otherwise>
	                    	<input type="file" name="file"/>
	                    </c:otherwise>
                    </c:choose>
                   </td>
               </tr>
                <tr>
                    <td>审核意见：</td>
                    <td>
                    	<textarea name="trainIdea" readonly="readonly" >${train.trainIdea}</textarea>
                    </td>                
                </tr>
                <tr>
                	<td>培训反馈<span style="color:red">*</span>：</td><br/>
                	<td>
                	<select name="trainFeekBack">
                		<option value="" <c:if test="${train.trainFeekBack ==null ||train.trainFeekBack == -1 }">selected = "selected"</c:if>>--请选择--</option>
                		<option value="1" <c:if test="${train.trainFeekBack==1}">selected="selected"</c:if>>优</option>
                		<option value="2" <c:if test="${train.trainFeekBack==2}">selected="selected"</c:if>>良</option>
                		<option value="3" <c:if test="${train.trainFeekBack==3}">selected="selected"</c:if>>差</option>
                	</select>
                	</td>
                </tr>
                <tr>
	                <td>培训总结<span style="color:red">*</span>：</td>
	                <td><textarea name="trainSumup">${train.trainSumup}</textarea></td>
                </tr>
                <tr>
	                <td>考核结果<span style="color:red">*</span>：</td>
	                <td><textarea name="trainResult" >${train.trainResult}</textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="保存"	/> 
                    </td>
                </tr>  
            </table>
        </form>
    </div>
</body>
</html>