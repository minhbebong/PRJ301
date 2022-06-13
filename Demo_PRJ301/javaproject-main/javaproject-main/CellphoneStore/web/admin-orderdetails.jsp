<%-- 
    Document   : admin-manage
    Created on : Feb 28, 2022, 12:29:01 AM
    Author     : hongd
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div class="col-12 content">
                        <h1>Tất cả đơn hàng mới</h1>

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-center">#ID</th>
                                    <th scope="col" class="text-center">Tên người đặt</th>
                                    <th scope="col" class="text-center">Tổng giá trị</th>
                                    <th scope="col" class="text-center">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${olist}" var="o">
                                    <tr>
                                        <th scope="row" class="text-center">${o.id}</th>
                                        <td class="text-center">${o.uname}</td>
                                        <fmt:parseDate value="${o.orderdate}" pattern="yyyy-MM-dd" var="date"/>
                                        <td class="text-center"><fmt:formatDate value="${date}" pattern="dd/MM/yyyy" /></td>
                                        <td class="text-center"><a href="<c:url value="/admin-orderdt?oid=${o.id}&action=view&uname=${o.uname}"/>">Xem chi tiết</a></td>
                                    </tr>
                                </c:forEach> 

                            </tbody>

                        </table>
                        <div class="paging-wrapper">
                            <ul class="paging">
                                <!--<li class="paging-items"><a href=""><i class="fa-solid fa-angle-left"></i>Quay lại</a></li>-->
                                <c:forEach begin="1" end="${lastP}" var="i">
                                    <li class="paging-items"><a href="<c:url value="/admin-order?indexP=${i}"/>">${i}</a></li>
                                    </c:forEach>
                                <!--<li class="paging-items"><a href="">Tiếp<i class="fa-solid fa-angle-right"></i></a></li>-->
                            </ul>
                        </div>

                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="common/script.jsp"/>
        <!-- My script -->
        <script src="js/admin.js"></script>
    </body>

</html>
