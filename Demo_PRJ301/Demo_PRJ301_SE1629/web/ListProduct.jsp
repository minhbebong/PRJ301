<%-- 
    Document   : ListProduct
    Created on : Jun 22, 2022, 5:02:46 PM
    Author     : Lenovo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"  %>
<%@page import="model.Product"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--        <table border="1">
                    <tr>
                        <td>ProductID</td>
                        <td>ProductName</td>
                        <td>Unit</td>
                        <td>Price</td>
                        <td>ProductImage</td>
                    </tr>
                    
                </table> -->
        <c:forEach begin="${1}" end="${numpage}" var="i">
            <a href="product?xpage=${i}">${i}</a>
        </c:forEach>
        <br>Using JSTL-EL:
        <table border="1">
            <tr>
                <td>ProductID</td>
                <td>ProductName</td>
                <td>Unit</td>
                <td>Price</td>
                <td>ProductImage</td>
            </tr>

            <c:forEach items="${list}" var="item">
                <tr>
                    <td>${item.getId()}</td>
                    <td>${item.getName()}</td>
                    <td>${item.getUnit()}</td>
                    <td>${item.getPrice()}</td>
                    <td><img style = 'width:70px;height:50px'src = '${item.getImage()}'></td>
                    <td><a href="UpdateListProduct.jsp?id=${item.getId()}&${item.getName()}&${item.getUnit()}&
                           ${item.getPrice()}&${item.getImage()}&mod=update">Update</a></td>
                    <td><a href="Edit?id=${item.getId()}&mod=delete">Delete</a></td>
                </tr>
            </c:forEach>



        </table>
    </body>
</html>
