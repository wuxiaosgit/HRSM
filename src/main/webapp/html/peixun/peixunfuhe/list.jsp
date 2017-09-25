<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<style>
  .tr_color{background-color: #9F88FF}
</style>
<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>培训管理</title>
    <link href="html/css/mine.css" type="text/css" rel="stylesheet" />
</head>
<body>
 
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：培训管理-》培训复核</span>
            </span>
        </div>
        <div></div>
        <div class="div_search">
             <form action="train/queryFuheList.do" method="post">
             <input type="hidden" name="trainState" value="1">
                	培训名称: 
                <input type="text"  name="trainName"/>
					培训时间：
				<input type="text" name="trainStarttime"/>
					至
				<input type="text" name="trainEndtime"/>
				
                <input value="查询" type="submit" />
					
                </form>
             	
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                		<td width="5%">ID</td>
                        <td width="">培训名称</td>
                        <td width="15%">培训讲师</td>						
                        <td width="15%">培训时间</td>
						<td width="15%">审核状态</td>                   
                        <td align="center" width="15%">操作</td>
                    </tr>
				<c:forEach items="${trainList}" var="train">
				<tr id="product1">
						<td>${train.trainId}</td>
                        <td>${train.trainName}</td>
                        <td>${train.trainTeacher}</td>
						<td><fmt:formatDate value="${train.trainStarttime}" type="date"/>
						</td>
                         
						<td>
							<c:choose>
								<c:when test="${train.trainState==0}">起草</c:when>
								<c:when test="${train.trainState==1}">审核中</c:when>
								<c:when test="${train.trainState==2}">审核通过</c:when>
								<c:when test="${train.trainState==3}">驳回</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</td> 				
                        <td>
							<a href="train/toFuheTrain.do?trainId=${train.trainId}&method=toFuheTrain">培训复核</a>
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