<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : search
    Created on : Jul 10, 2022, 11:40:39 PM
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
            Account: <select name="dname">
                <c:forEach var="a" items="${alist}">
                    <option value="${a.getName()}">${a.getDisplayname()}</option>
                </c:forEach>
                <input type="submit" value="search">
            </select>
        </form>
        <c:if test="${elist != null}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Employee Id</th>
                        <th>Name</th>
                        <th>DOB</th>
                        <th>Gender</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="e" items="${elist}">
                        <tr>
                            <td>${e.getId()}</td>
                            <td>${e.getName()}</td>
                            <td>${e.getDate()}</td>
                            <td>${e.isGender()?"Male":"Female"}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </c:if>
    </body>
</html>
