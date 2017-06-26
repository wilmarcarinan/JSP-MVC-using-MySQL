<%-- 
    Document   : user.jsp
    Created on : Jun 26, 2017, 11:17:03 AM
    Author     : Wilmar Paul
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="css/jquery-ui.css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <title>Add new user</title>
    </head>
    <body>
        <script>
            $(function() {
                $('input[name=dob]').datepicker();
            });
        </script>

        <form method="POST" action='UserController' name="frmAddUser">
            User ID : <input type="text" readonly="readonly" name="userid"
                value='<c:out value="${user.userid}" />' /> <br />
            First Name : <input
                type="text" name="firstName"
                value='<c:out value="${user.firstName}" />' /> <br />
            Last Name : <input
                type="text" name="lastName"
                value='<c:out value="${user.lastName}" />' /> <br />
            DOB : <input
                type="text" name="dob"
                value='<fmt:formatDate pattern="MM/dd/yyyy" value="${user.dob}" />' /> <br />
            Email : <input type="email" name="email"
                value='<c:out value="${user.email}" />' /> <br /> <input
                type="submit" value="Submit" />
        </form>
    </body>
</html>
