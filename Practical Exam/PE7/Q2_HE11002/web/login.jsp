<%-- 
    Document   : login
    Created on : Jul 15, 2022, 11:43:05 PM
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
        ${fail}<br>
        <form action="login" method="post">
            UserName: <input type="text" required name=user><br>
            Password: <input type="text" required nam="pass"><br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
