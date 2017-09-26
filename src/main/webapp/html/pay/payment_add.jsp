<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/html/pay/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 发他妈的工资 -->
<html>
    <head>
        <title>薪资发放</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>
        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》薪酬发放管理 -》发薪</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="javascript:history.back();">【返回】</a>
                </span>
            </span>
        </div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="./admin.php?c=goods&a=add" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td>部门</td>
                    <td>
                        <select name="f_goods_category_id">
                            <option value="0">请选择</option>
                            <option value="1">人事部</option>
                            <option value="2">财务部</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>员工</td>
                    <td>
                        <select name="f_goods_brand_id">
                            <option value="0">请选择</option>
                            <option value="1">李红</option>
                            <option value="2">张晓</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>发薪时间</td>
                    <td><input type="text" name="" value="2017-08-15" /></td>
                </tr>
                <tr>
                    <td>薪酬标准</td>
                    <td>
                    <select>
                    <option>请选择</option>
                    <option>初级工程师</option>
                    <option>中级工程师</option>
                    <option>高级工程师</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>工资总额</td>
                    <td><input type="text" name="" value="8000" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="发薪">
						<input type="button" value="返回" onclick="javascript:history.back()">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>