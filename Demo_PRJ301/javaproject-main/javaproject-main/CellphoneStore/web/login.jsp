<%-- 
    Document   : index
    Created on : Feb 4, 2022, 10:30:29 PM
    Author     : hongd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="common/link.jsp"/>
    <link rel="stylesheet" href="styles/login.css">
    <title>Login</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center header">Cellphone Shop</h1>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-center align-items-center mt-5">
        
        <div class="card">
            
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item text-center"> 
                    <a class="nav-link active btl" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Đăng nhập</a> 
                </li>
                <li class="nav-item text-center"> 
                    <a class="nav-link btr" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Đăng kí</a> 
                </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
                <form action="login" method="post" class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                    <div class="form px-4 pt-5"> 
                        <input type="text" name="username" class="form-control" placeholder="Tên đăng nhập"> 
                        <input type="password" name="password" class="form-control" placeholder="Mật khẩu"> 
                        <c:if test="${not empty message}">
                            <span>${message}</span>
                        </c:if>
                        <button class="btn btn-dark btn-block">Đăng nhập</button> 
                    </div>
                </form>
                <form action="register" method="post" class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                    <div class="form px-4"> 
                        <input type="text" name="firstname" class="form-control" placeholder="Họ và tên đệm"> 
                        <input type="text" name="lastname" class="form-control" placeholder="Tên"> 
                        <input type="email" name="email" class="form-control" placeholder="Email"> 
                        <input type="text" name="username" class="form-control" placeholder="Tên đăng nhập"> 
                        <input type="password" name="password" class="form-control" id="password" placeholder="Mật khẩu"> 
                        <input type="password" name="repassword" class="form-control" id="repassword" placeholder="Nhập lại mật khẩu">
                        <span id="message"></span>
                        <br>
                        <span>${message1}</span>
                        <button class="btn btn-dark btn-block">Đăng kí</button> 
                    </div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="common/script.jsp"/>
    <script src="js/login.js"></script>
</body>
</html>