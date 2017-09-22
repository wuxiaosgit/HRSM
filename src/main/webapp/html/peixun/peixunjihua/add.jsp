<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>培训管理</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link href="../../css/mine.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》培训管理 -》修改培训计划</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="list.html">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div style="font-size: 13px;margin: 10px 5px">
            <form action="./admin.php?c=goods&a=add" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">培训名称<span style="color:red">*</span>：</td>
                    <td><input type="text" name="f_goods_name" value="技术专家和教学专家的合作" /></td>
                </tr>
                <tr>
                    <td>培训讲师<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="f_goods_name" value="杨驰" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>培训时间<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="f_goods_price" value="2013-10-10" /></td>
                </tr>
                <tr>
                    <td>至</td>
                    <td>
						<input type="text" readonly name="f_goods_image" value="2013-12-10" />
					</td>
                </tr>
                <tr>
                    <td>培训目的<span style="color:red">*</span>：</td>
                    <td>
                        <textarea>一个新开辟领域的探讨，探讨摸索</textarea>
                    </td>
                </tr>


				<tr>
                    <td>参训人员<span style="color:red">*</span>：</td>
                    <td>
                        <textarea>李明、 潘贞玉、 李治、 武欣、 孙威、 韩健、 周嵘、 李红、 乔伟、 冯娜娜、 王艳丽、 蒋红林、 韩露、 于学杰、 李娜、 王俊鑫、 田仲义、 袁震</textarea>
                    </td>                
                </tr>

				<tr>
                    <td>培训简介：</td>
                    <td>
                        <textarea>技术专家和教学专家合作开发技术类课程的方法，包括开发流程、岗位职责与沟通方式。</textarea>
                    </td>                
                </tr>

				<tr>
                    <td>培训资料：</td>
                    <td>
                        <input type="file" name="f_goods_image" value=""/>
                    </td>                
                </tr>

				<tr>
                    <td></td>
                    <td>
                        <a href="" >技术专家和教学专家的合作.zip</a> &nbsp;&nbsp;<a href="">删除</a>
                    </td>                
                </tr>
				
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="保存">
						<input type="submit" value="申请复核">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
</body>
</html>