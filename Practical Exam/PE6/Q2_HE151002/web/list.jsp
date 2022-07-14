<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : list
    Created on : Jul 15, 2022, 1:57:41 AM
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
        <form method="post" action="list">
            Search: <input name="ename" type="text">
            <input value="submit" type="submit">
        </form>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>DOB</th>
                    <th>Department</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="e" items="${elist}">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.name}</td>
                        <td>${e.gender?"<img src='image/Male-icon.png' >":
                              "<img src='image/Female-icon.png' >"}</td>
                        <td>${e.dob}</td>
                        <td>${e.department.name}</td>
                        <td><a href="delete?emid=${e.id}">Delete</a></td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>

    </body>
</html>
