<%-- 
    Document   : ListProduct
    Created on : Jun 22, 2022, 5:02:46 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"  %>
<%@page import="model.Product"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <table border="1">
            <tr>
                <td>ProductID</td>
                <td>ProductName</td>
                <td>Unit</td>
                <td>Price</td>
                <td>ProductImage</td>
            </tr>
            <%
                ArrayList<Product> list = new ArrayList<Product>();
                if(request.getAttribute("list") != null)
                    list = (ArrayList<Product>)request.getAttribute("list");
                    
                for(Product item:list)
                {
                    out.print("<tr>");
                        out.print("<td>" +item.getId() +"</td>");
                        out.print("<td>" +item.getName() +"</td>");
                        out.print("<td>" +item.getUnit() +"</td>");
                        out.print("<td>" +item.getPrice() +"</td>");
                        out.print("<td><img style = 'width:70px;height:50px'src = '" +item.getImage()+"'></td>");
                    out.print("</tr>");
                }
            
            %>
        </table> 
    </body>
</html>
