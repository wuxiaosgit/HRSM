<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>简历管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../html/css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：简历管理-》查看简历信息</span>
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
                    <td width="120px;">应聘职位名称：</td>
                    <td><input type="text" name="f_goods_name" value="高级开发工程师" /></td>
                </tr>
                <tr>
                    <td>应聘职位编码：</td>
                    <td>
                       <input type="text" name="f_goods_name" value="a1006" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>职位分类：</td>
                    <td>
						<input type="text" name="f_goods_price"  /></td>
                </tr>
                <tr>
                    <td>姓名：</td>
                    <td>
						<input type="text" readonly name="xingming" value="${jianliBean.xingming }" />
					</td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>
                        <select>
							<option>男</option>
							<option>女</option>							
						</select>
                    </td>
                </tr>


				<tr>
                    <td>招聘类型：</td>
                    <td>
                       <select>
						<option>-请选择-</option>
						<option>社会招聘</option>
						<option selected>校园招聘</option>
					   </select>
                    </td>                
                </tr>

				<tr>
                    <td>EMAIL：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${jianliBean.email }"  />
                    </td>                
                </tr>

				<tr>
                    <td>联系电话：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${jianliBean.tel }" />
                    </td>                
                </tr>

				<tr>
                    <td>户口所在地：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${jianliBean.address }" />
                    </td>                
                </tr>

				<tr>
                    <td>住址：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${jianliBean.live }" />
                    </td>                
                </tr>
				<tr>
                    <td>政治面貌：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${jianliBean.mianmao }"  />
                    </td>                
                </tr>
				<tr>
                    <td>身份证号：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${jianliBean.idcard }" />
                    </td>                
                </tr>
				<tr>
                    <td>毕业院校：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${jianliBean.school }" />
                    </td>                
                </tr>	

				<tr>
                    <td>学历：</td>
                    <td>
						  <select>
						<option>-请选择-</option>
						<option>本科</option>
						<option selected >硕士</option>
					   </select>
                    </td>
                </tr>
				<tr>
                    <td>专业：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${jianliBean.zhuanye }" />
                    </td>                
                </tr>
					<tr>
                    <td>工作经验：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${jianliBean.jianyan }" />
                    </td>                
                </tr>
					<tr>
                    <td>薪资要求：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${jianliBean.xizi }" />（月薪）
                    </td>                
                </tr>
					<tr>
                    <td>是否在职：</td>
                    <td>
                        <select>
							<option>-请选择-</option>
							<option selected >在职</option>
							<option>离职</option>
						</select>
                    </td>                
                </tr>
					<tr>
                    <td>是否应届生：</td>
                    <td>
                         <select>
							<option>-请选择-</option>
							<option>是</option>
							<option selected>否</option>
						</select>
                    </td>                
                </tr>
			
					<tr>
                    <td>登记时间：</td>
                    <td>
                        <input type="text" name="f_goods_image" value="${jianliBean.time }" />
                    </td>                
                </tr>
				
					<tr>
                    <td>个人履历：</td>
                    <td>
                       <textarea cols="70" rows="13">${jianliBean.jianli }</textarea>
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>简历附件：</td>
                    <td>
                        <a href="#">张华个人简历.doc</a>
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>是否推荐面试：</td>
                    <td>
                      <select>
							<option>-请选择-</option>
							<option>是</option>
							<option>否</option>
						</select>
						推荐人：<input type="text" value="${jianliBean.tuijianren }"/>
						推荐时间：<input type="text" value="${jianliBean.tuijiantime }"/>
                    </td>                
                </tr>
				</tr>
					<tr>
                    <td>推荐面试意见：</td>
                    <td>
                       <textarea cols="70" rows="4">${jianliBean.yijian }  </textarea>
                    </td>                
                </tr>
                <tr>
                    <td colspan="2" align="center">
						<input type="button" value="返回"  onclick="javascript:history.back(-1);"/>
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>