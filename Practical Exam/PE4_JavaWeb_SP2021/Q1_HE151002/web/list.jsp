<%-- 
    Document   : list
    Created on : Jul 11, 2022, 9:21:05 PM
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
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Dob</th>
                    <th>Gender</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="e" items="${jsplist}">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.name}</td>
                        <td>${e.dob}</td>
                        <td><input type="checkbox" readonly="" name="gender" 
                                   ${e.gender?"checked":""}></td>
                    </tr>
                </c:forEach>    
            </tbody>
        </table>
    </body>
</html>
