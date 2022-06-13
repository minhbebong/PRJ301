<%-- 
    Document   : admin-manage
    Created on : Feb 28, 2022, 12:29:01 AM
    Author     : hongd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <div class="check-modal" id="check-delete-modal">
            <div class="modal-delete-content">
                <div class="modal-delete-header">
                    <p>Xóa</p>
                </div>
                <div class="modal-delete-icon">
                    <i class="fa-solid fa-question"></i>
                    <h2 id="modal-title"></h2>
                </div>

                <div class="modal-delete-btn">
                    <button class="modal-delete-btn-1" id="modal-delete-btn-1"><i class="fa-solid fa-check"></i>&nbsp;Đồng ý</button>
                    <button class="modal-delete-btn-2" id="modal-delete-btn-2" onclick="closeModal()"><i class="fa-solid fa-xmark"></i>&nbsp;Hủy</button>
                </div>
            </div>
        </div>

        <div id="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 content">
                        <h1>Tất cả sản phẩm</h1>
                        <div class="second-nav">
                            <a href="<c:url value="/admin-addnew"/>"><p><i class="fa-solid fa-plus"></i>&nbsp;Thêm sản phẩm mới</p></a>

                        </div>

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">Ảnh sản phẩm</th>
                                    <th scope="col">Tên sản phẩm</th>
                                    <th scope="col">Mã sản phẩm</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${plist}" var="p">
                                    <tr>
                                        <td><img src="${p.image}" class="img-responsive item-img" alt="${p.name}"></td>
                                        <td>${p.name}</td>
                                        <td>${p.pid}</td>
                                        <td>${p.price}</td>
                                        <td>${p.amount}</td>
                                        <td><a href="<c:url value="/admin-insideproduct?pid=${p.pid}"/>">Xem chi tiết</a>&nbsp;|&nbsp;<a href="#" onclick="openModal('${p.pid}')">Xóa</a></td>
                                    </tr>
                                </c:forEach>

                            </tbody>

                        </table>
                        <div class="paging-wrapper">
                            <ul class="paging">
                                <!--<li class="paging-items"><a href=""><i class="fa-solid fa-angle-left"></i>Quay lại</a></li>-->
                                <c:forEach begin="1" end="${lastP}" var="i">
                                    <li class="paging-items"><a href="<c:url value="/admin-manage?indexP=${i}"/>">${i}</a></li>
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
