<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/html/pay/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>薪酬标准管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../css/mine.css" type=	"text/css" rel="stylesheet">
        <base href="<%=basePath%>">
        <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript">
       		var money=0;//all
        	function save(obj){
        		var input=document.getElementById("all");
        		var i=obj.value;
        		money=eval(money+"+"+i);
        		input.value=money;
        	}
        </script>
    </head>
    <body>
        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：-》薪酬标准管理》添加</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="list_standard.html">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div style="font-size: 13px;margin: 10px 5px">
            <form action="wage/standard_update2.do" method="post" id="myForm">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">薪酬标准编号<span style="color:red">*</span>：</td>
                    <td><input type="text" name="wageBm" value="${wageBean.wageBm}" /></td>
                </tr>
                <tr>
                    <td>薪酬标准名称<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="wageName" value="${wageBean.wageName}" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>制定人<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="zzrName" value="${wageBean.zzrName}" /></td>
                </tr>
                <tr>
                    <td>登记人<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="djrName" value="${wageBean.djrName}" />
					</td>
                </tr>
                <tr>
                    <td>登记时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="wageDate" value="${wageBean.wageDate}" />
                    </td>
                </tr>

				<tr>
                    <td>基本工资<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="basePay" onblur="save(this)" value="${wageBean.basePay}"/>元
                    </td>                
                </tr>

				<tr>
                    <td>绩效奖金：</td>
                    <td>
                        <input type="text" name="awarPay" value="${wageBean.awarPay}" onblur="save(this)" />元
                    </td>                
                </tr>

				<tr>
                    <td>交通补助：</td>
                    <td>
                        <input type="text" name="travelPay" value="${wageBean.travelPay}" onblur="save(this)"/>元
                    </td>                
                </tr>

				<tr>
                    <td>通讯补助：</td>
                    <td>
                        <input type="text" name="phonePay" value="${wageBean.phonePay}" onblur="save(this)"/>元
                    </td>                
                </tr>

				<tr>
                    <td>餐补：</td>
                    <td>
                        <input type="text" name="mealPay" value=" ${wageBean.mealPay}" onblur="save(this)"/>元
                    </td>                
                </tr>
				<tr>
                    <td>住房补助：</td>
                    <td>
                        <input type="text" name="housePay" value="${wageBean.housePay}" onblur="save(this)"/>元
                    </td>                
                </tr>
				<tr>
                    <td>出差补助：</td>
                    <td>
                        <input type="text" name="missionPay" value="${wage.missionPay}" onblur="save(this)"/>元
                    </td>                
                </tr>
				<tr>
                    <td>加班补助：</td>
                    <td>
                        <input type="text" name="overtimePay" value="${wageBean.overtimePay}" onblur="save(this)"/>元
                    </td>                
                </tr>	

				<tr>
                    <td>薪酬总额：</td>
                    <td>
						 <input type="text" readonly name="all" id="all" value="${wageBean.all}" />元
						 <input type="hidden" name="wageId" value="${wageBean.wageId} "> 
                    </td>
                </tr>
				<tr>
                    <td>备注：</td>
                    <td>
                        <input type="text" name="remark" value="${wageBean.remark}"/>
                    </td>                
                </tr>
                <tr>
                    <td colspan="2" align="center">
						<input type="submit" value="提交修改" id="tj">
						<input type="reset" value="清空">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>