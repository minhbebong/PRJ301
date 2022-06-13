<%-- 
    Document   : admin-home
    Created on : Feb 12, 2022, 9:29:24 AM
    Author     : hongd
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- My styles -->
        <link rel="stylesheet" href="styles/admin.css">
    </head>

    <body>
        <jsp:include page="head-sidenav.jsp" />

        <div id="main">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-6 content chart-wrapper">
                        <div id="piechart_div" class="chart"></div>
                    </div>
                    <div class="col-md-6 content chart-wrapper">
                        <div id="piechart_div2" class="chart"></div>
                    </div>
                </div>

                <h1>Đơn đặt hàng mới</h1>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#ID</th>
                            <th scope="col">Username</th>
                            <th scope="col">Ngày đặt hàng</th>
                            <th scope="col">Tổng giá trị</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${newOrder}" var="new">
                            <tr>
                                <th scope="row">${new.id}</th>
                                <td>${new.uname}</td>
                                <fmt:parseDate value="${new.orderdate}" pattern="yyyy-MM-dd" var="date"/>
                                <td><fmt:formatDate value="${date}" pattern="dd/MM/yyyy" /></td>
                                <td>${new.total}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>





        <jsp:include page="common/script.jsp"/>
        <!-- My script -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script src="js/admin.js"></script>
    </body>

</html>
