<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <title>录用管理</title>

        <link href="../../css/mine.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <style>
            .tr_color{background-color: #9F88FF}
        </style>
        <div class="div_head">
            <span>
                <span style="float: left;">当前位置是：录用管理</span>
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
					简历状态: 
					<select>
						<option>-请选择-</option>
						<option>建议录用</option>
						<option>录用</option>
					</select>
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
						<td width="40px;" >状态</td>
                        <td align="center" width="100px;">操作</td>
                    </tr>

                    <tr id="product1">
                        <td><a href="view.jsp">张华</a></td>
                        <td>男</td>
						<td>北京航空航天大学</td>
                        <td>本科</td> 
						<td>计算机科学与应用</td> 						
                        <td>高级工程师</td>
						<td>5年</td>
						<td>2013-09-08</td>
						<td width="40px;" >建议录用</td>
                        <td>
							<a href="add.jsp">面试结果</a>						   
							<a href="../../pmag/demo1/add.jsp">入职办理</a>
						
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
						<td width="40px;" >建议录用</td>
                        <td>
							<a href="add.jsp">面试结果</a>								   
							<a href="../../pmag/demo1/add.jsp">入职办理</a>
							
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
						<td width="40px;" >建议录用</td>
                        <td>
							<a href="add.jsp">面试结果</a>							   
							<a href="../../pmag/demo1/add.jsp">入职办理</a>
								
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
						<td width="40px;" >录用</td>
                        <td>
						<!--录用状态 没有  面试结果登记-->
<!-- 							<a href="add.html">面试结果</a> -->							   
							<a href="../../pmag/demo1/add.jsp">入职办理</a>
								
						</td>                        
                    </tr> 
                    <tr>
                        <td colspan="10" style="text-align: center;">						
						<a style="text-decoration: none;" href="#">
                            首页 上一页  ... 7 8 9 10 11 12 ... 下一页 尾页 共1234条 每页显示 10/23 </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>