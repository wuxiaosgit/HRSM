$.validator.setDefaults({
		submitHandler: function(form) {
			 form.submit(); 
		}
	});
	$().ready(function() {
		$("#demo2_add_roleName").validate({
			rules: {

				demo2_add_roleName: "required",
				demo2_add_deptShortname: "required",
				xingming:"required",
				xingbie:"required",
				zhaopinType:"required",
				zhaopinNum: {
					required: true,
					min:0
				},
				email:{
					email:true
				},
				tel: {
					
				}
			},
			messages: {
				//firstname: "Please enter your firstname",
				//lastname: "Please enter your lastname",
				zhaopinNum: {
					required: "数字不能为空",
					minlength: "Your username must consist of at least 2 characters"
				},
				startTime: {
					required: "时间不能为空"
				
				},
				endTime: {
					required: "时间不能为空"
				
				},
				email: "Please enter a valid email address",
				agree: "Please accept our policy",
				topic: "Please select at least 2 topics"
			}
		});
		// propose username by combining first- and lastname
		$("#username").focus(function() {
			var firstname = $("#firstname").val();
			var lastname = $("#lastname").val();
			if (firstname && lastname && !this.value) {
				this.value = firstname + "." + lastname;
			}
		});

		//code to hide topic selection, disable for demo
		var newsletter = $("#newsletter");
		// newsletter topics are optional, hide at first
		var inital = newsletter.is(":checked");
		var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
		var topicInputs = topics.find("input").attr("disabled", !inital);
		// show when newsletter is checked
		newsletter.click(function() {
			topics[this.checked ? "removeClass" : "addClass"]("gray");
			topicInputs.attr("disabled", !this.checked);
		});
	});
