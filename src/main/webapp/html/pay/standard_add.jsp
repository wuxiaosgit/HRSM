<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/html/pay/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 添加审核 -->
<html>
    <head>
        <title>薪酬标准管理添加</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="../css/mine.css" type="text/css" rel="stylesheet">
        <base href="<%=basePath%>">
        <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="../js/jquery.validate.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#myForm").validate({
					rules : {
						wageBm : {
							required : true ,
							minlength:5,
						},
						wageName  : {
							required : true ,
						},
						wageDate  : {
							required : true ,
						},
						zzrName :{
							required : true ,
							minlength:2	,
							maxlength:4	
						},
						djrName :{
							required : true ,
							minlength:2	,
							maxlength:4	
						},
						basePay:{
							required : true,
							max : 7000,
							digits : true
						},
						overtimePay :{
							digits : true
						},
						awarPay :{
							digits : true
						},
						travelPay :{
							digits : true
						},
						phonePay :{
							digits : true
						},
						mealPay :{
							digits : true
						},
						housePay :{
							digits : true
						},
						missionPay:{
							digits : true
						}
					},
					messages:{
						wageBm : {
							required : '*编码标准编号为必填项*',
							minlength:'编码标准编号长度必须大于5',
						},
						wageName  : {
							required : '编码标准名称为必填项' ,
						},
						wageName  : {
							required : '编码标准名称为必填项' ,
						},
						wageDate  : {
							required : '登记日期为必填项' ,
						},
						zzrName :{
							required : '制作人名字为必填项' ,
							minlength:'制作人名字长度必须大于2'	,
							maxlength:'制作人名字必须小于5'	
						},
						djrName :{
							required : '登记人名字为必填项' ,
							minlength:'登记人名字长度必须大于2'	,
							maxlength:'登记人名字长度必须小于5'	
						},
						basePay:{
							required : '基本工资为必填项',
							max : '基本工资多不能超过7000',
							digits : '基本工资为正整数'
						},
						overtimePay :{
							digits : '加班费为正整数'
						},
						awarPay :{
							digits : '绩效奖金是正整数'
						},
						travelPay :{
							digits : '交通补助是正整数'
						},
						phonePay :{
							digits : '通讯补助是正整数'
						},
						mealPay :{
							digits : '餐补是正整数'
						},
						housePay :{
							digits : '房补是正整数'
						},
						missionPay:{
							digits : '出差补助是正整数'
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
                    <a style="text-decoration: none" href="wage/list.do">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>
        <div style="font-size: 13px;margin: 10px 5px">
            <form action="wage/insertwage.do" method="post" id="myForm">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td width="120px;">薪酬标准编号<span style="color:red">*</span>：</td>
                    <td><input type="text" name="wageBm" value="" /></td>
                </tr>
                <tr>
                    <td>薪酬标准名称<span style="color:red">*</span>：</td>
                    <td>
                       <input type="text" name="wageName"  /> 
                    </td>
                </tr>
               
                <tr>
                    <td>制定人<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="zzrName" value="" /></td>
                </tr>
                <tr>
                    <td>登记人<span style="color:red">*</span>：</td>
                    <td>
						<input type="text" name="djrName" value="" />
					</td>
                </tr>
                <tr>
                    <td>登记时间<span style="color:red">*</span>：</td>
                    <td>
                        <input type="text" name="wageDate" value="" />
                    </td>
                </tr>

				<tr>
                    <td>基本工资<span style="color:red">*</span>：</td>
                    <td>
                        <input class="mon" type="text" name="basePay" onblur="save(this)" />元
                    </td>                
                </tr>

				<tr>
                    <td>绩效奖金：</td>
                    <td>
                        <input type="text" class="mon" name="awarPay" value="0" onblur="save(this)" />元
                    </td>                
                </tr>

				<tr>
                    <td>交通补助：</td>
                    <td>
                        <input type="text" class="mon" name="travelPay" value="0" onblur="save(this)"/>元
                    </td>                
                </tr>

				<tr>
                    <td>通讯补助：</td>
                    <td>
                        <input type="text" class="mon" name="phonePay" value="0" onblur="save(this)"/>元
                    </td>                
                </tr>

				<tr>
                    <td>餐补：</td>
                    <td>
                        <input type="text" class="mon" name="mealPay" value="0" onblur="save(this)"/>元
                    </td>                
                </tr>
				<tr>
                    <td>住房补助：</td>
                    <td>
                        <input type="text" class="mon" name="housePay" value="0" onblur="save(this)"/>元
                    </td>                
                </tr>
				<tr>
                    <td>出差补助：</td>
                    <td>
                        <input type="text" class="mon" name="missionPay" value="0" onblur="save(this)"/>元
                    </td>                
                </tr>
				<tr>
                    <td>加班补助：</td>
                    <td>
                        <input type="text" class="mon" name="overtimePay" value="0" onblur="save(this)"/>元
                    </td>                
                </tr>	

				<tr>
                    <td>薪酬总额：</td>
                    <td>
						 <input type="text" readonly name="all" id="all" value="0" />元
						 <input type="hidden" name="wageStatment" value="1">
                    </td>
                </tr>
				<tr>
                    <td>备注：</td>
                    <td>
                        <input type="text" name="remark" />
                    </td>                
                </tr>
                <tr>
                    <td colspan="2" align="center">
						<input type="submit" value="提交审核" id="tj">
						<input type="reset" value="清空">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>