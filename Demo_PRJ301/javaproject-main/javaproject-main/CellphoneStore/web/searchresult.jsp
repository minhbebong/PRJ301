<%-- 
    Document   : searchresult
    Created on : Feb 28, 2022, 10:22:52 PM
    Author     : hongd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cellphone Shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="common/link.jsp"/>
        <link rel="stylesheet" href="styles/index.css">
    </head>
    <body class="d-flex flex-column min-vh-100">
        <!-- Navbar -->
        <jsp:include page="header.jsp" />

        <!-- Info -->
        <div class="container">

            <div class="default-list col-md-12 col-12 col-sm-12">
                <div class="row">
                    <div class="col-md-12 col-sm-12 block-header">
                        <h1>${title}</h1>
                    </div>
                    <c:choose>
                        <c:when test="${plist != null}">
                            <c:forEach items="${plist}" var="p">
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <div class="item-wrapper">
                                        <div class="item-img">
                                            <a href="<c:url value="/product?pid=${p.pid}"></c:url>"><img src="${p.image}" class="img-responsive img-i"
                                                                                                         alt="${p.name}"></a>

                                        </div>
                                        <div class="item-price">
                                            <h3>${p.name}</h3>
                                            <p class="i-price" >${p.price}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="col-12" style="height: 500px;">
                                <p>Không tìm thấy thiết bị nào</p>
                            </div>
                        </c:otherwise>
                    </c:choose>


                </div>
                    <div class="paging">
                        <ul >
                            <c:forEach begin="1" end="${lastP}" var="i">
                                <li><a href="<c:url value="/productscate?indexP=${i}&category=0"/>">${i}</a></li>
                            </c:forEach>
                            <!--<li><a href="">Prev</a></li>-->
                            <!--<li><a href="">Next</a></li>-->
                        </ul>
                    </div>
                

            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="footer.jsp"/>
        <jsp:include page="common/script.jsp"/>
        <script src="js/index.js"></script>
    </body>
</html>
