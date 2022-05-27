<%-- 
    Document   : Example
    Created on : May 25, 2022, 5:13:07 PM
    Author     : bavan
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
        //Đây gọi là scriptest 
        //Là nơi chứa code Java giống như bên servlet
       String message ="Hello World!";
       out.print(message);
       //khai báo và khởi tạo 2 biến số nguyên a và b
            int a = Integer.parseInt(request.getParameter("a"));
            int b = Integer.parseInt(request.getParameter("b"));
            String result=(String)request.getAttribute("result");
            //out.print("Ket qua tu form truoc: "+result);
       //hiển thị tổng hiệu tích thương của a và b
       //out.print("<br>a+b: "+(a+b));
       //out.print("<br>a-b: "+(a-b));
       //out.print("<br>a*b: "+(a*b));
       //out.print("<br>a/b: " +(a/b));
        %>
<!--        //Đây là dòng comment-->
        <br>Ket qua tu form truoc : <%=result%>
        <br> a = <%=a%>
        <br> b = <%=b%>
        <br> a+b = <%=a+b%>
        <br> a-b = <%=a-b%>
        <br> a*b = <%=a*b%>
        <br> a/b = <%=a/b%>



        <%!
            //Declaration
            String message="Hello JSP";
        %>
    </body>
</html>
