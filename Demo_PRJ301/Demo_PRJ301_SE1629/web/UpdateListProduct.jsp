<%-- 
    Document   : UpdateListProduct
    Created on : Jun 27, 2022, 9:22:55 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach items="${list}" var="item">
        <form action="Edit">
            <h3>Id:</h3>
            <input type="text" name="id" value="${ProductX.getId()}">
            <br>
            <h3>Name:</h3>
            <input type="text" name="name" value="pro.getName()">
            <br>
            <h3>Unit:</h3>
            <input type="text" name="unit" value="pro.getUnit()">
            <br>
            <h3>Price:</h3>
            <input type="text" name="price" value="pro.getPrice()">
            <br>
            <h3>Image:</h3>
            <input type="text" name="image" value="pro.getImage()">
            <br>
            <input type="submit" value="update">
             <c:forEach items="${list}" var="item">
                    ${item.getId()}
                    ${item.getName()}
                    ${item.getUnit()}
                    ${item.getPrice()}
                    ${item.getImage()}              
            </c:forEach>
        </form>
    </body>
</html>
