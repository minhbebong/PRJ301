<%-- 
    Document   : ListUser
    Created on : Jun 1, 2022, 5:15:58 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"  %>
<%@page import="model.User"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${name}</h1>

        <table border="1">
            <tr>
                <td>Account</td>
                <td>Name</td>
                <td>Gender</td>
                <td>Address</td>
                <td>Birthdate</td>
            </tr>
            <%
                ArrayList<User> list = new ArrayList<User>();
                if(request.getAttribute("list") != null)
                    list = (ArrayList<User>)request.getAttribute("list");
                    
                for(User item:list)
                {
                    out.print("<tr>");
                        out.print("<td>" +item.getAccount() +"</td>");
                        out.print("<td>" +item.getName() +"</td>");
                        out.print("<td>" +item.getGender() +"</td>");
                        out.print("<td>" +item.getAddress() +"</td>");
                        out.print("<td>" +item.getDob() +"</td>");
                    out.print("</tr>");
                }
            
            %>
        </table> 

    </body>
</html>
