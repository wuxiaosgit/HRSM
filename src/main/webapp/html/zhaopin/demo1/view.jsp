<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>职位发布管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../html/css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：招聘管理》职位发布管理-》查看职位信息</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="#" onclick="javascript:history.back(-1);">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="" method="post" >
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">部门：</td>
                    <td>
						<input type="text" value="产品设计中心"/>
					</td>
                </tr>
                <tr>
                    <td>招聘类型：</td>
                    <td>
						<select>
							<option>社会招聘</option>
							<option>校园招聘</option>
						</select>
					</td>
                </tr>
                <tr>
                    <td>招聘人数：</td>
                     <td>
					<input type="text" readonly value="${zhaopinBean.zhaopinNum }"/>	
					</td>
                </tr>
                <tr>
                    <td>职位名称：</td>
                     <td>
						<input type="text" readonly value="技术培训师">
					</td>
                </tr>
                <tr>
                    <td>职业编码：</td>
                     <td>
						BDQN-BM03
					</td>
                </tr>
                <tr>
                    <td>职位分类：</td>
                     <td>
						<select>
							<option>技术</option>
						</select>
					</td>
                </tr>


				<tr>
                    <td>登记人：</td>
                     <td>
						${zhaopinBean.dengjiren }
					</td>               
                </tr>

				<tr>
                    <td>登记时间：</td>
                     <td>
						${zhaopinBean.startTime }
					</td>                
                </tr>

				<tr>
                    <td>截止日期：</td>
                    <td>
                        ${zhaopinBean.endTime }
                    </td>                
                </tr>

				<tr>
                    <td>职位描述：</td>
                    <td>
                       <textarea cols="70" rows="12">
					  	${zhaopinBean.jobmiaoshu }
					   </textarea>
                    </td>                
                </tr>

				<tr>
                    <td>招聘要求：</td>
                    <td>
                       <textarea cols="70" rows="12">
						${zhaopinBean.yaoqiu }
					   </textarea>
                    </td>                
                </tr>
				 <tr>
                    <td colspan="2" align="center"> 
						<input type="button" value=" 返回 " onclick="javascript:history.back(-1);">
                    </td>
                </tr> 
            </table>
            </form>
        </div>
    </body>
</html>