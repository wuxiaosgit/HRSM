<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
    <head>
    	<base href="<%=basePath%>">
        <title>薪酬标准管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../../css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》人事管理 -》人事档案管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="html/pmag/demo1/list.jsp">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="pmag/insert.do" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">档案编码<span style="color:red">*</span>：</td>
                    <td><input type="text" name="pmagCode" value="" /></td>
                </tr>
                <tr>
                    <td>所属部门<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="pmagDept" value="" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>档案状态<span style="color:red">*</span>：</td>
                    <td>
						<select name="pmagVerifyState">
							<option>--请选择--</option>
							<option values="1">试用期</option>
							<option values="2">正式员工</option>
							<option values="3">离职</option>
							<option values="4">已删除</option>
							<option values="5">实习员工</option>
						</select>
					</td>
                </tr>
                <tr>
                    <td>职位名称<span style="color:red">*</span>：</td>
                    <td>
						<input type="text"  name="pmagDoom" value="" />
					</td>
                </tr>
                <tr>
                    <td>职位编码<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="pmagDoomCode" value="" />
                    </td>
                </tr>

				 <tr>
                    <td>职称<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="pmagCheng" value="" />
                    </td>
                </tr>
				<tr>
                    <td>姓名<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="pmagName"  value=""/>
                    </td>                
                </tr>

				<tr>
                    <td>性别：</td>
                    <td>
                        <input type="radio" name="pmagSex" checked value="1"/>男 <input type="radio" name="pmagSex" value="0"/>女
                    </td>                
                </tr>

				<tr>
                    <td>EMAIL：</td>
                    <td>
                        <input type="text" name="pmagEmai" value=""/>
                    </td>                
                </tr>

				<tr>
                    <td>联系电话：</td>
                    <td>
                        <input type="text" name="pmagPhone" value="" />
                    </td>                
                </tr>

				<tr>
                    <td>住址：</td>
                    <td>
                        <input type="text" name="pmagAddress" value="" />
                    </td>                
                </tr>
				<tr>
                    <td>身份证号：</td>
                    <td>
                        <input type="text" name="pmagShen" value="" />
                    </td>                
                </tr>
				<tr>
                    <td>户口所在地：</td>
                    <td>
                        <input type="text" name="pmagHuKou" value="" />
                    </td>                
                </tr>
				<tr>
                    <td>政治面貌：</td>
                    <td>
                        <input type="text" name="pmagMiao" value=""/>
                    </td>                
                </tr>	

				<tr>
                    <td>毕业院校：</td>
                    <td>
						 <input type="text" name="pmagXiao" value="" />
                    </td>
                </tr>


				<tr>
                    <td>专业：</td>
                    <td>
                        <input type="text" name="pmagYe" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>学历：</td>
                    <td>
                        <select name="pmagLi">
							<option values="6">--请选择--</option>
							<option values="7">专科</option>
							<option values="8">本科</option>
							<option values="9">硕士</option>
							<option values="10">博士</option>
						</select>
                    </td>                
                </tr>
				<tr>
                    <td>薪酬标准：</td>
                    <td>
                        <select name="pmagMoney">
							<option>--请选择--</option>
							<option values="11">高级软件工程师</option>
							<option values="12">中级软件工程师</option>
							<option values="13">初级软件工程师</option>
						</select>
                    </td>                
                </tr>
				<tr>
                    <td>开户行：</td>
                    <td>
                        <input type="text" name="pmagBank" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>银行卡号：</td>
                    <td>
                        <input type="text" name="pmagBankId" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>社保卡号：</td>
                    <td>
                        <input type="text" name="pmagInsuranceId" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>登记人：</td>
                    <td>
                        <input type="text" name="pmagPeg" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>建档时间：</td>
                    <td>
                        <input type="text" name="pmagTime" value=""/>
                    </td>                
                </tr>
				<tr>
                    <td>个人履历：</td>
                    <td>
                        <textarea name="pmagJing"></textarea>
                    </td>                
                </tr>
				<tr>
                    <td>家庭关系信息：</td>
                    <td>
                        <textarea name="pmagFamily"></textarea>
                    </td>                
                </tr>
				<tr>
                    <td>备注：</td>
                    <td>
                        <textarea name="pmagRemark"></textarea>
                    </td>                
                </tr>
				<tr>
                    <td>简历附件：</td>
                    <td>
                       <input type="file" name="" value=""/> 

                    </td>                
                </tr>
				<tr>
                    <td></td>
                    <td>
                        <a href="">张华个人简历.doc</a>  <a href="">删除</a>
                    </td>                
                </tr>
				
                <tr>
                    <td colspan="2" align="center">
						<input type="submit" value="还回">
						<input type="submit" value="提交审核">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>