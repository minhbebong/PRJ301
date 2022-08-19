<%-- 
    Document   : add
    Created on : Jun 29, 2022, 4:30:04 PM
    Author     : Lenovo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="add" method="POST">
            <table>
                <tr>Add new Student</tr>
                <tr>
                    <td>ID:</td>
                    <td><input type="text" name="id" value="" /></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" value="" /></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><input type="radio" name="gender" value="1" checked="checked" /> Male 
                        <input type="radio" name="gender" value="0" /> Female 

                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <select name="Department" id="Department">
                            <option value="Infor">Information Technology</option>
                            <option value="Business">Business Administration</option>
                            <option value="Data">Data Science</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><input type="submit" value="Add"/></td>
                    <td></td>
                </tr>
            </table>
            <table border="1">
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>Gender</td>
                    <td>Department</td>   
                </tr>
            </table>
            <c:forEach items="${list}" var="item">
                <tr>
                    <td>${item.getId()}</td>
                    <td>${item.getName()}</td>
                    <td>${item.getGender()}</td>
                    <td>${item.getDepartment()}</td>
                </tr>
            </c:forEach>
        </form>
        
    </body>
</html>

