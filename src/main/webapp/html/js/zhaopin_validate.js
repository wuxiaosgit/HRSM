
	$.validator.setDefaults({
		submitHandler: function(form) {
			 form.submit(); 
		}
	});
	$().ready(function() {
		$("#demo1_add_form").validate({
			rules: {

				deptName: "required",
				zhaopinType:"required",
				zhaopinNum: {
					required: true,
					digits:true
				},
				endTime: {
					required: true,
				},
				startTime: {
					required: true,
				},
				jobmiaoshu: {
					required: true
				},
				yaoqiu: "required"
			},
			messages: {
				zhaopinNum: {
					required: "数字不能为空",
					minlength: "请输入一个正整数"
				},
				startTime: {
					required: "时间不能为空"
				
				},
				endTime: {
					required: "截止时间不能为空"
				
				},
				jobmiaoshu: "职位描述不能为空",
				yaoqiu: "要求不能为空",
				
			}
		});
	});
