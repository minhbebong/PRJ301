<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : insert
    Created on : Jul 12, 2022, 2:34:27 AM
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
        <form method="post" action="insert">
            Id <input type="text" name="id"> <br>
            Name <input type="text" name="name"> <br>
            Gender <input type="radio" name="gender" value="1">Male
            <input type="radio" name="gender" value="0">Female<br>
            Dob <input type="text" name="dob"><br>
            Skill: <br>
            <c:forEach var="s" items="${slist}">
                <input type="checkbox" value="${s.getId()}" name="skill">${s.getName()}<br>
            </c:forEach>
                <input type="submit" value="insert">
        </form>
    </body>
</html>
