<%-- 
    Document   : Test1
    Created on : Mar 3, 2020, 7:55:39 PM
    Author     : tienpro
--%>

<%@page import="java.util.ArrayList"%>
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
            <%
            String result = "";
            ArrayList<Integer> list = (ArrayList<Integer>) request.getAttribute("List");
            String Notice = (String) request.getAttribute("Notice");
            if (Notice == null) {
                Notice = "";
            }
            if (Notice.equals("")) {
                if (list != null) {
                    if (!list.isEmpty()) {
                        result = list.toString();
                    }

                }
            } else {
                result = Notice;
            }
            %>
        </style>
    </head>
    <body>
        <form action="Workshop2_lesson1" method="POST">
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
                    <td><i><b>Enter an integer n:</b></i></td>
                    <td rowspan='8'>
                        <textarea rows='7' cols='10'>
                        <%=result%>
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td><input type='text' name='Number' id='a' style="width:150px">
                        <input type='submit' name="V" value='  >>  '>
                         <input type='submit' name="V" value='Check'>
                    
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td align='center'><input type="submit" name="V" value="RESET" style="font-size:20px;font-weight:bold;color:red">
                    
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
            </table>
        </form>
    </body>
</html>