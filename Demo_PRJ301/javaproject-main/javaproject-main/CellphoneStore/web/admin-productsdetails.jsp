<%-- 
    Document   : admin-productsdetails
    Created on : Feb 28, 2022, 6:08:32 PM
    Author     : hongd
--%>
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
        <div class="container">
            <div class="row">
                <div class="col-md-12 content">
                    <h1>Chi tiết/Chỉnh sửa sản phẩm</h1>
                    <form action="admin-update" method="post" class="form-new">
                        <label for="cid">Danh mục sản phẩm</label><br>
                        <select name="cid" id="cid">
                            <c:forEach items="${clist}" var="c">
                                <option value="${c.cid}">${c.cname}</option>
                            </c:forEach>
                        </select><br>
                        <label for="pid">Mã sản phẩm</label><br>
                        <input type="text" id="pid" name="pid"><br>
                        <label for="pname">Tên sản phẩm</label><br>
                        <input type="text" id="pname" name="pname"><br>
                        <label for="image">Ảnh sản phẩm</label><br>
                        <input type="text" id="image" name="image"><br>
                        <label for="price">Giá sảm phẩm</label><br>
                        <input type="number" id="price" name="price"><br>
                        <label for="des">Mô tả</label><br>
                        <textarea name="des" id="des" cols="100" rows="10"></textarea><br>
                        <label for="amount">Số lượng</label><br>
                        <input type="number" name="amount" id="amount"><br>
                        
                        <h2>Thêm chi tiết sản phẩm</h2>
                        <label for="screen">Màn hình</label><br>
                        <input type="text" name="screen" id="screen"><br>
                        <label for="os">Hệ điều hành</label><br>
                        <input type="text" name="os" id="os"><br>
                        <label for="rearcam">Camera sau</label><br>
                        <input type="text" name="rearcam" id="rearcam"><br>
                        <label for="frontcam">Camera trước</label><br>
                        <input type="text" name="frontcam" id="frontcam"><br>
                        <label for="soc">CPU</label><br>
                        <input type="text" name="soc" id="soc"><br>
                        <label for="ram">Ram</label><br>
                        <input type="text" name="ram" id="ram"><br>
                        <label for="sim">Sim</label><br>
                        <input type="text" name="sim" id="sim"><br>
                        <label for="battery">Pin</label><br>
                        <input type="text" name="battery" id="battery"><br>

                        <h2>Thêm màu sản phẩm</h2>
                        <label for="color">Màu sắc (Các màu ngăn cách nhau bằng dấu ,)</label><br>
                        <input type="text" name="color" id="color"><br>

                        <h3>Thêm bộ nhớ trong</h3>
                        <label for="storage">Bộ nhớ (Các tùy chọn bộ nhớ ngăn cách nhau bằng dấu ,)</label><br>
                        <input type="text" name="storage" id="storage"><br>
                        <button>Lưu</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


    


   <jsp:include page="common/script.jsp"/>
    <!-- My script -->
    <script src="js/admin.js"></script>
</body>

</html>
