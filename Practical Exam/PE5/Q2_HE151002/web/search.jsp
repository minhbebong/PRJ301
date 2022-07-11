<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : search
    Created on : Jul 12, 2022, 1:44:30 AM
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
        <form method="post" action="search">
            Name : <input type="text" name="name"> <input type="submit" value="search">
        </form>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Dob</th>
                    <th>Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="s" items="${list}">
                    <tr>
                        <td>${s.getId()}</td>
                        <td>${s.getName()}</td>
                        <td>${s.getDob()}</td>
                        <td>${s.isGender()}</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>

    </body>
</html>
