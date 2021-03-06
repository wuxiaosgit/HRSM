<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>面试管理</title>

        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <link href="../html/css/mine.css" type="text/css" rel="stylesheet"/>
        <script language="javascript" type="text/javascript" src="../html/My97DatePicker/WdatePicker.js"></script>
        <script type="text/javascript" src="../html/js/jquery-3.2.1.min.js"></script>
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：面试管理-》面试结果登记</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="#" onclick="javascript:history.back(-1);">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
           <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">应聘职位名称<span style="color:red">*</span>：</td>
                    <td>
                     <input type="hidden" name="state" value="${jianliBean.state}" />
					<input type="hidden" name="jianliId" value="${jianliBean.jianliId}"/>
					<input type="text" readonly="readonly" name= "roleName" value="${jianliBean.roleBean.roleName }" />
					
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
						<input type="text" readonly="readonly" name="deptShortName"  value="${jianliBean.roleBean.deptBean.deptShortName }" /></td>
                </tr>
                <tr>
                    <td>姓名<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" readonly="readonly"  name="xingming" value="${jianliBean.xingming }" />
					</td>
                </tr>
                <tr>
                    <td>性别<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" readonly="readonly" name="xingbie" value="${jianliBean.xingbie }" />
                    </td>
                </tr>


				<tr>
                    <td>招聘类型<span style="color:red">*</span>：</td>
                    <td>
                       <select name="zhaopinType" readonly="readonly">
						<option value="">-请选择-</option>
						<option value="社会招聘" <c:if test="${jianliBean.zhaopinType eq '社会招聘'}">selected="selected"</c:if>>社会招聘</option>
						<option value="校园招聘" <c:if test="${jianliBean.zhaopinType eq '校园招聘'}">selected="selected"</c:if>>校园招聘</option>
					   </select>
                    </td>                
                </tr>

				<tr>
                    <td>EMAIL：</td>
                    <td>
                        <input type="text" readonly="readonly" name="email" value="${jianliBean.email }" />
                    </td>                
                </tr>

				<tr>
                    <td>联系电话：</td>
                    <td>
                        <input type="text" readonly="readonly" name="tel" value="${jianliBean.tel }"/>
                    </td>                
                </tr>

				<tr>
                    <td>户口所在地：</td>
                    <td>
                        <input type="text" readonly="readonly" name="address" value="${jianliBean.address }"  />
                    </td>                
                </tr>

				<tr>
                    <td>住址：</td>
                    <td>
                        <input type="text" readonly="readonly" name="live" value="${jianliBean.live }" />
                    </td>                
                </tr>
				<tr>
                    <td>政治面貌：</td>
                    <td>
                        <input type="text" readonly="readonly" name="mianmao" value="${jianliBean.mianmao }" />
                    </td>                
                </tr>
				<tr>
                    <td>身份证号：</td>
                    <td>
                        <input type="text" readonly="readonly" name="idcard" value="${jianliBean.idcard }"  />
                    </td>                
                </tr>
				<tr>
                    <td>毕业院校：</td>
                    <td>
                        <input type="text" readonly="readonly" name="school" value="${jianliBean.school }" />
                    </td>                
                </tr>	

				<tr>
                    <td>学历：</td>
                    <td>
						  <select name="xueli" readonly="readonly">
						<option>-请选择-</option>
						<option value="本科" <c:if test="${jianliBean.xueli eq '本科'}">selected="selected"</c:if>>本科</option>
						<option value="硕士" <c:if test="${jianliBean.xueli eq '硕士'}">selected="selected"</c:if>>硕士</option>
					   </select>
                    </td>
                </tr>
				<tr>
                    <td>专业：</td>
                    <td>
                        <input type="text" readonly="readonly" name="zhuanye" value="${jianliBean.zhuanye }"/>
                    </td>                
                </tr>
					<tr>
                    <td>工作经验：</td>
                    <td>
                        <input type="text" readonly="readonly" name="jianyan" value="${jianliBean.jianyan }" />
                    </td>                
                </tr>
					<tr>
                    <td>薪资要求：</td>
                    <td>
                        <input type="text" readonly="readonly" name="xizi" value="${jianliBean.xizi }" />（月薪）
                    </td>                
                </tr>
					<tr>
                    <td>是否在职：</td>
                    <td>
                        <select name="zizhi" readonly="readonly">
							<option>-请选择-</option>
							<option value="在职" <c:if test="${jianliBean.zizhi eq '在职'}">selected="selected"</c:if>>在职</option>
							<option value="离职" <c:if test="${jianliBean.zizhi eq '离职'}">selected="selected"</c:if>>离职</option>
						</select>
                    </td>                
                </tr>
					<tr>
                    <td>是否应届生：</td>
                    <td>
                         <select name="yinjiesheng" readonly="readonly">
							<option>-请选择-</option>
							<option value="应届" <c:if test="${jianliBean.yinjiesheng eq '应届'}">selected="selected"</c:if>>应届</option>
							<option value="毕业" <c:if test="${jianliBean.yinjiesheng eq '毕业'}">selected="selected"</c:if>>毕业</option>
						</select>
                    </td>                
                </tr>
				
					<tr>
                    <td>登记时间：</td>
                    <td>
                        <input type="text" readonly="readonly" name="dtime" value="${jianliBean.dtime }"
                        onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                    </td>                
                </tr>
			>
					<tr>
                    <td>个人履历：</td>
                    <td>
                       <textarea cols="70" readonly="readonly" rows="13" name="jianli">
							${jianliBean.jianli }
						</textarea>
                    </td>                
                </tr>
			
					<tr>
                    <td>简历附件：</td>
                    <td>
                        <a href="../jianli/download.do?jianliId=${jianliBean.jianliId}">${jianliBean.filename}</a>
                    </td>                
                </tr>

					<tr>
                    <td>推荐人：</td>
                    <td>
                      
						<input type="text" readonly="readonly" name="tuijianren" value="${jianliBean.tuijianren }"/>
						推荐时间：<input type="text" readonly="readonly" name="tuijiantime" value="${jianliBean.tuijiantime }"
						onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                    </td>                
                </tr>
					<tr>
                    <td>推荐面试意见：</td>
                    <td>
                       <textarea cols="70" readonly="readonly"  rows="13" name="yijian">
                       	${jianliBean.yijian }
                       </textarea>
                    </td>                
                </tr>
            </table>
			<br/>
			
             面试结果：  <hr color="#009966" size="1px" />
                     <% 
                     	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                     	String date = sdf.format(new Date());
                     %>
            <form action="../mianshi/insertSelective.do" method="post">
			<table border="1" width="100%" class="table_a">
			<tr>
					<td colspan="2">
					<input type="hidden" name="zhaopinId" value="${jianliBean.zhaopinId}" />
					<input type="hidden" name="jianliid" value="${jianliBean.jianliId}" />
					<input type="hidden" id="demo3_up_hidden" name="method" value="up"/>
						面试结果：	
					 <select name="state" id="demo3_up_select">
							 <c:if test="${jianliBean.state eq 1}">
								<option jianliId="${jianliBean.state}" value="0" <c:if test="${jianliBean.state eq 0}">selected="selected" </c:if> >删除</option>
								<option jianliId="${jianliBean.state}" value="1" <c:if test="${jianliBean.state eq 1}">selected="selected" </c:if>>推荐面试</option>
							</c:if>
							<c:if test="${jianliBean.state eq 2}">
								<option jianliId="${jianliBean.state}" value="0" <c:if test="${jianliBean.state eq 0}">selected="selected" </c:if> >删除</option>
								<option jianliId="${jianliBean.state}" value="2" <c:if test="${jianliBean.state eq 2}">selected="selected" </c:if>>推荐二面</option>
							</c:if>
							<c:if test="${jianliBean.state eq 3}">
								<option jianliId="${jianliBean.state}" value="0" <c:if test="${jianliBean.state eq 0}">selected="selected" </c:if> >删除</option>
								<option jianliId="${jianliBean.state}" value="3" <c:if test="${jianliBean.state eq 3}">selected="selected" </c:if>>推荐三面</option>
							</c:if>
							<%-- <option>-请选择-</option>
							<option value="0" <c:if test="${jianliBean.state eq '0'}">selected="selected"</c:if>>删除</option>
							<option value="1" <c:if test="${jianliBean.state eq '1'}">selected="selected"</c:if>>推荐面试</option>
							<option value="2" <c:if test="${jianliBean.state eq '2'}">selected="selected"</c:if>>推荐二面</option>
							<option value="3" <c:if test="${jianliBean.state eq '3'}">selected="selected"</c:if>>推荐三面</option>
							<option value="4" <c:if test="${jianliBean.state eq '4'}">selected="selected"</c:if>>建议录用</option>
							<option value="5" <c:if test="${jianliBean.state eq '5'}">selected="selected"</c:if>>录用</option>
							<option value="6" <c:if test="${jianliBean.state eq '6'}">selected="selected"</c:if>>存档</option> --%>
						</select>
						<script>
							$(function(){
								$("#demo3_up_select").change(function(){
									
									var getValue = $("#demo3_up_select").val();
									alert(getValue);
									if(getValue==0){
										$("#demo3_up_hidden").val("del");
									}else{
										$("#demo3_up_hidden").val("up");
									}
								});
								
							});
						</script>
					</td>
				</tr>
				
				 <c:choose>
				 	<c:when test="${jianliBean.state==1}">
	
				 		<tr>
                    <td>
                    一面面试人：<input type="text" name="mianshiren" value="${user.userName }"/> 面试时间：
                    <input name="mianshitime" value="<%=date %>"/>
					</td>
                    <td>
                     二面面试人：<input type="text" readonly="readonly" value="" /> 面试时间：
                     <input readonly="readonly"  value=""/>
                    </td>
                </tr>
				</tr>
					<tr>
                    <td>一面面试评价：<textarea cols="70" rows="3" name="pingjia"></textarea></td>
                    <td>
                      二面面试评价：<textarea  readonly="readonly" cols="70" rows="3"></textarea>
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>三面面试人：<input type="text" readonly="readonly" value=""/> 面试时间：<input readonly="readonly" value=""/></td>
                    <td>
                      三面面试评价：<textarea cols="70" readonly="readonly" rows="3"></textarea>
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
                    <td>一面面试人：<input type="text" readonly="readonly" value="${lists[0].mianshiren }"/> 面试时间：
                    <input readonly="readonly" value="${lists[0].mianshitime }"/>
					</td>
                    <td>
                     二面面试人：<input type="text" name="mianshiren" value="${user.userName }" /> 面试时间：
                     <input name="mianshitime"  value="<%=date %>"/>
                    </td>
                </tr>
				</tr>
					<tr>
                    <td>一面面试评价：<textarea  readonly="readonly" cols="70" rows="3">${lists[0].pingjia }</textarea></td>
                    <td>
                      二面面试评价：<textarea cols="70" rows="3" name="pingjia"></textarea>
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>三面面试人：<input readonly="readonly" type="text" value=""/> 面试时间：<input readonly="readonly" value=""/></td>
                    <td>
                      三面面试评价：<textarea  readonly="readonly" cols="70" rows="3"></textarea>
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
                    <td>一面面试人：<input type="text" readonly="readonly" value="${lists[0].mianshiren }"/> 面试时间：
                    <input readonly="readonly" value="${lists[0].mianshitime }"/>
					</td>
                    <td>
                     二面面试人：<input type="text" readonly="readonly" value="${lists[1].mianshiren }" /> 面试时间：
                     <input readonly="readonly"  value="${lists[1].mianshitime }"/>
                    </td>
                </tr>
				</tr>
					<tr>
                    <td>一面面试评价：<textarea readonly="readonly" cols="70" rows="3">${lists[0].pingjia }</textarea></td>
                    <td>
                      二面面试评价：<textarea readonly="readonly" cols="70" rows="3">${lists[1].pingjia }</textarea>
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>三面面试人：<input name="mianshiren" type="text" value="${user.userName }"/> 
                    	面试时间：<input name="mianshitime" value="<%=date %>"/></td>
                    <td>
                      三面面试评价：<textarea cols="70" rows="3" name="pingjia"></textarea>
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