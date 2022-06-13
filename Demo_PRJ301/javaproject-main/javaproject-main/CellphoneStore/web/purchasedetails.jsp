<%-- 
    Document   : cart
    Created on : Mar 7, 2022, 12:43:20 AM
    Author     : hongd
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : index
    Created on : Feb 4, 2022, 10:30:29 PM
    Author     : hongd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Cellphone Shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="common/link.jsp"/>
        <link rel="stylesheet" href="styles/cart.css">
    </head>
    <body class="d-flex flex-column min-vh-100">
        <!-- Navbar -->
        <jsp:include page="header.jsp" />

        <!-- Info -->
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h6>Thông tin vận chuyển đơn hàng </h6>

                </div>
                <div class="col-12 dilivery-info">
                    <h5>Thông tin vận chuyển</h1>
                        <p>Họ và tên: ${sessionScope.user.firstname} ${sessionScope.user.lastname}</p>
                        <p>Địa chỉ: ${sessionScope.user.address}</p>
                        <p>Số điện thoại: ${sessionScope.user.phone}</p>
                        <p>Ghi chú: </p>
                        <input type="text" name="description" id="des" value="${list.get(0).description}" readonly="">
                        <p>Trạng thái đơn hàng: <c:if test=""></c:if>
                            <c:choose>
                                <c:when test="${list.get(0).status == 'pd'}">
                                    Chờ xác nhận
                                </c:when>
                                    
                                <c:when test="${list.get(0).status == 'cf'}">
                                    Đã xác nhận
                                </c:when>
                            </c:choose>
                        </p>

                        </div>

                        <table class="table table-dark">

                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col" colspan="2">Sản phẩm</th>
                                    <th scope="col">Phân loại</th>
                                    <th scope="col">Đơn giá</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Số tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="id" value="0"/>
                                <c:forEach items="${list}" var="l">
                                    <c:set var="id" value="${id+1}"/>
                                    <tr>
                                        <td scope="row">${id}</td>
                                        <td><img id="img-items" src="${l.products.image}" class="img-responsive" alt="">
                                        </td>
                                        <td>&nbsp;${l.products.name}</td>
                                        <td>${l.color} - ${l.storage} </td>
                                        <td id="item-price">${l.price}</td>
                                        <td>
                                            <div><input type="text" value="${l.quantity}" name="qty"
                                                        class="qty-in" readonly></div>
                                        </td>
                                        <td id="total-item-price">${l.total_price}</td>
                                    </tr>
                                </c:forEach>
                        </table>
                </div>
            </div>
            <!-- Footer -->
            <jsp:include page="footer.jsp"/>
            <jsp:include page="common/script.jsp"/>
            <script src="js/cart.js"></script>

    </body>

</html>

