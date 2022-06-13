<%-- 
    Document   : profile
    Created on : Mar 8, 2022, 2:25:08 AM
    Author     : hongd
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cellphone Shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="common/link.jsp"/>
        <link rel="stylesheet" href="styles/profile.css">
    </head>
    <body class="d-flex flex-column min-vh-100">
        <!-- Navbar -->
        <jsp:include page="header.jsp" />

        <!-- Info -->
        <div class="container">
            <div class="row content">
                <div class="col-md-12 profile-header">
                    <h1>Thông tin cá nhân</h1>
                    <p>${message}</p>
                </div>
                <div class="col-md-12 profile-body">
                    <form action="profile" method="post">
                        <table class="table table-borderless">
                            <tbody>
                                <tr>
                                    <td class="">Họ</td>
                                    <td><input type="text" name="firstname" value="${sessionScope.user.firstname}" id="firstname"></td>
                                </tr>
                                <tr>
                                    <td>Tên</td>
                                    <td><input type="text" name="lastname" value="${sessionScope.user.lastname}" id="lastname"></td>
                                </tr>
                                <tr>
                                    <td>Ngày sinh</td>
                                    <fmt:parseDate value="${sessionScope.user.birthday}" pattern="yyyy-MM-dd" var="date"/>
                                    <fmt:formatDate value="${date}" var="fdate" pattern="dd/MM/yyyy" />
                                    <td><input type="text" name="birthday" value="<fmt:formatDate value="${date}" pattern="dd/MM/yyyy" />" id="birthday"></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input type="text" name="email" value="${sessionScope.user.email}" id="email"></td>
                                </tr>
                                <tr>
                                    <td>Số điện thoại</td>
                                    <td><input type="text" name="phone" value="${sessionScope.user.phone}" id="phone"></td>
                                </tr>
                                <tr>
                                    <td>Địa chỉ</td>
                                    <td><input type="text" name="address" value="${sessionScope.user.address}" id="address"></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="submit">
                            <input type="submit" value="Lưu">
                        </div>
                    </form>


                </div>

            </div>
        </div>
        <!-- Footer -->
        <jsp:include page="footer.jsp"/>
        <jsp:include page="common/script.jsp"/>
        <script src="js/cart.js"></script>

    </body>
</html>
