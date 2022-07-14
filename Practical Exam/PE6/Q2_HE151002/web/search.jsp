<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : search
    Created on : Jul 15, 2022, 3:51:42 AM
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
        <form method="get" action="search">
            Author:<select name="auid">
                <c:forEach var="au" items="${authorlist}">
                    <option value="${au.id}" ${param['auid']==au.id?selected:""}>${au.name}</option>
                </c:forEach>
            </select>
            <input type="submit" value="search">
        </form>
        <table border="1">
            <thead>
                <tr>
                    <th>Paper ID</th>
                    <th>Title</th>
                    <th>Pulish Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="a" items="${articlelist}">
                    <tr>
                        <td>${a.id}</td>
                        <td>${a.title}</td>
                        <td>${a.publicDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
