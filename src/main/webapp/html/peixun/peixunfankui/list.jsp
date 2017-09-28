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
<script language="javascript" type="text/javascript" src="<%=basePath%>html/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
//分页函数
//pageNum:最大页数
//maxSize：最大条数
//currentPage ：当前多少页
function nextpage(obj){
	var currentNum = parseInt(document.getElementById("currentNum").value);
	if(obj=="forhead"){
		currentNum = currentNum-1;
	}
	else if(obj=="next"){
		currentNum = currentNum+1;
	}
	else if(obj=="first"){
		currentNum =1;
	}
	else if(obj=="last"){
		currentNum=parseInt("${pageNum}");
	}
	else {
		currentNum=obj;
	}
location.href="train/fuheList.do?trainName=${trainName}&trainState=1&trainStarttime=${trainStarttime}&trainEndtime=${trainEndtime}&currentNum="+currentNum;
}
</script>    
</head>
<body>
     <div class="div_head">
         <span>
             <span style="float: left;">当前位置是：培训管理-》培训考核与反馈</span>
         </span>
     </div>
     <div class="div_search">
     		<input type="hidden"  name="currentNum" value="${currentPage}">
          <form action="train/fankuiList.do" method="post">
          	<input type="hidden"  name="currentNum" value="1">
         	<input type="hidden" name="trainState" value="2">
			培训名称:<input type="text"  name="trainName" value="${train.trainName}"/>
			培训时间：
			<input type="text" name="trainStarttime" value="${train.trainStarttime}"
				onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" />
			至
          	<input type="text" name="trainEndtime" value="${train.trainEndtime}"
				onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" />
            <input value="查询" type="submit" />
           </form>
      </div>
      <div style="font-size: 13px; margin: 10px 5px;">
        <table class="table_a" border="1" width="100%">
           <tbody>
              <tr style="font-weight: bold;">
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
				<td>${train.trainStarttime}</td>
				<td>
				<c:choose>
					<c:when test="${train.trainState==2}">审核通过</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
				</td> 				
                <td>
					<a href="train/toFankuiTrain.do?trainId=${train.trainId}&method=toFankuiTrain">培训反馈</a>
				</td>                        
                </tr> 
				</c:forEach>
                     <tr>
                       <td colspan="20" style="text-align: center;">	
						${maxSize } 条记录 ${currentPage }/${pageNum } 页  
			         <a href='javascript:nextpage("first");'>首页</a>
			         <c:if test="${currentPage gt 1 }"><a href='javascript:nextpage("forhead");'>上一页</a></c:if>
			         <c:if test="${currentPage le 1 }"><a style="color:gray;">上一页</a></c:if>
			         <c:choose>
			         	<c:when test="${currentPage le 3 }">
			         		<c:if test="${currentPage eq 1 }">
			         			<span class='current'>${currentPage }</span>
			         			<c:if test="${pageNum ge 5 }">
			         				<c:forEach begin="${currentPage+1 }" end="${currentPage+4 }" var="i">
			         				<a href='javascript:nextpage(${i});'>${i }</a>
			         				</c:forEach>
			         			</c:if>
			         			<c:if test="${pageNum lt 5 }">
			         				<c:forEach begin="${currentPage+1 }" end="${pageNum }" var="i">
			         					<a href='javascript:nextpage(${i});'>${i }</a>
			         				</c:forEach>
			         			</c:if>
			         		</c:if>
			         		<c:if test="${currentPage eq 2 }">
			         			<c:if test="${pageNum ge 5 }">
			         				<c:forEach begin="${currentPage-1 }" end="${currentPage+3 }" var="i">
			         					<c:if test="${i eq currentPage }">
			         						<span class='current'>${currentPage }</span>
			         					</c:if>
			         					<c:if test="${i ne currentPage }">
			         						<a href='javascript:nextpage(${i});'>${i }</a>
			         					</c:if>
			         				</c:forEach>
			         			</c:if>
			         			<c:if test="${pageNum lt 5 }">
			         				<c:forEach begin="${currentPage-1 }" end="${pageNum }" var="i">
			         					<c:if test="${i eq currentPage }">
			         						<span class='current'>${currentPage }</span>
			         					</c:if>
			         					<c:if test="${i ne currentPage }">
			         						<a href='javascript:nextpage(${i});'>${i }</a>
			         					</c:if>
			         				</c:forEach>
			         			</c:if>
			         		</c:if>
			         		<c:if test="${currentPage eq 3 }">
			         			<c:if test="${pageNum ge 5 }">
			         				<c:forEach begin="${currentPage-2 }" end="${currentPage+2 }" var="i">
			         					<c:if test="${i eq currentPage }">
			         						<span class='current'>${currentPage }</span>
			         					</c:if>
			         					<c:if test="${i ne currentPage }">
			         						<a href='javascript:nextpage(${i});'>${i }</a>
			         					</c:if>
			         				</c:forEach>
			         			</c:if>
			         			<c:if test="${pageNum lt 5 }">
			         				<c:forEach begin="${currentPage-2 }" end="${pageNum }" var="i">
			         					<c:if test="${i eq currentPage }">
			         						<span class='current'>${currentPage }</span>
			         					</c:if>
			         					<c:if test="${i ne currentPage }">
			         						<a href='javascript:nextpage(${i});'>${i }</a>
			         					</c:if>
			         				</c:forEach>
			         			</c:if>
			         		</c:if>
			         	</c:when>
			         	<c:otherwise>
			         		<c:if test="${currentPage lt pageNum-2 }">
			         			<c:forEach begin="${currentPage-2 }" end="${currentPage+2 }" var="i">
			         				<c:if test="${i eq currentPage }">
			         					<span class='current'>${currentPage }</span>
			         				</c:if>
			         				<c:if test="${i ne currentPage }">
			         					<a href='javascript:nextpage(${i});'>${i }</a>
			         				</c:if>
			         			</c:forEach>
			         		</c:if>
			         		<c:if test="${currentPage ge pageNum-2 }">
			         			<c:if test="${pageNum ge 5 }">
			         				<c:forEach begin="${pageNum-4 }" end="${pageNum }" var="i">
			         				<c:if test="${i eq currentPage }">
			         					<span class='current'>${currentPage }</span>
			         				</c:if>
			         				<c:if test="${i ne currentPage }">
			         					<a href='javascript:nextpage(${i});'>${i }</a>
			         				</c:if>
			         			</c:forEach>
			         			</c:if>
			         			<c:if test="${pageNum lt 5 }">
			         			<c:forEach begin="${pageNum-3 }" end="${pageNum }" var="i">
			         				<c:if test="${i eq currentPage }">
			         					<span class='current'>${currentPage }</span>
			         				</c:if>
			         				<c:if test="${i ne currentPage }">
			         					<a href='javascript:nextpage(${i});'>${i }</a>
			         				</c:if>
			         			</c:forEach>
			         			</c:if>	
			         		</c:if>
			         	</c:otherwise>
			         </c:choose> 
			         <c:if test="${currentPage lt pageNum }"><a href='javascript:nextpage("next");'>下一页</a></c:if>
			         <c:if test="${currentPage ge pageNum }"><a style="color:gray;">下一页</a></c:if> 
			         <a href='javascript:nextpage("last");' >尾页</a>
               </td>
           </tr>
        </tbody>
    </table>
  </div>
</body>
</html>