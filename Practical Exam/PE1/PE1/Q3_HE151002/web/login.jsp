<%-- 
    Document   : list
    Created on : Jul 11, 2022, 12:17:53 PM
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
        <form method="post">
            <div>Username: <input type="text" name="username"></div>
            <div>Password: <input type="text" name="password"></div>
            <div><button>Login</button></div>
        </form>
        <h1>${message}</h1>
    </body>
</html>

