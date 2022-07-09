<%-- 
    Document   : UserDetail
    Created on : Jun 24, 2022, 5:23:42 PM
    Author     : Lenovo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Detail" method="post">
            <c:forEach items="${list}" var="item">
            Account: ${item.getAccount()}
            Name: ${item.getName()}
            Gender: ${item.getGender()}
            Address: ${item.getAddress()}
            Date of birth: ${item.getDob()}
        </c:forEach>
        </form>
        <h1>${account}</h1>
        
    </body>
</html>
