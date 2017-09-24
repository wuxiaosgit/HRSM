<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <title>简历管理</title>

        <link href="../html/css/mine.css" type="text/css" rel="stylesheet" />
       <script type="text/javascript" src="../html/js/jquery-3.2.1.min.js"></script>
       <script type="text/javascript">
	function showMsg() {
		var msg = document.getElementById("msg").value;
		if (msg != null && msg != "") {
			alert(msg);
		}
	}
	function tiaozhuan(){
	
		var num =document.getElementById("num").value;
		alert(num);
		var totlePages = document.getElementById("tp").value;
		alert(totlePages);
		if(num < 1 || num > totlePages){
			if(totlePages != 1){
				alert("请输入1到"+totlePages+"的数字!");
			}else{
				alert("数据只有1页!");
			}
		}else{
			location.href="../jianli/selectJianliRoleDeptPages.do?pageNum="+num;
		}
	}
</script>
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：招聘管理-》简历管理</span>
                <span style="float: right; margin-right: 8px; font-weight: bold;">
                    <a style="text-decoration: none;" href="../jianli/SelectRoleDept.do">【添加】</a>
                </span>
            </span>
        </div>
        <div></div>
         <div class="div_search">
            <span>
                <form action="#" method="get">
					姓名: 
					<input type="text" size="10px" />
					 应聘职位: 
					<input type="text" size="20px" />
					工作经验: 
					<input type="text" size="10px" />
					登记日期: 
					<input type="text" size="20px" />
                    <input value="查询" type="submit" />
					
                </form>
            </span>
        </div>
        <div style="font-size: 13px; margin: 10px 5px;">
            <table class="table_a" border="1" width="100%">
                <tbody><tr style="font-weight: bold;">
                        <td width="30px;">姓名</td>
                        <td width="30px;">性别</td>						
                        <td width="70px;">毕业院校</td>
                        <td width="30px">学历</td>
						<td width="30px">专业</td>
						<td width="100px;">应聘职位</td>
                        <td width="40px;">工作经验</td> 
						<td width="70px;">登记日期</td>
						
                        <td align="center" width="100px;">操作</td>
                    </tr>
					<c:forEach items="${list }" var="list">
						<tr id="product1">
						<td><a href="../jianli/selectByPrimaryKey.do?jianliId=${list.jianliId }&method=view">${list.xingming }</a>
						</td>
                        <td>${list.xingbie }</td>
						<td>${list.school }</td>
                        <td>${list.xueli }</td> 
						<td>${list.zhuanye }</td> 						
                        <td>${list.roleBean.roleName }</td>
						<td>${list.jianyan }</td>
						<td>${list.time }</td>
						
                        <td>
              
							<a href="../jianli/selectByPrimaryKey.do?jianliId=${list.jianliId}&method=change">修改</a>						   
							<a href="../jianli/updateByPrimaryKeySelective.do?jianliId=${list.jianliId}&method=del">删除</a>
							<select name="state" id="demo2_select_state">
							<option value="0" <c:if test="${list.state eq 0}">selected="selected" </c:if>>删除</option>
							<option value="1" <c:if test="${list.state eq 1}">selected="selected" </c:if>>推荐面试</option>
							<option value="2" <c:if test="${list.state eq 2}">selected="selected" </c:if>>推荐二面</option>
							<option value="3" <c:if test="${list.state eq 3}">selected="selected" </c:if>>推荐三面</option>
							<option value="4" <c:if test="${list.state eq 4}">selected="selected" </c:if>>建议录用</option>
							<option value="5" <c:if test="${list.state eq 5}">selected="selected" </c:if>>录用</option>
							<option value="6" <c:if test="${list.state eq 6}">selected="selected" </c:if> >存档</option>
						</select>
						</td>         
						</tr>
					</c:forEach>
                    <tr id="product1">
                        <td><a href="view.jsp">张华</a></td>
                        <td>男</td>
						<td>北京航空航天大学</td>
                        <td>本科</td> 
						<td>计算机科学与应用</td> 						
                        <td>高级工程师</td>
						<td>5年</td>
						<td>2013-09-08</td>
						
                        <td>
							<a href="add.jsp">修改</a>						   
							<a href="#">删除</a>
							<select name="state">
							<option>存档</option>
							<option>推荐面试</option>
							<option>推荐二面</option>
							<option>推荐三面</option>
							<option>建议录用</option>
							<option>录用</option>
							<option>删除</option>
						</select>
						</td>                        
                    </tr> 
					 <tr id="product1">
                        <td><a href="view.jsp">王宇</a></td>
                        <td>男</td>
						<td>清华大学</td>
                        <td>本科</td> 
						<td>软件工程与开发</td> 						
                        <td>技术培训师</td>
						<td>2年</td>
						<td>2013-09-08</td>
						
                        <td>
							<a href="add.jsp">修改</a>						   
							<a href="#">删除</a>
							<select>
								<option>存档</option>
								<option>推荐面试</option>
								<option>推荐二面</option>
								<option>推荐三面</option>
								<option>建议录用</option>
								<option>录用</option>
								<option>删除</option>
							</select>
						</td>                        
                    </tr> 
					
					<tr id="product1">
                        <td><a href="view.jsp">张茜</a></td>
                        <td>女</td>
						<td>北京矿业大学</td>
                        <td>本科</td> 
						<td>人力资源管理</td> 						
                        <td>人事专员</td>
						<td>5年</td>
						<td>2013-09-08</td>
						
                        <td>
							<a href="add.jsp">修改</a>						   
							<a href="#">删除</a>
							<select>
								<option>存档</option>
								<option>推荐面试</option>
								<option>推荐二面</option>
								<option>推荐三面</option>
								<option>建议录用</option>
								<option>录用</option>
								<option>删除</option>
							</select>
						</td>                        
                    </tr> 
					<tr id="product1">
                        <td><a href="view.jsp">李梅</a></td>
                        <td>女</td>
						<td>北京财经大学</td>
                        <td>本科</td> 
						<td>会计</td> 						
                        <td>财务主管</td>
						<td>5年</td>
						<td>2013-09-08</td>
						
                        <td>
							<a href="add.jsp">修改</a>						   
							<a href="#">删除</a>
							<select>
								<option>存档</option>
								<option>推荐面试</option>
								<option>推荐二面</option>
								<option>推荐三面</option>
								<option>建议录用</option>
								<option>录用</option>
								<option>删除</option>
							</select>
						</td>                        
                    </tr> 
                    <tr>
                        <td colspan="10" style="text-align: center;">						
		<input type="hidden" value="${totlePages }" id="tp" />
					<span>显示第${(pageNum-1)*pageRows +1 }条到<c:choose>
								<c:when test="${((pageNum-1)*pageRows +pageRows) <= totleRows }">
				${(pageNum-1)*pageRows +pageRows }
			    </c:when>
								<c:otherwise>
				${totleRows }
			</c:otherwise>
							</c:choose>条记录，总共${totleRows }条
					</span> <span> <a href="../jianli/selectJianliRoleDeptPages.do?pageNum=1">首页</a> <c:if
								test="${pageNum == 1 }">
				上一页
			</c:if> <c:if test="${pageNum > 1 }">
								<a href="../jianli/selectJianliRoleDeptPages.do?pageNum=${pageNum-1 }">上一页</a>
							</c:if> <c:forEach begin="1" end="${totlePages }" step="1" var="pn">
								<c:if test="${pn == pageNum }">${pn }</c:if>
								<c:if test="${pn != pageNum }">
									<a href="../jianli/selectJianliRoleDeptPages.do?pageNum=${pn }">${pn }</a>
								</c:if>
							</c:forEach> <c:if test="${pageNum == totlePages }">
				下一页
			</c:if> 
			<c:if test="${pageNum < totlePages }">
				<a href="../jianli/selectJianliRoleDeptPages.do?pageNum=${pageNum+1 }">下一页</a>
			</c:if> <a href="../jianli/selectJianliRoleDeptPages.do?pageNum=${totlePages }">尾页</a> 转到
			<input type="number" style="width: 50px" id="num" />页 
			<input type="button" value="GO" onclick="tiaozhuan()" /></span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>