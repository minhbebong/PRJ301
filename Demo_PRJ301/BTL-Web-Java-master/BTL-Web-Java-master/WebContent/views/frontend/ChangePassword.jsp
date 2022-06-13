<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="views/frontend/img/favicon.png"
	type="image/png" />
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/user.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Thay đổi mật khẩu</title>
</head>
<body>
	<%@include file="Header.jsp"%>
	<div class="app">
		<div class="bg-banner">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h3 class="bg-banner-title">Thay đổi mật khẩu</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="user__page">
			<div class="container">
				<div class="user__page--inner">
					<div class="form">
						<form action="<%=request.getContextPath()%>/ChangePassword"
							method="post" onsubmit="return(checkUpdate());" id="form-1">
							<input type="hidden" name="id"
								value="<%=session.getAttribute("id")%>">
							<div class="form-control">
								<label>Mật khẩu cũ: </label> <input type="password"
									name="oldPass" id="oldPass" placeholder="Mật khẩu cũ">
								<p class="form-message"></p>
							</div>
							<div class="form-control">
								<label>Mật khẩu mới: </label> <input type="password"
									name="newPass" id="newPass" placeholder="Mật khẩu mới">
								<p class="form-message"></p>
							</div>
							<div class="form-control">
								<label>Nhập lại mật khẩu: </label> <input type="password"
									name="newPassConfirm" id="newPassConfirm" placeholder="Xác nhận mật khẩu">
								<p class="form-message"></p>
							</div>
							<div class="form-control">
								<p class="form-message-error"></p>
							</div>
							<c:if test="${message != null}">
								<div class="form-control">
									<p class="form-message-error">Mật khẩu cũ không chính xác</p>
								</div>
							</c:if>
							<c:if test="${success != null}">
								<div class="form-control">
									<p class="form-message-error">Đổi mật khẩu thành công.</p>
								</div>
							</c:if>
							<div>
								<input type="submit" value="Cập nhật" class="signup-btn"
									onclick="checkUpdate()"> <a
									href="<%=request.getContextPath()%>/profile" class="btn-cancel">Trở lại</a>
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
	<script src="views/frontend/js/update.js"></script>
</body>
</html>