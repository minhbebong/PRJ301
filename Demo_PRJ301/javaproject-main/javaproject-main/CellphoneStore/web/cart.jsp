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
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
            <c:if test="${size == 'ds'}">
                <table class="table table-dark">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col" colspan="2">Sản phẩm</th>
                            <th scope="col">Phân loại</th>
                            <th scope="col">Đơn giá</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Số tiền</th>
                            <th scope="col">Thao tác</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:set var="c" value="${cart}"/>
                        <c:set var="id" value="0"/>
                        <c:forEach items="${c.items}" var="i">
                            <c:set var="id" value="${id+1}"/>
                            <tr>
                                <td scope="row">${id}</td>
                                <td><img id="img-items" src="${i.products.image}" class="img-responsive" alt=""></td>
                                <td>&nbsp;${i.products.name} </td>
                                <td>${i.color.color} - ${i.storage.storage} </td>
                                <td id="item-price" class="i-price">${i.products.price}</td>
                                <td><div><a href = "<c:url value="/qtyprocess?num=-1&id=${i.products.id}&cid=${i.color.id}&sid=${i.storage.id}"/>"><input type="button" value="-" class="qty-btn"></a><input type="text" value="${i.quantity}" name="qty" class="qty-in" readonly><a href = "<c:url value="/qtyprocess?num=1&id=${i.products.id}&cid=${i.color.id}&sid=${i.storage.id}"/>"><input type="button" value="+" class="qty-btn"></a></div></td>
                                <td id="total-item-price" class="i-price">${i.products.price*i.quantity}</td>
                                <td><a href="<c:url value="/qtyprocess?num=0&id=${i.products.id}&cid=${i.color.id}&sid=${i.storage.id}"/>">Xóa</a></td>
                            </tr>
                        </c:forEach> 




                </table>
            </c:if>
            <c:if test="${size == 'hd'}">
                <div class="col-12">
                    <div class="content">
                        <h1>Không có sản phẩm nào trong giỏ hàng</h1>
                    </div>
                </div> 
            </c:if>
            <c:if test="${size == 'ds'}">
                <div class="payment">
                    <div class="price"><span class="price-title">Tổng giá: </span><span class="price-total i-price">${c.totalMoney}</span></div>
                    <div class="confirm">
                        <a href="<c:url value="/payment"/>" id="submit"><input type="button" value="Thanh toán" ></a>
                    </div>
                </div>
            </c:if>


        </div>
        <!-- Footer -->
        <jsp:include page="footer.jsp"/>
        <jsp:include page="common/script.jsp"/>
        <script src="js/cart.js"></script>

    </body>

</html>
