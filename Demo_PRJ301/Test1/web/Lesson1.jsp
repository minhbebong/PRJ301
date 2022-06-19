<%-- 
    Document   : Test1
    Created on : Mar 3, 2020, 7:55:39 PM
    Author     : tienpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test 01</title>
        <style>
            *{
                font-size:25px;
            }
        </style>
    </head>
    <body>

        <form action = "calc">


            <table style="border:2px solid orange;margin:auto">
                <tr>
                    <td colspan='3' align='center'>
                        <b><label style="font-size:30px;font-weight:bold;color:blue">
                                PRIME DIVISOR
                            </label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td><i><b>
                                <%
                                  if(request.getAttribute("error")!=null){
                                %>
                                ${error}
                                <%
                                }else{
                                %>
                                Enter an integer n:
                                <%
                                    }
                                %>
                            </b></i></td>
                    <td rowspan='8'>
                        <textarea rows='7' cols='10'>
                            
                            ${result}
                            
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td align='center'>
                        <input type="submit" name="show" value="Show Result" style="font-size:20px;font-weight:bold;color:red">
                    </td>
                </tr>
                <tr>
                    <td><input type='text' id='a' style="width:150px" name = "num_n" value ="${numN}"> 
                        <input type='submit' value='  >>  ' name ="Add"></td>
                    <td></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td align='center'><input type="submit" value="RESET" name ="reset" style="font-size:20px;font-weight:bold;color:red"></td>
                    <td></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
            </table>

        </form>
    </body>
</html>
