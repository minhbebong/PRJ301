<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : employees
    Created on : Jul 11, 2022, 8:18:50 PM
    Author     : Lenovo
--%>

<%@page import="java.util.List"%>
<%@page import="model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="employees" method="post">
            Name: <input type="text" name="name" > <br>
            Sex: <input type="radio" name="sex" value="Male" checked /> Male
            <input type="radio" name="sex" value="Female" /> Female
            <br>
            <input type="submit" value="Submit" />
        </form>
        <c:if test="${sessionScope['elist'] == null}">
            There are no employees on the list
        </c:if>
        <c:if test="${sessionScope['elist'] != null}">
            List of employees: <br>
            <c:forEach var="e" items="${sessionScope['elist']}">
                ${e}<br>
            </c:forEach>
        </c:if>    
    </body>
</html>