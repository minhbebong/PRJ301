<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : insert
    Created on : Jul 15, 2022, 2:43:31 AM
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
            UserId:<input name="uid" type="text"> <br>
            Password:<input name="pass" type="password"> <br>
            Groups:<br><!-- comment -->
            <c:forEach var="g" items="${glist}">
                <input type="checkbox" name="gid" value="${g.id}"> ${g.name} <br>
            </c:forEach>
                <input value="submit" type="submit">
        </form>
    </body>
</html>
