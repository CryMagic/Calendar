<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.*"%>
<%@ page language="java" import = "connect.*,java.util.*" session="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản Lý Lịch</title>
	<!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="dist/css/mycss.css">
	<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
	<link rel="stylesheet" href="dist/css/modal.css">
	<!-- fullCalendar 2.2.5-->
  	<link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.min.css">
  	<link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.print.css" media="print">
  	
  	<style>
  		.main-header{
  			position: fixed;
		    top:0; left:0;
		    width: 100%;
  		}
  		#fullcalendar{
  			position: fixed;
		    right:50%;
		    left:5%;
  		}
  		body{
			background: url("dist/img/calendar-background.jpg");
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
		}
  		div#fullcalendar{
			-webkit-box-shadow: 2px 3px 5px 0px rgba(0,0,0,0.75);
			-moz-box-shadow: 2px 3px 5px 0px rgba(0,0,0,0.75);
			box-shadow: 2px 3px 5px 0px rgba(0,0,0,0.75);
		    border: 1px solid #2196F3;
		    background:  #ededed;
		    
		}
		#fullcalendar .fc-toolbar{
			background:#1E88E5;
		}
		#fullcalendar .fc-center h2{
			text-transform:uppercase;
		}
		#fullcalendar .fc-unthemed .fc-today{
			background: lightgray;
		}
		div#fullcalendar .fc-view-controller> .fc-view>table{
			height:350px;
		}
		#form-tranparent{
			  background: rgba(0, 0, 0, 0.1);
			  border: 1px solid #e3e3e3;
			  border-radius: 4px;
			  color:#ffffff
		}
  	</style>
</head>
<body class="hold-transition skin-blue">
	<% if(session.getAttribute("username") != null){
		response.sendRedirect("home.jsp");
	} 
	%>
	<header class="main-header">
		<!-- Logo -->
		<a href="index.jsp" class="logo"> 
			<span class="logo-mini">
				<img src="dist/img/calendar.png" alt="" width="45px" height="45px">
			</span> <!-- logo for regular state and mobile devices --> 
			<span class="logo-lg"> 
				<img src="dist/img/calendar.png" alt="" width="45px" height="45px"> <b>Quản lý lịch</b>
			</span>
		</a>
		<nav class="navbar navbar-static-top">
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<li class="dropdown user user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="modal" data-target="#ModalDangNhap"> 
							<img src="dist/img/login.png" class="user-image"> 
							<span class="hidden-xs">Đăng Nhập</span>
						</a>
					</li>
					<li class="dropdown user user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="modal" data-target="#ModalDangKy"> 
							<img src="dist/img/register.png" class="user-image"> <span class="hidden-xs">Đăng Ký</span>
						</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	
	<div class="container">
		<div style="padding:40px"></div>
		<div class="modal fade" id="ModalDangNhap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	    	<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<img class="img-circle" id="img_logo" src="dist/img/icon-login.png">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
					</div>
	                
	                <!-- Begin # DIV Form -->
	                <div id="div-forms">
	                    <form id="FormLogin" method="POST" action="LoginAjax">
			                <div class="modal-body">
			                	<div class="form-group">
			                		<label>Username</label>
			                		<input id="login_username" name="username" class="form-control" type="text" placeholder="Nhập tài khoản">
			                	</div>
					    		<div class="form-group">
					    			<label>Password</label>
					    			<input id="login_password" name="password" class="form-control" type="password" placeholder="Nhập Password">
					    		</div>
					    		
	                            <div class="checkbox">
	                                <label>
	                                    <input type="checkbox"> Nhớ mật khẩu
	                                </label>
	                            </div>
	                            <div class="modal modal-static fade" id="processing-modal" role="dialog" aria-hidden="true">
								    <div class="modal-dialog">
								        <div class="modal-content">
								            <div class="modal-body">
								                <div class="text-center">
								                    <img src="http://www.travislayne.com/images/loading.gif" class="icon" />
								                    <h5 class="success" id="authenticate">Đang chờ xác thực... <button type="button" class="close" style="float: none;" data-dismiss="modal" aria-hidden="true">×</button></h5>
								                </div>
								            </div>
								        </div>
								    </div>
								</div>
	                            <div id="notify" style="display:none">
			                        <a class="close" data-dismiss="alert" aria-hidden="true">&times;</a>
			                        <span id="msg"></span>
			                    </div>
			                    <div class="text-center">
								    <img src="dist/img/loading.gif" width="10%" style="display:none" id="loading">
								</div>
	        		    	</div>
					        <div class="modal-footer">
	                            <div>
	                                <button type="submit" class="btn btn-primary btn-lg btn-block">Đăng nhập</button>
	                            </div>
					    	    <div>
	                                <button id="login_lost_btn" type="button" class="btn btn-link">Quên mật khẩu?</button>
	                                <button id="login_register_btn" data-toggle="modal" data-target="#ModalRegister" type="button" class="btn btn-link">Đăng ký</button>
	                            </div>
					        </div>
	                    </form>
	                    <!-- End # Login Form -->        
	                </div>
	                <!-- End # DIV Form -->
	                
				</div>
			</div>
		</div>
		<div class="space" style="margin:20px"></div>
		<div class="row">
			<div class="col-sm-6">
				
			</div>
			<div class="col-sm-4 col-sm-offset-1">
				<div id="form-tranparent" class="panel panel-primary">
					<div class="panel-body">
						<form id="FormRegister" method="POST" action="RegisterServlet" role="form">
							<div class="form-group">
								<h2 class="text-center">Đăng ký tài khoản</h2>
							</div>
							<div class="form-group">
								<label class="control-label" for="signupName">Tên tài khoản</label>
								<input type="text" id="username" placeholder="Nhập tên tài khoản" class="form-control" name="username">
								<label id="check-username" style="display:none" class="error" for="username">Bạn chưa nhập tên tài khoản</label>
							</div>
							<div class="form-group">
								<label class="control-label" for="signupPassword">Mật khẩu</label>
								<input type="password" id="password" placeholder="Nhập mật khẩu" class="form-control" name="password">
							</div>
							<div class="form-group">
								<label class="control-label" for="signupPasswordagain">Nhập lại mật khẩu</label>
								<input type="password" class="form-control" placeholder="Nhập lại mật khẩu" name="confirm_password">
							</div>
							
							<div class="form-group">
								<label class="control-label" for="signupName">Tên người dùng</label>
								<input type="text" placeholder="Nhập tên tài khoản" class="form-control" name="fullname">
							</div>
							<div class="form-group">
								<label class="control-label" for="signupName">Giới tính</label>
								<div class="radio">
								  	<label>
								    	<input type="radio" name="gender" id="optionsRadios1" checked>
								    	Nam
								  	</label>
								</div>
								<div class="radio">
								  	<label>
									    <input type="radio" name="gender" id="optionsRadios2">
									   	Nữ
								  	</label>
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label" for="signupPassword">E-mail</label>
								<input type="email" placeholder="Nhập E-mail" class="form-control" name="email">
							</div>
							<div class="form-group">
								<label class="control-label" for="signupPasswordagain">Số điện thoại</label>
								<input type="text" class="form-control" placeholder="Nhập số điện thoại" name="phone">
							</div>
														
							<div class="form-group">
								<button type="submit" class="btn btn-info btn-block">Tạo tài khoản</button>
							</div>
							<hr>
							<p></p>Đã có tài khoản? <a style="color:blue" href="#" data-toggle="modal" data-target="#ModalDangNhap">Đăng nhập</a></p>
						</form>
					</div>
				</div>
			</div>
		</div>
		
	</div>

	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="dist/js/angular.min.js"></script>
	<script src="dist/js/app/app.js"></script>
	<script src="dist/js/jquery.validate.js"></script>
	<script src="dist/js/script-validate.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="plugins/fullcalendar/fullcalendar.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.2.0/fullcalendar.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.2.0/locale/vi.js"></script>
	<script src="dist/js/calendar-today.js"></script>
	<script>
	
	</script>
</body>
</html>