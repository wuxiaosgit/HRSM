<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>面试管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../html/css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：录用管理-》录用结果登记</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="list.jsp">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
           
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td >应聘职位名称：<input type="text" name="f_goods_name" value="${jianliBean.roleBean.roleName }" /></td>
                   <td>应聘职位编码：<input type="text" name="" value="${jianliBean.roleBean.roleNumber }" /> </td>
                </tr>
                <tr>
                    <td>职位分类：<input type="text" value="${jianliBean.roleBean.deptBean.deptShortName }"  /></td>
                    <td>
						姓名：<input type="text" readonly name="f_goods_image" value="${jianliBean.xingming }" />
					</td>
                </tr>
                <tr>
                    <td>性别：<input type="text" name="${jianliBean.xingbie }"  /></td>
                    <td>
                       招聘类型：  	${jianliBean.zhaopinType}
                    </td>
                </tr>

				<tr>
                    <td>EMAIL： <input type="text" name="f_goods_image" value="${jianliBean.email }" /></td>
                    <td>
                       联系电话：  <input type="text" value="${jianliBean.tel }" />
                    </td>                
                </tr>

				<tr>
                    <td>户口所在地：<input type="text" value="${jianliBean.address }"  /></td>
                    <td>
                       住址： <input type="text" name="f_goods_image" value="${jianliBean.live }"  />
                    </td>                
                </tr>
				<tr>
                    <td>政治面貌： <input type="text" value="${jianliBean.mianmao }"  /></td>
                    <td>
                      身份证号：  <input type="text" value="${jianliBean.idcard }"  />
                    </td>                
                </tr>
				<tr>
                    <td>毕业院校：<input type="text" value="${jianliBean.school }" /></td>
                    <td>
                      学历：<<select name="xueli">
						<option>-请选择-</option>
						<option value="本科" <c:if test="${jianliBean.xueli eq '本科'}">selected="selected"</c:if>>本科</option>
						<option value="硕士" <c:if test="${jianliBean.xueli eq '硕士'}">selected="selected"</c:if>>硕士</option>
					   </select>
                    </td>                
                </tr>	
				<tr>
                    <td>专业：<input type="text" name="zhuanye" value="${jianliBean.zhuanye }"/></td>
                    <td>
                       工作经验： <input type="text" name="jianyan" value="${jianliBean.jianyan }" />
                    </td>                
                </tr>
				<tr>
                    <td>薪资要求：<input type="text" name="xizi" value="${jianliBean.xizi }" />（月薪）</td>
                    <td>
                        是否在职： <select name="zizhi">
							<option>-请选择-</option>
							<option value="在职" <c:if test="${jianliBean.zizhi eq '在职'}">selected="selected"</c:if>>在职</option>
							<option value="离职" <c:if test="${jianliBean.zizhi eq '离职'}">selected="selected"</c:if>>离职</option>
						</select>
                    </td>                
                </tr>
					<tr>
                    <td>是否应届生： <select name="yinjiesheng">
							<option>-请选择-</option>
							<option value="应届" <c:if test="${jianliBean.yinjiesheng eq '应届'}">selected="selected"</c:if>>应届</option>
							<option value="毕业" <c:if test="${jianliBean.yinjiesheng eq '毕业'}">selected="selected"</c:if>>毕业</option>
						</select></td>
                    <td>
                        登记时间： <input type="text" name="dtime" value="${jianliBean.dtime }"/>
                    </td>                
                </tr>
				</tr>
				</tr>
					<tr>
                    <td>个人履历：</td>
                    <td>
                      <textarea cols="70" rows="13" name="jianli">
							${jianliBean.jianli }
						</textarea>
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>简历附件：</td>
                    <td>
                        <input type="file" name="fujian" value="${jianliBean.fujian }" />
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>是否推荐面试：</td>
                    <td>
                      <select name="tuijian">
							<option>-请选择-</option>
							<option value="是" <c:if test="${jianliBean.tuijian eq '是'}">selected="selected"</c:if>>是</option>
							<option value="否" <c:if test="${jianliBean.tuijian eq '否'}">selected="selected"</c:if>>否</option>
						</select>
						推荐人：<input type="text" name="tuijianren" value="${jianliBean.tuijianren }"/>
						推荐时间：<input type="text" name="tuijiantime" value="${jianliBean.tuijiantime }"/>
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>推荐面试意见：</td>
                    <td>
                       <textarea cols="70" rows="13" name="yijian">
                       	${jianliBean.yijian }
                       </textarea>
                    </td>                
                </tr>		
            </table>
			<br>
			
             面试结果：  <hr color="#009966" size="1px">
            
			<table border="1" width="100%" class="table_a">
			<tr>
					<td colspan="2">
						简历状态：	
						<select name="state">
							<option>-请选择-</option>
							<option value="删除" <c:if test="${jianliBean.state eq '0'}">selected="selected"</c:if>>删除</option>
							<option value="推荐面试" <c:if test="${jianliBean.state eq '1'}">selected="selected"</c:if>>推荐面试</option>
							<option value="推荐二面" <c:if test="${jianliBean.state eq '2'}">selected="selected"</c:if>>推荐二面</option>
							<option value="推荐三面" <c:if test="${jianliBean.state eq '3'}">selected="selected"</c:if>>推荐三面</option>
							<option value="建议录用" <c:if test="${jianliBean.state eq '4'}">selected="selected"</c:if>>建议录用</option>
							<option value="录用" <c:if test="${jianliBean.state eq '5'}">selected="selected"</c:if>>录用</option>
							<option value="存档" <c:if test="${jianliBean.state eq '6'}">selected="selected"</c:if>>存档</option>
						</select>
					</td>
				</tr>
				
				 		<tr>
                    <td>一面面试人：<input type="text" value="${lists[0].mianshiren }"/> 面试时间：
                    <input value="${lists[0].mianshitime }"/>
					</td>
                    <td>
                     二面面试人：<input type="text" value="${lists[1].mianshiren }" /> 面试时间：
                     <input  value="${lists[1].mianshitime }"/>
                    </td>
                </tr>
				</tr>
					<tr>
                    <td>一面面试评价：<textarea cols="70" rows="3">${lists[0].pingjia }</textarea></td>
                    <td>
                      二面面试评价：<textarea cols="70" rows="3">${lists[1].pingjia }</textarea>
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>三面面试人：<input type="text" value="${lists[0].mianshiren }"/> 面试时间：<input value="${lists[1].mianshitime }"/></td>
                    <td>
                      三面面试评价：<textarea cols="70" rows="3">${lists[0].pingjia }</textarea>
                    </td>                
                </tr>
                
                <form action="../luyong/insertSelective.do" method="post">
				<tr>
				<%
			
              		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              		String date = sdf.format(new Date());
              %>
				
                    <td>决议时间：<input value="<%=date %>" /></td>
                    <td>
                		     录用决议：<textarea cols="70" rows="3">录用</textarea>
                    </td>                
                </tr>
				 <tr>
                    <td colspan="2" align="center">
                    	<input type="hidden" name="state" value="${jianliBean.state}"/>
                    	<input type="hidden" name="jianliId" value="${jianliBean.jianliId }" />
                        <input type="submit" value="保存" />
						<input type="button" value="返回" />
                    </td>
                </tr> 
                </form> 
			</table>
            
        </div>
    </body>
</html>