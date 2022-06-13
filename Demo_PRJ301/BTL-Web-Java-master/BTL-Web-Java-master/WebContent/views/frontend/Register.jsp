<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="views/frontend/img/favicon.png" type="image/png" />
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/home.css">
<link rel="stylesheet" href="views/frontend/css/user.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Register</title>
</head>
<body>
	<%@include file="Header.jsp"%>

	<div class="app">
		<div class="bg-banner">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h3 class="bg-banner-title">Đăng ký tài khoản</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="user__page">
			<div class="container">
				<div class="user__page--inner">
					<div class="form">
						<form action="<%=request.getContextPath()%>/register"
							method="post" onsubmit="return(checkRegister());" id="form-1">
							<div class="form-control">
								<label>User name: </label> <input type="text" id="username"
									name="username" placeholder="Tên tài khoản">
								<p class="form-message"></p>
							</div>
							<div class="form-control">
								<label>Password: </label> <input type="password" id="password"
									name="password" placeholder="Mật khẩu">
								<p class="form-message"></p>
							</div>
							<div class="form-control">
								<label>Confirm: </label> <input type="password"
									id="passwordConfirm" name="passwordConfirm"
									placeholder="Mật khẩu">
								<p class="form-message"></p>
							</div>
							<div class="form-control">
								<label>Name: </label> <input type="text" name="fullname"
									id="fullname" placeholder="Họ và tên">
								<p class="form-message"></p>
							</div>
							<div class="form-control">
								<label>Address: </label> <input type="text" name="address"
									id="address" placeholder="Địa chỉ">
								<p class="form-message"></p>
							</div>
							<div class="form-control">
								<label>Phone: </label> <input type="text" name="phone"
									id="phone" placeholder="Số điện thoại">
								<p class="form-message"></p>
							</div>
							<c:if test="${message != null}">
								<div class="form-control">
									<p class="form-message-error">Đăng ký thất bại. Tài khoản đã được đăng ký.</p>
								</div>
							</c:if>
							<div class="form-control">
								<p class="form-message-error"></p>
							</div>
							<div class="form-control">
								<button type="submit" class="signup-btn"
									onclick="checkRegister()">Đăng ký</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="Footer.jsp"%>

	<script src="views/frontend/js/jquery-3.5.1.min.js"></script>
	<script src="views/frontend/js/all.min.js"></script>
	<script src="views/frontend/js/check.js"></script>
</body>
</html>