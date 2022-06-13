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
                    <h6>Tất cả đơn hàng của bạn</h6>

                </div>
                <table class="table table-dark">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Ngày đặt</th>
                            <th scope="col">Tổng giá</th>
                            <th scope="col">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}"  var="l">
                            <tr>
                                <td scope="row">${l.id}</td>
                                <fmt:parseDate value="${l.orderdate}" pattern="yyyy-MM-dd" var="date"/>
                                <td><fmt:formatDate value="${date}" pattern="dd/MM/yyyy" /></td>
                                <td id="item-price">${l.total}</td>
                                <td><a href="<c:url value="/purchasedetails?oid=${l.id}"/>">Chi tiết</a></td>
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

