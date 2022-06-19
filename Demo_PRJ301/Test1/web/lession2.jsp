<%-- 
    Document   : Test2
    Created on : Mar 3, 2020, 8:32:20 PM
    Author     : tienpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test 02</title>
        <style>
            *{
                font-size:25px;
            }

        </style>
    </head>
    <body>
        <form action="lession2">
            <table style="border:2px solid green;margin:auto">
                <tr>
                    <td colspan='3' align='center' width="500px">
                        <b>
                            <label style="font-size:30px;font-weight:bold;color:orange">
                                PRIME NUMBER
                            </label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td><i><b> <%
                                  if(request.getAttribute("error")!=null){
                                %>
                                ${error}
                                <%
                                }else{
                                %>
                                Enter an integer n:
                                <%
                                    }
                                %></b></i></td>

                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td align='center'>
                        <input type='text' name="number" id='a' style="width:150px" value="${numN}">
                        <input type="submit" value="RESET" name="reset" style="font-size:20px;font-weight:bold;color:red"></input>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td align='center'><b>Show n prime numbers >= n</b></td>
                </tr>
                <tr>
                    <td align='center'>
                        <input type="submit" name="show" value="Show Result" style="font-size:20px;font-weight:bold;color:red">
                    </td>
                </tr>
                <tr>
                    <td align='center'>
                        <input type="submit" name="cal" value="  --V--  " style="font-size:20px;font-weight:bold;color:red">
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td align='center'>
                        <input disabled type='text' name="result" style="width:350px;" value="${result}">
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
            </table>
        </form>
    </body>
</html>
