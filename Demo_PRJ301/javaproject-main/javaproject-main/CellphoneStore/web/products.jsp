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
        <link rel="stylesheet" href="styles/products.css">
    </head>
    <body class="d-flex flex-column min-vh-100">
        <!-- Navbar -->
        <jsp:include page="header.jsp" />
        <!-- Info -->
        <div class="container">

            <div class="row products-items">
                <div class=" col-lg-12 col-md-12 col-sm-12">
                    <div class="title">
                        <h1>${pd.name}</h1>
                    </div>
                </div>

                <div class="col-lg-7 col-md-7 left-items-content">
                    <div class="owl-carousel col-md-12 col-sm-12" id="slider">
                        <div class="col-lg-10 col-md-10 col-sm-10 item-carousel">
                            <img src="${pd.image}" class="img-responsive" alt="">
                        </div>
                    </div>

                    <div class="info-device">
                        <h2>Thông tin sản phẩm</h2>
                        <p>${pd.description}
                        </p>
                    </div>
                </div>

                <div class="col-lg-5 col-md-5 right-items-content">

                    <div class="option">
                        <p>Lựa chọn màu sắc</p>
                        <form method="get" action="atc">
                            <div class="color-option">
                                <c:forEach items="${color}" var="clr">
                                    <input type="radio" id="color-choice-${clr.id}" name="color-choice" value="${clr.id}">
                                    <label for="color-choice-${clr.id}">${clr.color}</label>
                                </c:forEach>
                            </div>
                            <br>
                            <p>Lựa chọn bộ nhớ</p>
                            <div class="storage-option">
                                <c:forEach items="${storage}"  var="str">
                                    <input type="radio" id="storage-choice-${str.id}" name="storage-choice" value="${str.id}">
                                    <label for="storage-choice-${str.id}">${str.storage}</label>
                                </c:forEach>
                            </div>
                            <br>
                            <div class="price">
                                <p id="price-title">Giá niêm yết:</p>
                                <p id="price-content">&nbsp;&nbsp;${price}đ</p>
                            </div>
                            <div class="btn">
                                <a onclick="buy(${pd.id})"><input id="btn-1" type="button"  value="Thêm vào giỏ"/></a>
                            </div>
                        </form>

                    </div>
                    <h2>Cấu hình thiết bị</h2>
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <td>Màn hình:</td>
                                <td>${pds.screen}</td>
                            </tr>
                            <tr>
                                <td>Hệ điều hành:</td>
                                <td>${pds.os}</td>
                            </tr>
                            <tr>
                                <td>Camera sau:</td>
                                <td>${pds.rearcam}</td>
                            </tr>
                            <tr>
                                <td>Camera trước:</td>
                                <td>${pds.frontcam}</td>
                            </tr>
                            <tr>
                                <td>Chip:</td>
                                <td>${pds.soc}</td>
                            </tr>
                            <tr>
                                <td>RAM:</td>
                                <td>${pds.ram}</td>
                            </tr>
                            <tr>
                                <td>SIM:</td>
                                <td>${pds.sim}</td>
                            </tr>
                            <tr>
                                <td>Pin, Sạc:</td>
                                <td>${pds.battery}</td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
    <!-- Footer -->
    <jsp:include page="footer.jsp"/>
    <jsp:include page="common/script.jsp"/>
    <script src="js/products.js"></script>

</body>

</html>
