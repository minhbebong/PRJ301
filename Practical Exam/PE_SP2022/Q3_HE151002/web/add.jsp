<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : add
    Created on : Jul 16, 2022, 1:11:59 AM
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
        <form method="post" action="add">
            Id: <input name="id" type="text"><br>
            Name: <input name="name" type="text"><br>
            Dob: <input name="dob" type="date"><br>
            Gender: <input name="gender" value="true" type="radio">Male 
            <input name="gender" value="false" type="radio">Female<br>
            Certificate:<br>
            <c:forEach var="lc" items="${lc}">
                <input name="certi" type="checkbox"> ${lc.getName()} at <input name="datec" type="date"><br>
            </c:forEach>
            <input value="Save" type="submit">
        </form>
    </body>
</html>
