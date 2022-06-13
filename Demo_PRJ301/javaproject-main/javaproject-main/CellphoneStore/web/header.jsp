<%-- 
    Document   : index
    Created on : Feb 4, 2022, 10:30:29 PM
    Author     : hongd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="header">
    <div class="header-child-1">
        <div class="logo">
            <a href="<c:url value="/"/>"><img src="img/logo/store.svg" width="30" height="30" alt="Logo"></a>
            <div class="brand-name">
                <p>Cellphone Store</p>
            </div>
        </div>


        <form action="search" class="search-form">
            <input type="search" name="search_value" placeholder="Bạn muốn tìm gì?" id="search-box">
            <label for="search-box" class="fas fa-search"></label>
        </form>
        <div class="icons">
            <div class="shoping-cart">
                <div class="fas fa-shopping-cart"></div>
                <a href="<c:url value="/cart"/>">Giỏ hàng</a>
            </div>
            <c:if test="${sessionScope.user != null}">
                <div class="users">
                    <div class="fas fa-user"></div>
                    <a href="#">Xin chào, ${sessionScope.user.lastname}</a>
                    <div class="dropdown-content">
                        <c:if test="${sessionScope.user.role == 'sa'}">
                            <a href="<c:url value="/admin-home"/>">Trang quản lí</a>
                        </c:if>
                        <a href="<c:url value="/profile"/>">Thông tin tài khoản</a>
                        <a href="<c:url value="/purchase"/>">Đơn hàng</a>
                        <a href="<c:url value="/logout"/>">Đăng xuất</a>
                    </div>
                </div>
            </c:if>
            <c:if test="${sessionScope.user == null}">
                <div class="users">
                    <div class="fas fa-user"></div>
                    <a href="<c:url value="/login"/>">Đăng nhập</a>
                </div>
            </c:if>
        </div>
    </div>
    <div class="header-child-2">
        <nav class="navbar navbar-expand-md">
            <div class="container">
                <button class="navbar-toggler d-none" data-toggle="collapse" data-target="#navcol-1"><span
                        class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav w-100 justify-content-between">
                        <li class="nav-component dropdown ">
                            <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#" onclick="loadCategory()">Danh mục sản phẩm</a>

                            <div class="dropdown-menu" id="catemenu" role="menu">
                                <a class="dropdown-item" role="presentation" href="<c:url value="/productscate?category=0"/>">Tất cả sản phẩm</a>
                            </div>
                        </li>
                        <li class="nav-component dropdown ">
                            <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">Sản phẩm theo giá</a>
                            <div class="dropdown-menu" role="menu">
                                <a class="dropdown-item" role="presentation" href="<c:url value="/productbyprice?min=4&max=5"/>">Từ 4 - 5 triệu</a>
                                <a class="dropdown-item" role="presentation" href="<c:url value="/productbyprice?min=5&max=10"/>">Từ 5 - 10 triệu</a>
                                <a class="dropdown-item" role="presentation" href="<c:url value="/productbyprice?min=10&max=30"/>">Từ 10 - 30 triệu</a>
                                <a class="dropdown-item" role="presentation" href="<c:url value="/productbyprice?min=30&max=100"/>">Từ 30 - 50 triệu</a>
                            </div>
                        </li> 
                        <li class="nav-component dropdown">
                            <a class="nav-link" data-toggle="dropdown" aria-expanded="false" href="#">Miễn phí giao hàng</a>
                        </li>
                        <li class="nav-component dropdown">
                            <a class="nav-link" data-toggle="dropdown" aria-expanded="false" href="#">Đổi trả trong 15 ngày</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav> 
    </div>
</header>