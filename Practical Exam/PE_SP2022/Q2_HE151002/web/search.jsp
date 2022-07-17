<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : search
    Created on : Jul 16, 2022, 12:57:03 AM
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
        <form action="search" method="post">
            Account: 
            <select name="acc">
                <c:forEach var="l" items="${list}">
                    <option value="${l.getUsername()}">${l.getDisplayName()}</option>
                </c:forEach>
            </select>
            <input type="submit" value="Search">
        </form>
        <c:if test="${listmem!=null}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Member ID</th>
                        <th>Name</th>
                        <th>DOB</th>
                        <th>Gold Member</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="m" items="${listmem}">
                        <tr>
                            <td>${m.getId()}</td>
                            <td>${m.getName()}</td>
                            <td>${m.getDob()}</td>
                            <c:if test="${m.isIsGold()==true}">
                                <td>Yes</td>

                            </c:if>
                            <c:if test="${m.isIsGold()!=true}">
                                <td>No</td>

                            </c:if>

                        </tr>                </c:forEach>

                    </tbody>
            </c:if>

        </table>
    </body>
</html>
