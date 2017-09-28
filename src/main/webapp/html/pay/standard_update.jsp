<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/html/pay/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 修改薪资标准 -->
<html>
    <head>
        <title>薪酬标准管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../../css/mine.css" type=	"text/css" rel="stylesheet">
        <base href="<%=basePath%>">
        <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.js"></script>
        <script type="text/javascript">
			$(function() {
				$("#myForm").validate({
					rules : {
						basePay:{
							required : true,
							max : 7000,
							number : true		
						},
						overtimePay :{
							number : true		
						},
						awarPay :{
							number : true		
						},
						travelPay :{
							number : true		
						},
						phonePay :{
							number : true		
						},
						mealPay :{
							number : true		
						},
						housePay :{
							number : true		
						},
						missionPay:{
							number : true		
						}
					},
					messages:{
						basePay:{
							required : '基本工资为必填项',
							max : '基本工资多不能超过7000',
							digits : '基本工资为数字'
						},
						overtimePay :{
							digits : '加班费为数字	'
						},
						awarPay :{
							digits : '绩效奖金是数字'
						},
						travelPay :{
							digits : '交通补助是数字'
						},
						phonePay :{
							digits : '通讯补助是数字'
						},
						mealPay :{
							digits : '餐补是数字'
						},
						housePay :{
							digits : '房补是数字'
						},
						missionPay:{
							digits : '出差补助是数字'
						}
					}
				});
			});
		</script>
        <script type="text/javascript">
       		var money=0;//all
       		var jb=0;
        	function save(){
        		var inputs=document.getElementsByClassName("mon");
        		for(var i=0;i<inputs.length;i++){
        			jb=eval(inputs[i].value+"+0");
        			money+=jb;
        			jb=0;
        		}
        		var input=document.getElementById("all");
        		input.value=money;
        		money=0;
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
                    <td><input type="text" name="wageBm" readonly value="${wageBean.wageBm}" /></td>
                </tr>
                <tr>
                    <td>薪酬标准名称<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="wageName"  value="${wageBean.wageName}" /> 
                    </td>
                </tr>
               
                <tr>
                    <td>制定人<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="zzrName" readonly value="${wageBean.zzrName}" /></td>
                </tr>
                <tr>
                    <td>登记人<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="djrName" readonly value="${wageBean.djrName}" />
					</td>
                </tr>
                <tr>
                    <td>登记时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="wageDate" readonly value="${wageBean.wageDate}" />
                    </td>
                </tr>

				<tr>
                    <td>基本工资<span style="color:red">*</span>：</td>
                    <td>
                        <input class="mon" type="text" name="basePay" onblur="save()" value="${wageBean.basePay}"/>元
                    </td>                
                </tr>

				<tr>
                    <td>绩效奖金：</td>
                    <td>
                        <input  class="mon" type="text" name="awarPay" value="${wageBean.awarPay}" onblur="save()" />元
                    </td>                
                </tr>

				<tr>
                    <td>交通补助：</td>
                    <td>
                        <input  class="mon" type="text" name="travelPay" value="${wageBean.travelPay}" onblur="save()"/>元
                    </td>                
                </tr>

				<tr>
                    <td>通讯补助：</td>
                    <td>
                        <input  class="mon" type="text" name="phonePay" value="${wageBean.phonePay}" onblur="save()"/>元
                    </td>                
                </tr>

				<tr>
                    <td>餐补：</td>
                    <td>
                        <input  class="mon" type="text" name="mealPay" value=" ${wageBean.mealPay}" onblur="save()"/>元
                    </td>                
                </tr>
				<tr>
                    <td>住房补助：</td>
                    <td>
                        <input  class="mon" type="text" name="housePay" value="${wageBean.housePay}" onblur="save()"/>元
                    </td>                
                </tr>
				<tr>
                    <td>出差补助：</td>
                    <td>
                        <input  class="mon" type="text" name="missionPay" value="${wageBean.missionPay}" onblur="save()"/>元
                    </td>                
                </tr>
				<tr>
                    <td>加班补助：</td>
                    <td>
                        <input  class="mon" type="text" name="overtimePay" value="${wageBean.overtimePay}" onblur="save()"/>元
                    </td>                
                </tr>	

				<tr>
                    <td>薪酬总额：</td>
                    <td>
						 <input type="text" readonly name="all" id="all" value="${wageBean.all}" />元
						 <input type="hidden" name="wageId" value="${wageBean.wageId} "> 
						 <input type="hidden" name="wageStatment" value="${wageBean.wageStatment}">
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
						<input type="reset" value="恢复">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>