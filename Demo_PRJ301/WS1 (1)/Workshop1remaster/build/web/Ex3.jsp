<%-- 
    Document   : Ex3
    Created on : May 30, 2022, 5:05:40 PM
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
        <form action="3rd" method='POST'>
            <h2 style="color:blue;">THỰC HIỆN PHÉP TOÁN</h2>
            <table>
                <tr>
                    <td>Nhập n:</td>
                    <td>
                        <input type="text" name="n">
                    </td>
                    <td>(1 < n < 100)</td>
                </tr>
                <tr>
                    <td>Chọn phép toán:</td>
                    <td>
                        <select name="math">
                            <option>Tổng n số liên tiếp</option>
                            <option>Tính n!</option>
                            <option>In dãy lẻ</option>
                            <option>In dãy số chẵn</option>
                            <option>Kiểm tra số nguyên tố</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><br><br><br><br><br>Kết quả</td>
                    <td>
                        <br><br><br><br><br><input type="text" name ="result" value='<%=result%>>   
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" name="submit" value="submit">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
