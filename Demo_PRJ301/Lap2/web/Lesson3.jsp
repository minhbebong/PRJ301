<%-- 
    Document   : Test3
    Created on : Mar 3, 2020, 8:36:02 PM
    Author     : tienpro
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test 03</title>
        <style>
            *{
                font-size:25px;

            }
            <%
                String result = (String) request.getAttribute("result");
                String sum;
                try {
                    sum = String.valueOf((int) request.getAttribute("sum"));
                } catch (Exception e) {
                    sum = "";
                }

                String n = (String) request.getAttribute("n");
                if (result == null) {
                    result = "";
                }
                if (n == null) {
                    n = "";
                }
                if (sum == null) {
                    sum = "";
                }


            %>
        </style>
    </head>
    <body>
        <form action="Workshop2_lesson3" method="POST">
            <table style="border:2px solid orange;margin:auto">
                <tr>
                    <td colspan='3' align='center'>
                        <b>
                            <label style="font-size:30px;font-weight:bold;color:blue">
                                INPUT AND CALCULATE
                            </label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td><i><b>Enter an integer n:</b></i></td>
                    <td rowspan='8'>
                        <textarea rows='7' cols='10'>
                            <%=result%>
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td><input type='text' name='n'value="<%=n%>" style="width:150px">
                        <input type='submit' name="btn" value='  >>  '></input>
                        <input type='submit' name="btn" value='Check'></input>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td align='center'>
                        <input type="submit" name="btn" value="RESET" style="font-size:20px;font-weight:bold;color:red">
                    </td>
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
                <tr>
                    <td><b>Sum of numbers in list:</b></td>

                    <td><input type='text' style="width:175px;" value=<%=sum%>></input></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>

            </table>
        </form>
    </body>
</html>