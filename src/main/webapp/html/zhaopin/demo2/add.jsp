<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>简历管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <link href="../../css/mine.css" type="text/css" rel="stylesheet" />
        <script language="javascript" type="text/javascript" src="../../My97DatePicker/WdatePicker.js"></script>
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：招聘管理-》简历管理-》简历登记</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="#" onclick="javascript:history.back(-1);">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
           <!--  <form action="../../../zhaopin/insertSelective.do" method="post"> -->
            <%-- ../jianli/selectByPrimaryKey.do?jianliId=${list.jianliId } --%>
             <form action="../../../jianli/insertSelective.do" method="post">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">应聘职位名称<span style="color:red">*</span>：</td>
                    <td>
					<select>
						<option>---请选择---</option>
						<option>---技术培训师---</option>
					
					</select>
					
					</td>
                </tr>
				
                <tr>
                    <td>应聘职位编码<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" readonly name="f_goods_name" value="BDQN-BM03" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>职位分类<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="f_goods_price"  /></td>
                </tr>
                <tr>
                    <td>姓名<span style="color:red">*</span>：</td>
                    <td>
						<input type="text"  name="xingming" value="" />
					</td>
                </tr>
                <tr>
                    <td>性别<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="xingbie"  />
                    </td>
                </tr>


				<tr>
                    <td>招聘类型<span style="color:red">*</span>：</td>
                    <td>
                       <select name="zhaopinType">
						<option value="">-请选择-</option>
						<option value="社会招聘">社会招聘</option>
						<option value="校园招聘">校园招聘</option>
					   </select>
                    </td>                
                </tr>

				<tr>
                    <td>EMAIL：</td>
                    <td>
                        <input type="text" name="email"  />
                    </td>                
                </tr>

				<tr>
                    <td>联系电话：</td>
                    <td>
                        <input type="text" name="tel" />
                    </td>                
                </tr>

				<tr>
                    <td>户口所在地：</td>
                    <td>
                        <input type="text" name="address"  />
                    </td>                
                </tr>

				<tr>
                    <td>住址：</td>
                    <td>
                        <input type="text" name="live"  />
                    </td>                
                </tr>
				<tr>
                    <td>政治面貌：</td>
                    <td>
                        <input type="text" name="mianmao"  />
                    </td>                
                </tr>
				<tr>
                    <td>身份证号：</td>
                    <td>
                        <input type="text" name="idcard"  />
                    </td>                
                </tr>
				<tr>
                    <td>毕业院校：</td>
                    <td>
                        <input type="text" name="school" />
                    </td>                
                </tr>	

				<tr>
                    <td>学历：</td>
                    <td>
						  <select name="xueli">
						<option>-请选择-</option>
						<option value="本科">本科</option>
						<option value="硕士">硕士</option>
					   </select>
                    </td>
                </tr>
				<tr>
                    <td>专业：</td>
                    <td>
                        <input type="text" name="zhuanye" />
                    </td>                
                </tr>
					<tr>
                    <td>工作经验：</td>
                    <td>
                        <input type="text" name="jianyan" />
                    </td>                
                </tr>
					<tr>
                    <td>薪资要求：</td>
                    <td>
                        <input type="text" name="xizi" />（月薪）
                    </td>                
                </tr>
					<tr>
                    <td>是否在职：</td>
                    <td>
                        <select name="zizhi">
							<option>-请选择-</option>
							<option value="在职">在职</option>
							<option value="离职">离职</option>
						</select>
                    </td>                
                </tr>
					<tr>
                    <td>是否应届生：</td>
                    <td>
                         <select name="yinjiesheng">
							<option>-请选择-</option>
							<option value="应届">应届</option>
							<option value="毕业">毕业</option>
						</select>
                    </td>                
                </tr>
			
					<tr>
                    <td>登记时间：</td>
                    <td>
                        <input type="text" name="time" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                    </td>                
                </tr>
				
					<tr>
                    <td>个人履历：</td>
                    <td>
                       <textarea cols="70" rows="13" name="jianli"></textarea>
                    </td>                
                </tr>
				
					<tr>
                    <td>简历附件：</td>
                    <td>
                        <input type="file" name="fujian" />
                    </td>                
                </tr>
			
					<tr>
                    <td>是否有人推荐面试：</td>
                    <td>
                      <select name="tuijian">
							<option>-请选择-</option>
							<option value="是">是</option>
							<option value="否">否</option>
						</select>
						推荐人：<input type="text" name="tuijianren" value="" />
						推荐时间：<input type="text" name="tuijiantime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                    </td>                
                </tr>
			
					<tr>
                    <td>推荐面试意见：</td>
                    <td>
                       <textarea cols="70" rows="13" name="yijian"></textarea>
                    </td>                
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="保存" />
						<input type="button" value="返回" onclick="javascript:history.back(-1);" />
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>