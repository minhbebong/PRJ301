<%-- 
    Document   : login
    Created on : Jun 7, 2022, 9:38:09 PM
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
        <form action="Login" method="POST">
            <input type="text" name="user">
            <br><input type="text" name="pass">
            <input type="checkbox" name="remember" value="true">
            <h4>Remember me</h4>
            
            <br><input type="submit" name="Login">

        </form>

    </body>
</html>
