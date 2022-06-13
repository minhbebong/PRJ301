<%-- 
    Document   : admin-addnew
    Created on : Feb 28, 2022, 1:13:57 AM
    Author     : hongd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                <div class="row ">
                    <div class="col-md-12 content">
                        <h1>Chi tiết sản phẩm</h1>
                        <p>
                            <a class="btn btn-primary" data-toggle="collapse" href="#info-table" role="button"
                               aria-expanded="false" aria-controls="info-table">
                                Thông tin sản phẩm
                            </a>
                            <a class="btn btn-primary" data-toggle="collapse" href="#system-table" role="button"
                               aria-expanded="false" aria-controls="system-table">
                                Cấu hình sản phẩm
                            </a>
                            <a class="btn btn-primary" data-toggle="collapse" href="#color-table" role="button"
                               aria-expanded="false" aria-controls="color-table">
                                Màu sản phẩm
                            </a>
                            <a class="btn btn-primary" data-toggle="collapse" href="#storage-table" role="button"
                               aria-expanded="false" aria-controls="storage-table">
                                Bộ nhớ sản phẩm
                            </a>
                        </p>
                        <div class="collapse" id="info-table">
                            <h1>Thông tin sản phẩm</h1>
                            <form action="admin-insideproduct" method="post">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <td>#ID</td>
                                            <td><input type="text" value="${product.id}" readonly name="id"></td>
                                        </tr>
                                        <tr>
                                            <td>Mã sản phẩm</td>
                                            <td><input type="text" value="${product.pid}" name="pid" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>Danh mục sản phẩm</td>
                                            <td>
                                                <select name="cate" id="">
                                                    <c:forEach items="${clist}" var="l">
                                                        <option value="${l.cid}" <c:if test="${l.cid == product.cid}">selected</c:if>>${l.cname}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Tên sản phẩm</td>
                                            <td><input type="text" value="${product.name}" name="pname"></td>
                                        </tr>
                                        <tr>
                                            <td>Ảnh</td>
                                            <td><input type="text" name="img"
                                                       value="${product.image}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Giá tiền</td>
                                            <td><input type="text" value="${product.price}" name="price"></td>
                                        </tr>
                                        <tr>
                                            <td>Số lượng</td>
                                            <td><input type="text" value="${product.amount}" name="qty"></td>
                                        </tr>
                                        <tr>
                                            <td>Mô tả sản phẩm</td>
                                            <td><input type="text" value="${product.description}" name="des"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input type="submit" value="Lưu thay đổi">
                            </form>
                        </div>
                        <div class="collapse" id="system-table">
                            <h1>Cấu hình sản phẩm</h1>
                            <form action="admin-updateproduct" method="POST">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <td>Mã sản phẩm:</td>
                                            <td><input type="text" value="${details.pid}" name="pid"></td>
                                        </tr>
                                        <tr>
                                            <td>Màn hình:</td>
                                            <td><input type="text" value='${details.screen}' name="screen"></td>
                                        </tr>
                                        <tr>
                                            <td>Hệ điều hành:</td>
                                            <td><input type="text" value="${details.os}" name="os"></td>
                                        </tr>
                                        <tr>
                                            <td>Camera sau:</td>
                                            <td><input type="text" value="${details.rearcam}" name="rear"></td>
                                        </tr>
                                        <tr>
                                            <td>Camera trước:</td>
                                            <td><input type="text" value="${details.frontcam}" name="front"></td>
                                        </tr>
                                        <tr>
                                            <td>Chip:</td>
                                            <td><input type="text" value="${details.soc}" name="soc"></td>
                                        </tr>
                                        <tr>
                                            <td>RAM:</td>
                                            <td><input type="text" value="${details.ram}" name="ram"></td>
                                        </tr>
                                        <tr>
                                            <td>SIM:</td>
                                            <td><input type="text" value="${details.sim}" name="sim"></td>
                                        </tr>
                                        <tr>
                                            <td>Pin, Sạc:</td>
                                            <td><input type="text" value="${details.battery}" name="bat"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input type="submit" value="Lưu thay đổi">
                            </form>

                        </div>
                        <div class="collapse" id="color-table">
                            <h1>Màu sản phẩm</h1>
                            <a  data-toggle="collapse" href="#addnew-color" role="button" aria-expanded="false"
                                aria-controls="addnew-color"><i class="fa-solid fa-circle-plus"></i>Thêm mới</a>
                            <div class="collapse" id="addnew-color">
                                <p>Các màu ngăn cách nhau bằng dấu , </p>
                                <input type="text" name="new-color" id="new-color">
                                <input type="button" value="Thêm" onclick="addColor('${product.pid}')"> 
                            </div>

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col" class="text-center">#ID</th>
                                        <th scope="col" class="text-center">Màu</th>
                                        <th scope="col" class="text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${colist}" var="c">
                                        <tr>
                                            <td class="text-center">${c.id}</td>
                                            <td class="text-center"><input type="text" value="${c.color}" id="'cl${c.id}'"></td>
                                            <td class="text-center"><a href="#" onclick="changeColor(${c.id},'${c.pid}')">Sửa</a> | <a href="<c:url value="/admin-updateproduct?action=delete&type=color&cid=${c.id}&pid=${c.pid}"/>">Xóa</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="collapse" id="storage-table">
                            <h1>Bộ nhớ sản phẩm</h1>
                            <a  data-toggle="collapse" href="#addnew-storage" role="button" aria-expanded="false"
                                aria-controls="addnew-storage"><i class="fa-solid fa-circle-plus"></i>Thêm mới</a>
                            <div class="collapse" id="addnew-storage">
                                <p>Các tùy chọn bộ nhớ ngăn cách nhau bằng dấu , </p>
                                <input type="text" name="new-storage" id="new-storage">   
                                <input type="button" value="Thêm" onclick="addStorage('${product.pid}')"> 
                            </div>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col" class="text-center">#ID</th>
                                        <th scope="col" class="text-center">Bộ nhớ</th>
                                        <th scope="col" class="text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${slist}" var="s">
                                        <tr>
                                            <td class="text-center">${s.id}</td>
                                            <td class="text-center"><input type="text" value="${s.storage}" id="'st${s.id}'"></td>
                                            <td class="text-center"><a href="#" onclick="changeStorage(${s.id},'${s.pid}')">Sửa</a> | <a href="<c:url value="/admin-updateproduct?action=delete&type=storage&sid=${s.id}&pid=${s.pid}"/>">Xóa</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
