$(document).ready(function(){
	$("#FormLogin").validate({
        focusInvalid: false,
            ignore: "",
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true,
                }
            },
            messages: {
            	username: {
                    required: "Bạn chưa nhập tài khoản"
                },
                password: {
                    required: "Bạn chưa nhập mật khẩu"
                }
            },

            invalidHandler: function(event, validator) {
                //display error alert on form submit    
            },

            errorPlacement: function(label, element) { // render error placement for each input type   
                console.log(label);
                $('<span class="error"></span>').insertAfter(element).append(label)
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-success').addClass('has-error');
            },

            highlight: function(element) { // hightlight error inputs
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-success').addClass('has-error');
            },

            unhighlight: function(element) { // revert the change done by hightlight

            },

            success: function(label, element) {
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-error').addClass('has-success');
            },
    });
	$("#frmEvent").validate({
        focusInvalid: false,
            ignore: "",
            rules: {
            	name_event: "required",
            	time_start: "required",
            	time_end: "required",
            	address: "required"
            },
            messages: {
            	name_event: {
                    required: "Bạn chưa nhập tên sự kiện"
                }
            },

            invalidHandler: function(event, validator) {
                //display error alert on form submit    
            },

            errorPlacement: function(label, element) { // render error placement for each input type   
                console.log(label);
                $('<span class="error"></span>').insertAfter(element).append(label)
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-success').addClass('has-error');
            },

            highlight: function(element) { // hightlight error inputs
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-success').addClass('has-error');
            },

            unhighlight: function(element) { // revert the change done by hightlight

            },

            success: function(label, element) {
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-error').addClass('has-success');
            },
    });
	$("#FormRegister").validate({
        focusInvalid: false,
            ignore: "",
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true,
                    minlength: 6,
                },
                confirm_password: {
                	required: true,
                	equalTo: '#password'
                },
                email: {
                	required: true,
                	email: true
                },
                phone: {
                	required: true,
                	number:true
                },
                fullname: {
                	required: true,
                }
                
            },
            messages: {
            	username: {
                    required: "Bạn chưa nhập tên tài khoản"
                },
                password: {
                    required: "Bạn chưa nhập mật khẩu",
                    minlength: jQuery.validator.format("Mật khẩu ít nhất {0} kí tự")
                },
                confirm_password: {
                	required: "Chưa xác nhận mật khẩu",
                	equalTo: "Hai mật khẩu không khớp"
                },
                email: {
                	required: "Bạn chưa nhập E-mail",
                	email: "E-mail định dạng không chính xác"
                },
                phone: {
                	required: "Bạn chưa nhập số điện thoại",
                	number: "Số điện thoại không chính xác"
                },
                fullname: {
                	required: "Bạn chưa nhập tên đầy đủ của bạn"
                }
            },

            invalidHandler: function(event, validator) {
                //display error alert on form submit    
            },

            errorPlacement: function(label, element) { // render error placement for each input type   
                console.log(label);
                $('<span class="error"></span>').insertAfter(element).append(label)
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-success').addClass('has-error');
            },

            highlight: function(element) { // hightlight error inputs
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-success').addClass('has-error');
            },

            unhighlight: function(element) { // revert the change done by hightlight

            },

            success: function(label, element) {
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-error').addClass('has-success');
            },
    });
	$("#add-admin").validate({
        focusInvalid: false,
            ignore: "",
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true,
                    minlength: 6,
                },
                re_password: {
                	required: true,
                	equalTo: '#password'
                },
                email: {
                	required: true,
                	email: true
                },
                phone: {
                	required: true,
                	number:true
                },
                fullname: {
                	required: true,
                }
                
            },
            messages: {
            	username: {
                    required: "Bạn chưa nhập tên tài khoản"
                },
                password: {
                    required: "Bạn chưa nhập mật khẩu",
                    minlength: jQuery.validator.format("Mật khẩu ít nhất {0} kí tự")
                },
                re_password: {
                	required: "Chưa xác nhận mật khẩu",
                	equalTo: "Hai mật khẩu không khớp"
                },
                email: {
                	required: "Bạn chưa nhập E-mail",
                	email: "E-mail định dạng không chính xác"
                },
                phone: {
                	required: "Bạn chưa nhập số điện thoại",
                	number: "Số điện thoại không chính xác"
                },
                fullname: {
                	required: "Bạn chưa nhập tên đầy đủ của bạn"
                }
            },

            invalidHandler: function(event, validator) {
                //display error alert on form submit    
            },

            errorPlacement: function(label, element) { // render error placement for each input type   
                console.log(label);
                $('<span class="error"></span>').insertAfter(element).append(label)
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-success').addClass('has-error');
            },

            highlight: function(element) { // hightlight error inputs
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-success').addClass('has-error');
            },

            unhighlight: function(element) { // revert the change done by hightlight

            },

            success: function(label, element) {
                var parent = $(element).parent('.form-group');
                parent.removeClass('has-error').addClass('has-success');
            },
    });
	function redirect(url){
		window.location = url;
	}
	function loading( icon, status){
		if(status == 'on'){
			$(icon).modal("show");
		}
		else{
			$(icon).modal("hide");
		}
	}
	$("#FormLogin").on('submit',function(e){
		e.preventDefault();
		
		loading('#processing-modal','on');
		var form_login = $("#FormLogin").serializeArray();
		var url = $('#FormLogin').attr('action');
		setTimeout(function(){
			$.ajax({
				url: url,
				data: form_login,
				dataType: "json",
				type: "post",
				success: function (response) {
					
					if(response == "fail"){
						 loading('#processing-modal','off');
						 $('#notify').removeClass('alert alert-success');
		                 $('#notify').addClass('alert alert-danger').show();
		                 $('#msg').text('Email hoặc Password không chính xác');
		                 
					}else{ 
						$('#authenticate').text('Đăng nhập thành công, đang chờ chuyển trang');
						if(response == "admin"){
							redirect('admin-list.jsp');
						}
						else{
							redirect('home.jsp');
						}
		                 
					}											
				}
			});
		},1000)
		
	});
	$("#FormRegister #username").focus(function(){
		$('#check-username').hide();
	})
	$("#FormRegister #username").on('focusout',function(event){
//		alert(111);
		event.preventDefault();
		var username = $('#username').val();
		$.ajax({
			url: "CheckUsernameUnique?username=" + username,
			data: {username: username },
			dataType: "json",
			type: "post",
			success: function (response) {
				if(response == true){
					
					$('#check-username').show();
					$('#check-username').parent().removeClass('has-success');
					$('#check-username').parent().addClass('has-error');
					$('#check-username').text('Tên tài khoản đăng ký đã tồn tại');
					
				}						
			}
		
		})
		
	})
})