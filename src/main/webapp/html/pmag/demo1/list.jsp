
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
    <head>
    	<base href="<%=basePath%>">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <title>人事管理</title>

        <link href="<%=basePath%>html/css/mine.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head" >
            <span>
                <span style="float: left;">当前位置是：人事管理-》人事档案管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="pmag/preAdd.do">【档案登记】</a>
                </span>
            </span>
        </div>
        <div></div><br/>
        <div class="div_search">
          	<span>
                <form action="pmag/querylike.do" method="post">
                 	  姓名: 
					<input type="text" name="pmagName" value="${pmagName }" />
					 审核状态: 
					<select name="pmagState">
						<option value="0" 
					<c:if test="${pmagState eq 0 }">selected="selected"</c:if>
						>--请选择--</option>
						<option value="1" <c:if test="${pmagState eq 1 }">selected="selected"</c:if> >起草</option>
						<option value="2" <c:if test="${pmagState eq 2 }">selected="selected"</c:if> >待审核</option>
						<option value="3" <c:if test="${pmagState eq 3 }">selected="selected"</c:if> >审核通过</option>
						<option value="4" <c:if test="${pmagState eq 4 }">selected="selected"</c:if> >驳回</option>
					</select>
					档案状态：
					<select name="pmagVerifyState">
						<option value="0" <c:if test="${pmagVerifyState eq 0 }">selected="selected"</c:if> >--请选择--</option>
						<option value="1" <c:if test="${pmagVerifyState eq 1 }">selected="selected"</c:if> >试用期</option>
						<option value="2" <c:if test="${pmagVerifyState eq 2 }">selected="selected"</c:if> >正式员工</option>
						<option value="3" <c:if test="${pmagVerifyState eq 3 }">selected="selected"</c:if> >离职</option>
						<option value="4" <c:if test="${pmagVerifyState eq 4 }">selected="selected"</c:if> >已删除</option>
						<option value="5" <c:if test="${pmagVerifyState eq 5 }">selected="selected"</c:if> >实习员工</option>
					</select>
					建档时间：
					<input type="text" name="starttime" value="${starttime}"/>至<input type="text" name="endtime" value="${endtime }"/>
                    <input value="查询" type="submit" />
					
                </form>
          </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody>
                <tr style="font-weight: bold;">
                        <td width="30px;"><input type="checkbox" /></td>						
                        <td width="80px;">档案编码</td>
                        <td >姓名</td>
						<td>性别</td>
						<td>所属部门</td>
						<td>职位</td>
						<td>职称</td>
						<td>建档日期</td>
						<td>审核状态</td>
						<td>档案状态</td>                      
                        <td align="center" width="100px;">操作</td>
                    </tr>
        			<c:forEach items="${pmags}" var="pmag">
        				<tr id="product1">
							<td><input type="checkbox"/></td>
							<td>${pmag.pmagCode}</td>
							<td>${pmag.pmagName}</td>
							<td>${pmag.pmagSex}</td>
							<td>${pmag.pmagDept}</td>
							<td>${pmag.pmagDoom}</td>
							<td>${pmag.pmagCheng}</td>
							<td>${pmag.pmagTime}</td>
							<!-- 审核状态 -->
							<td>
								<c:if test="${pmag.pmagState==1}">起草</c:if>
								<c:if test="${pmag.pmagState==2}">待审核</c:if>
								<c:if test="${pmag.pmagState==3}">审核通过</c:if>
								<c:if test="${pmag.pmagState==4}">驳回</c:if>
								
							</td>
							<!-- 档案状态 -->
							<td>
							
								<c:if test="${pmag.pmagVerifyState==1}">试用期</c:if>
								<c:if test="${pmag.pmagVerifyState==2}">正式员工</c:if>
								<c:if test="${pmag.pmagVerifyState==3}">离职</c:if>
								<c:if test="${pmag.pmagVerifyState==4}">已删除</c:if>
								<c:if test="${pmag.pmagVerifyState==5}">实习员工</c:if> 
							</td>
							<td>
								<a href="pmag/pmagXG.do?pmagId=${pmag.pmagId}">修改</a>	
								<a href="pmag/selectAll.do?pmagId=${pmag.pmagId}">明细</a>
								<a href="javascript:if(confirm('您确定要删除当前档案状态？')){location.href='pmag/pmagbyDt.do?pmagId=${pmag.pmagId}'};">删除</a>
								
						
							
								<c:if test="${pmag.pmagState==4}">
									<a href="pmag/pmagReView.do?pmagId=${pmag.pmagId}">复核</a>
								</c:if>							
																	
							
								<c:if test="${pmag.pmagVerifyState==4}">
									<a href="javascript:if(confirm('确定删除？')){location.href='pmag/delectPmag.do?pmagId=${pmag.pmagId}'};">永久删除</a>	
									<a href="pmag/pmagbyHf.do?pmagId=${pmag.pmagId}">恢复</a>	
								</c:if>																
							</td>
						</tr>
        			</c:forEach>				
                    <tr>
                        <td colspan="20" style="text-align: center;">						
				
     <c:if test="${page.pageNum  == 1}">
             首页&nbsp;&nbsp;&nbsp;&nbsp;
	    上一页&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	<c:if test="${page.pageNum > 1 }">
    <a href="pmag/querylike.do?pageNum=1&pmagName=${pmagName }&pmagState=${pmagState}&pmagVerifyState=${pmagVerifyState }&starttime=${starttime }&endtime=${endtime }">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="pmag/querylike.do?pageNum=${page.pageNum - 1 }&pmagName=${pmagName }&pmagState=${pmagState}&pmagVerifyState=${pmagVerifyState}&starttime=${starttime }&endtime=${endtime }">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	
	 <c:if test="${page.pageNum == page.totlePages}">
	 下一页&nbsp;&nbsp;&nbsp;&nbsp;
	 尾页&nbsp;&nbsp;&nbsp;&nbsp;
	 </c:if>
	 
	 <c:if test="${page.pageNum != page.totlePages }"> 
	<a href="pmag/querylike.do?pageNum=${page.pageNum + 1 }&pmagName=${pmagName }&pmagState=${pmagState}&pmagVerifyState=${pmagVerifyState }&starttime=${starttime}&endtime=${endtime}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="pmag/querylike.do?pageNum=${page.totlePages }&pmagName=${pmagName }&pmagState=${pmagState}&pmagVerifyState=${pmagVerifyState}&starttime=${starttime }&endtime=${endtime }">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
	 </c:if>
	 当前页 ${page.pageNum }&nbsp;&nbsp;&nbsp;&nbsp;
	分页单位${page.pageRows }&nbsp;&nbsp;&nbsp;&nbsp;
	总页数${page.totlePages }&nbsp;&nbsp;&nbsp;&nbsp; 
	总条数${page.totleRows } 
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>