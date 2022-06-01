<%-- 
    Document   : Login
    Created on : Jun 1, 2022, 4:58:16 PM
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
        <form action="LoginController" method="POST" style="margin:auto">
            Account:<input type="text" name="account">
            <br>Password:<input type="text" name="pass">
            <br><input type='submit' name ='LOGIN' value='login'>

        </form>
    </body>
</html>
