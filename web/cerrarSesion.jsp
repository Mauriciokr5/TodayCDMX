<%-- 
    Document   : cerrarSesion
    Created on : 31/05/2019, 05:26:24 PM
    Author     : Mauricio Beltrán
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    sesion.setAttribute("levelac", null);
    response.sendRedirect("index.jsp");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bye</h1>
    </body>
</html>
