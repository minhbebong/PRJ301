<%-- 
    Document   : login
    Created on : Jul 16, 2022, 1:11:50 AM
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
        <form method="post" action="login">
            Username: <input type="text" name="user"> <br>
            Password: <input type="text" name="pass"><br>
            <input type="submit" value="login">
        </form>
        <p>${mess}</p>
    </body>
</html>
