<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/html/pay/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- 展示具体数据审核通过或者驳回 -->
<html>
    <head>
    	 <script type="text/javascript">
			function sh(sta){
				var oinput=document.getElementById("stat");
				console.log(oinput);
				oinput.value=sta;
				document.forms[0].submit();
			}
		</script>
        <title>薪酬——审核</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../css/mine.css" type="text/css" rel="stylesheet">
    </head>
    <body>

        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》薪酬标准审核</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="list_standard.html">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="wageSp.do" method="post" enctype="multipart/form-data">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">薪酬标准编号<span style="color:red">*</span>：</td>
                    <td><input type="text" name="f_goods_name" readonly value="${wage.wageBm }" /></td>
                </tr>
                <tr>
                    <td>薪酬标准名称<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="f_goods_name" readonly value="${wage.wageName }" /> 
                       <input type="hidden" id="stat" name="stat" value=""/>
          			   <input type="hidden"  name="wageId" value="${wage.wageId}"/>
                    </td>
                </tr>
               
                <tr>
                    <td>制定人<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="f_goods_price" readonly value="${wage.zzrName }" /></td>
                </tr>
                <tr>
                    <td>登记人<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" readonly name="f_goods_image" value="${wage.djrName }" />
					</td>
                </tr>
                <tr>
                    <td>登记时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="f_goods_image" readonly value="${wage.wageDate }" />
                    </td>
                </tr>


				<tr>
                    <td>基本工资<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="f_goods_image" readonly  value="${wage.basePay }"/>元
                    </td>                
                </tr>

				<tr>
                    <td>绩效奖金：</td>
                    <td>
                        <input type="text" name="f_goods_image" readonly value="${wage.awarPay }" />元
                    </td>                
                </tr>

				<tr>
                    <td>交通补助：</td>
                    <td>
                        <input type="text" name="f_goods_image" readonly value="${wage.travelPay }"/>元
                    </td>                
                </tr>

				<tr>
                    <td>通讯补助：</td>
                    <td>
                        <input type="text" name="f_goods_image" readonly value="${wage.phonePay }" />元
                    </td>                
                </tr>

				<tr>
                    <td>餐补：</td>
                    <td>
                        <input type="text" name="f_goods_image" readonly value="${wage.mealPay }" />元
                    </td>                
                </tr>
				<tr>
                    <td>住房补助：</td>
                    <td>
                        <input type="text" name="f_goods_image" readonly value="${wage.housePay }" />元
                    </td>                
                </tr>
				<tr>
                    <td>出差补助：</td>
                    <td>
                        <input type="text" name="f_goods_image" readonly value="${wage.missionPay }" />元
                    </td>                
                </tr>
				<tr>
                    <td>加班补助：</td>
                    <td>
                        <input type="text" name="f_goods_image" readonly value="${wage.overtimePay }"/>元
                    </td>                
                </tr>	

				<tr>
                    <td>薪酬总额：</td>
                    <td>
						 <input type="text" readonly name="f_goods_name" value="${wage.all }" />元
                    </td>
                </tr>


				<tr>
                    <td>备注：</td>
                    <td>
                        <input type="text" name="f_goods_image" />
                    </td>                
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button" value="审核通过" onclick="sh(2)">
						<input type="button" value="驳回"  onclick="sh(1)">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>