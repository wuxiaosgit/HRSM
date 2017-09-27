$.validator.setDefaults({
		submitHandler: function(form) {
			 form.submit(); 
		}
	});
	$().ready(function() {
		$("#demo2_add_form").validate({
			rules: {

				roleName: "required",
				roleNumber: "required",
				deptShortName:"required",
				xingming:"required",
				xingbie:"required",
				zhaopinType:"required",
				email:{
					required:true,
					email:true
				},
				dtime:"required",
				tuijianren:"required",
				tuijiantime:"required"
			},
			messages: {
				
				roleNumber: {
					required: "部门编号不能为空",
				},
				xingming: {
					required: "姓名不能为空",
				
				},
				xingbie: {
					required: "性别不能为空"
				
				},
				email: {
					email:"请输入正确的邮箱格式",
					required: "邮箱不能为空"
				},
				tuijiantime: "推荐时间不能为空",
				tuijianren: "推荐人不能为空",
				deptShortName:"请选则招聘类型不能为空",
			}
		});
	});
