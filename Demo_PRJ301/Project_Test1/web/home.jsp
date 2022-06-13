<%-- 
    Document   : home
    Created on : Jun 12, 2022, 10:08:56 PM
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

        <form  action="">
            <table>
                <tr>
                    <th>Company</th>
                    <th>Contact</th>
                    <th>Country</th>
                </tr>
                <%
                ArrayList<type_Product> list = new ArrayList<>();
                ProductDAO pd = new ProductDAO();
                list = pd.getType();
                if (list != null && list.size() > 0) {
                    for (type_Product i : list) {
                %>
                <tr>
                    <td><%= ele.getId()%></td>
                    <td><%= ele.getImage()%></td>
                    <td><%= ele.getType_Name()%></td>
                </tr>
                <%
                    }
                %>


            </table>

        </form>

    </body>
</html>
