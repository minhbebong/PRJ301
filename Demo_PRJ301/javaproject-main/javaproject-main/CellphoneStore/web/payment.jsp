<%-- 
    Document   : cart
    Created on : Mar 7, 2022, 12:43:20 AM
    Author     : hongd
--%>

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
                <form action="payment" method="post" class="form">
                            <div class="col-md-12 dilivery-info">
                                <h5>Thông tin vận chuyển</h1>
                                <p>Họ và tên: ${sessionScope.user.firstname} ${sessionScope.user.lastname}</p>
                                <p>Địa chỉ: ${sessionScope.user.address}</p>
                                <p>Số điện thoại: ${sessionScope.user.phone}</p>
                                <p>Ghi chú: </p>
                                <input type="text" name="description" id="des">
                            </div>


                                <table class="table table-dark">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col" colspan="2">Sản phẩm</th>
                                            <th scope="col">Phân loại</th>
                                            <th scope="col">Đơn giá</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col" colspan="2  ">Số tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${products != null}">
                                            <c:set var="c" value="${products}"/>
                                            <c:set var="id" value="0"/>
                                            <c:forEach items="${c.items}" var="i">
                                                <c:set var="id" value="${id+1}"/>
                                                <tr>
                                                    <td scope="row">${id}</td>
                                                    <td><img id="img-items" src="${i.products.image}" class="img-responsive" alt=""></td>
                                                    <td>&nbsp;${i.products.name} </td>
                                                    <td>${i.color.color} - ${i.storage.storage} </td>
                                                    <td id="item-price" class="i-price">${i.products.price}</td>
                                                    <td><div><input type="text" value="${i.quantity}" name="qty" class="qty-in" readonly></div></td>
                                                    <td id="total-item-price" class="i-price">${i.products.price*i.quantity}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>



                                <div class="payment">
                                    <div class="price"><span class="price-title">Tổng giá: </span><span
                                            class="price-total">24.990.000đ</span>
                                    </div>
                                    <div class="confirm"><button id="submit">Xác nhận</button></div>
                                </div>



                </form>
            </div>
        </div>
            <!-- Footer -->
            <jsp:include page="footer.jsp"/>
            <jsp:include page="common/script.jsp"/>
            <script src="js/cart.js"></script>

    </body>

</html>

