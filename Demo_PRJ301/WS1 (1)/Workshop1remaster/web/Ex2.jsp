<%-- 
    Document   : Ex2
    Created on : May 30, 2022, 4:58:53 PM
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
        <form action="2nd" method='POST'>
            <h2 style="color:blue;">TÌM MAX VÀ TÌM MIN</h2>
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
                    <td>Nhập c:</td>
                    <td>
                        <input type="text" name="c">    
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="radio" name="number" value="max" > Tìm số lớn nhất
                        <input type="radio" name="number" value="min"> Tìm số nhỏ nhất
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <br><input type='submit' name ='find' value='Tìm'>
                        <input type='submit' name ='delete' value='Xoá' onclick="reset()">
                    </td>
                </tr>
            </table>
            <h3 style="color:blue;">KẾT QUẢ<input type='text' name ='result' value='<%=result%>'redonly></h3>

        </form>
        <script>
            function reset() {
                document.getElementsByClassName('in')[0].value = "";
                document.getElementsByClassName('in')[1].value = "";
                document.getElementsByClassName('in')[2].value = "";
                document.getElementsByClassName('in')[3].value = "";
            }
        </script>
    </body>
</html>
