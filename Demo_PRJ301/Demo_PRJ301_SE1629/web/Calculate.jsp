<%-- 
    Document   : Calculate
    Created on : May 27, 2022, 5:12:31 PM
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
        <%
        String result = "";
        if(request.getAttribute("result") != null)
            result = (String)request.getAttribute("result");
        %>
        <form action="Demo4" method='POST'>
            Enter a:<input type='text' name ='a'>
            <br>Enter b:<input type='text' name ='b'>
            <br><input type='submit' name ='Cong' value='OK'>
            <input type='submit' name ='UCLN' value='UCLN'>
            <br>Result:<input type='text' name ='result' value='<%=result%>'redonly>
        </form>
    </body>
</html>
