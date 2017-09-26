<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>面试管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <link href="../html/css/mine.css" type="text/css" rel="stylesheet"/>
        <script language="javascript" type="text/javascript" src="../../My97DatePicker/WdatePicker.js"></script>
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：面试管理-》面试结果展示</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="#" onclick="javascript:history.back(-1);">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="./admin.php?c=goods&a=add" method="post" enctype="multipart/form-data">
       <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">应聘职位名称<span style="color:red">*</span>：</td>
                    <td>
                     <input type="hidden" name="state" value="${jianliBean.state}" />
					<input type="hidden" name="jianliId" value="${jianliBean.jianliId}"/>
					<input type="text" name= "roleName" value="${jianliBean.roleBean.roleName }" />
					
					</td>
                </tr>
				
                <tr>
                    <td>应聘职位编码<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" readonly name="f_goods_name" value="${jianliBean.roleBean.roleNumber }" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>职位分类<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="deptShortName"  value="${jianliBean.roleBean.deptBean.deptShortName }" /></td>
                </tr>
                <tr>
                    <td>姓名<span style="color:red">*</span>：</td>
                    <td>
						<input type="text"  name="xingming" value="${jianliBean.xingming }" />
					</td>
                </tr>
                <tr>
                    <td>性别<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="xingbie" value="${jianliBean.xingbie }" />
                    </td>
                </tr>


				<tr>
                    <td>招聘类型<span style="color:red">*</span>：</td>
                    <td>
                       <select name="zhaopinType">
						<option value="">-请选择-</option>
						<option value="社会招聘" <c:if test="${jianliBean.zhaopinType eq '社会招聘'}">selected="selected"</c:if>>社会招聘</option>
						<option value="校园招聘" <c:if test="${jianliBean.zhaopinType eq '校园招聘'}">selected="selected"</c:if>>校园招聘</option>
					   </select>
                    </td>                
                </tr>

				<tr>
                    <td>EMAIL：</td>
                    <td>
                        <input type="text" name="email" value="${jianliBean.email }" />
                    </td>                
                </tr>

				<tr>
                    <td>联系电话：</td>
                    <td>
                        <input type="text" name="tel" value="${jianliBean.tel }"/>
                    </td>                
                </tr>

				<tr>
                    <td>户口所在地：</td>
                    <td>
                        <input type="text" name="address" value="${jianliBean.address }"  />
                    </td>                
                </tr>

				<tr>
                    <td>住址：</td>
                    <td>
                        <input type="text" name="live" value="${jianliBean.live }" />
                    </td>                
                </tr>
				<tr>
                    <td>政治面貌：</td>
                    <td>
                        <input type="text" name="mianmao" value="${jianliBean.mianmao }" />
                    </td>                
                </tr>
				<tr>
                    <td>身份证号：</td>
                    <td>
                        <input type="text" name="idcard" value="${jianliBean.idcard }"  />
                    </td>                
                </tr>
				<tr>
                    <td>毕业院校：</td>
                    <td>
                        <input type="text" name="school" value="${jianliBean.school }" />
                    </td>                
                </tr>	

				<tr>
                    <td>学历：</td>
                    <td>
						  <select name="xueli">
						<option>-请选择-</option>
						<option value="本科" <c:if test="${jianliBean.xueli eq '本科'}">selected="selected"</c:if>>本科</option>
						<option value="硕士" <c:if test="${jianliBean.xueli eq '硕士'}">selected="selected"</c:if>>硕士</option>
					   </select>
                    </td>
                </tr>
				<tr>
                    <td>专业：</td>
                    <td>
                        <input type="text" name="zhuanye" value="${jianliBean.zhuanye }"/>
                    </td>                
                </tr>
					<tr>
                    <td>工作经验：</td>
                    <td>
                        <input type="text" name="jianyan" value="${jianliBean.jianyan }" />
                    </td>                
                </tr>
					<tr>
                    <td>薪资要求：</td>
                    <td>
                        <input type="text" name="xizi" value="${jianliBean.xizi }" />（月薪）
                    </td>                
                </tr>
					<tr>
                    <td>是否在职：</td>
                    <td>
                        <select name="zizhi">
							<option>-请选择-</option>
							<option value="在职" <c:if test="${jianliBean.zizhi eq '在职'}">selected="selected"</c:if>>在职</option>
							<option value="离职" <c:if test="${jianliBean.zizhi eq '离职'}">selected="selected"</c:if>>离职</option>
						</select>
                    </td>                
                </tr>
					<tr>
                    <td>是否应届生：</td>
                    <td>
                         <select name="yinjiesheng">
							<option>-请选择-</option>
							<option value="应届" <c:if test="${jianliBean.yinjiesheng eq '应届'}">selected="selected"</c:if>>应届</option>
							<option value="毕业" <c:if test="${jianliBean.yinjiesheng eq '毕业'}">selected="selected"</c:if>>毕业</option>
						</select>
                    </td>                
                </tr>
				
					<tr>
                    <td>登记时间：</td>
                    <td>
                        <input type="text" name="dtime" value="${jianliBean.dtime }"
                        onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                    </td>                
                </tr>
			>
					<tr>
                    <td>个人履历：</td>
                    <td>
                       <textarea cols="70" rows="13" name="jianli">
							${jianliBean.jianli }
						</textarea>
                    </td>                
                </tr>
			
					<tr>
                    <td>简历附件：</td>
                    <td>
                         <a href="../jianli/download.do?jianliId=${jianliBean.jianliId}">${jianliBean.filename }</a>
                    </td>                
                </tr>

					<tr>
                    <td>是否有人推荐面试：</td>
                    <td>
                      <select name="tuijian">
							<option>-请选择-</option>
							<option value="是" <c:if test="${jianliBean.tuijian eq '是'}">selected="selected"</c:if>>是</option>
							<option value="否" <c:if test="${jianliBean.tuijian eq '否'}">selected="selected"</c:if>>否</option>
						</select>
						推荐人：<input type="text" name="tuijianren" value="${jianliBean.tuijianren }"/>
						推荐时间：<input type="text" name="tuijiantime" value="${jianliBean.tuijiantime }"
						onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                    </td>                
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
			<br/>
	   面试结果：  <hr color="#009966" size="1px" />
            <form action="">
			<table border="1" width="100%" class="table_a">
			<tr>
					<td colspan="2">
						面试结果：	
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
				
				 <c:choose>
				 	<c:when test="${jianliBean.state==1}">
	
				 		<tr>
                    <td>一面面试人：<input type="text" value=""/> 面试时间：
                    <input value=""/>
					</td>
                    <td>
                     二面面试人：<input type="text" value="" /> 面试时间：
                     <input  value=""/>
                    </td>
                </tr>
				</tr>
					<tr>
                    <td>一面面试评价：<textarea cols="70" rows="3"></textarea></td>
                    <td>
                      二面面试评价：<textarea cols="70" rows="3"></textarea>
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>三面面试人：<input type="text" value=""/> 面试时间：<input value=""/></td>
                    <td>
                      三面面试评价：<textarea cols="70" rows="3"></textarea>
                    </td>                
                </tr>
				 <tr>
                    <td colspan="2" align="center">
                    <input type="submit" value="提交" />
						<input type="button" value="返回" onclick="javascript:history.back(-1);" />
                    </td>
                </tr>
				 	</c:when>
				 	<c:when test="${jianliBean.state==2}">

				 		<tr>
                    <td>一面面试人：<input type="text" value="${lists[0].mianshiren }"/> 面试时间：
                    <input value="${lists[0].mianshitime }"/>
					</td>
                    <td>
                     二面面试人：<input type="text" value="" /> 面试时间：
                     <input  value=""/>
                    </td>
                </tr>
				</tr>
					<tr>
                    <td>一面面试评价：<textarea cols="70" rows="3">${lists[0].pingjia }</textarea></td>
                    <td>
                      二面面试评价：<textarea cols="70" rows="3"></textarea>
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>三面面试人：<input type="text" value=""/> 面试时间：<input value=""/></td>
                    <td>
                      三面面试评价：<textarea cols="70" rows="3"></textarea>
                    </td>                
                </tr>
				 <tr>
                    <td colspan="2" align="center">
                    <input type="submit" value="提交" />
						<input type="button" value="返回" onclick="javascript:history.back(-1);" />
                    </td>
                </tr>
				 	</c:when>
				 	<c:when test="${jianliBean.state==3}">
				 	
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
                    <td>三面面试人：<input type="text" value=""/> 面试时间：<input value=""/></td>
                    <td>
                      三面面试评价：<textarea cols="70" rows="3"></textarea>
                    </td>                
                </tr>
				 <tr>
                    <td colspan="2" align="center">
  						<input type="submit" value="提交" />
						<input type="button" value="返回" onclick="javascript:history.back(-1);" />
                    </td>
                </tr>
				 	</c:when>
				 </c:choose>
			</table>
</form>
        </div>
    </body>
</html>