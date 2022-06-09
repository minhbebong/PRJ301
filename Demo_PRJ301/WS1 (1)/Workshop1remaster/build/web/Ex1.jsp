<%-- 
    Document   : Ex1
    Created on : May 30, 2022, 4:39:34 PM
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
        <form action="1st" method='POST'>
            <h2 style="color:blue;">THỰC HIỆN PHÉP TOÁN</h2>
            <table>
                <tr>
                    <td>Nhập a:</td>
                    <td>
                        <input type="text" name="a">
                    </td>
                </tr>
                <tr>
                    <td>Nhập b:</td>
                    <td>
                        <input type="text" name="b">    
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <br><input type='submit' name ='Cong' value='a+b'>
                        <input type='submit' name ='Tru' value='a-b'>
                        <input type='submit' name ='Nhan' value='a*b'>
                        <input type='submit' name ='Chia' value='a/b'>
                    </td>
                </tr>
            </table>
            <h3 style="color:blue;">KẾT QUẢ<input type='text' name ='result' value='<%=result%>'redonly></h3>
        </form>
    </body>
</html>
