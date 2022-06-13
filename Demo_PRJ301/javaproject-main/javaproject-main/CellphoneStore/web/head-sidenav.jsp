<%-- 
    Document   : head-sidenav
    Created on : Feb 28, 2022, 12:46:30 AM
    Author     : hongd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header">
        <div class="header-child-1">
            <div class="logo">
                <a href="<c:url value="/"/>"><img src="img/logo/store.svg" width="30" height="30" alt=""></a>
                <div class="brand-name">
                    <p>Cellphone Store</p>
                </div>
            </div>

            <form action="" class="search-form">
                <input type="search" name="" placeholder="Bạn muốn tìm gì?" id="search-box">
                <label for="search-box" class="fas fa-search"></label>
            </form>

            <div class="icons">
                <c:if test="${sessionScope.user != null}">
                    <div class="users">
                        <div class="fas fa-user"></div>
                        <a href="#">Xin chào, ${sessionScope.user.lastname}</a>
                        <div class="dropdown-content">
                            <a href="<c:url value="/"/>">Về trang chủ</a>
                            <a href="<c:url value="/logout"/>">Đăng xuất</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <a onclick="openNav()" id="menu"><i class="fa-solid fa-bars"></i></a>
    </header>

    <div class="my-sidenav" id="sidenav">
        <a href="<c:url value="/admin-home"/>"><i class="fa-solid fa-gauge"></i>&nbsp; Tổng quan</a>
        <a href="<c:url value="/admin-order"/>"><i class="fa-solid fa-file-invoice-dollar"></i>&nbsp; Đơn hàng</a>
        <a href="<c:url value="/admin-manage"/>"><i class="fa-solid fa-list-check"></i>&nbsp; Quản lí sản phẩm</a>
        <a href="<c:url value="/admin-profilemanage"/>"><i class="fa-solid fa-list-check"></i>&nbsp; Quản lí người dùng</a>
    </div>