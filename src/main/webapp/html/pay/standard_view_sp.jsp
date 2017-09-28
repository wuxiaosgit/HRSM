<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/html/pay/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- 展示具体内容 -->
<html>
    <head>
        <title>薪酬标准管理</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../css/mine.css" type="text/css" rel="stylesheet">
    </head>

    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》薪酬标准管理</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                	<a style="text-decoration: none" href="javascript:history.back(-1);">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="./admin.php?c=goods&a=add" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">薪酬标准编号：</td>
                    <td>
						${wageBean.wageBm}
					</td>
                </tr>
                <tr>
                    <td>薪酬标准名称：</td>
                    <td>
						${wageBean.wageName}
					</td>
                </tr>
                <tr>
                    <td>薪酬总额：</td>
                     <td>
						${wageBean.all}元
					</td>
                </tr>
                <tr>
                    <td>制定人：</td>
                     <td>
						${wageBean.zzrName}
					</td>
                </tr>
                <tr>
                    <td>登记人：</td>
                     <td>
						${wageBean.djrName}
					</td>
                </tr>
                <tr>
                    <td>登记时间：</td>
                     <td>
						${wageBean.wageDate}
					</td>
                </tr>


				<tr>
                    <td>基本工资：</td>
                     <td>
						${wageBean.basePay}
					</td>               
                </tr>

				<tr>
                    <td>绩效奖金：</td>
                     <td>
						${wageBean.awarPay}
					</td>                
                </tr>

				<tr>
                    <td>交通补助：</td>
                    <td>
                        ${wageBean.travelPay}
                    </td>                
                </tr>

				<tr>
                    <td>通讯补助：</td>
                    <td>
                       ${wageBean.phonePay}
                    </td>                
                </tr>

				<tr>
                    <td>餐补：</td>
                    <td>
                        ${wageBean.mealPay}
                    </td>                
                </tr>
				<tr>
                    <td>住房补助：</td>
                    <td>
                       ${wageBean.housePay}
                    </td>                
                </tr>
				<tr>
                    <td>出差补助：</td>
                    <td> 
                       ${wageBean.missionPay}
                    </td>                
                </tr>
				<tr>
                    <td>加班补助：</td>
                    <td>
                        ${wageBean.overtimePay}元
                    </td>                
                </tr>	
                <tr>
                    <td>工资总额：</td>
                    <td> 
                       ${wageBean.all}
                    </td>                
                </tr>
				<tr>
                    <td>备注：</td>
                    <td>
                    	   ${wageBean.remark}
                    </td>                
                </tr>
            </table>
            </form>
        </div>
    </body>
</html>