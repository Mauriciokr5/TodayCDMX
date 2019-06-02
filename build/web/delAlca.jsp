<%-- 
    Document   : delAlca
    Created on : 2/06/2019, 02:49:37 PM
    Author     : Mauricio Beltrán
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.dbmanager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String nom;
            int id, estatus;
            id=Integer.parseInt(request.getParameter("idAlca"));
            
            
            try{
                dbmanager db= new dbmanager();

                Connection cn = db.Conectar();
                String q;
                q="update alcaldias set visibilidad = 0 where idalcaldias = ?";//?= echale lo que quieras

                PreparedStatement ps=cn.prepareStatement(q);
                ps.setInt(1, id);

                estatus=ps.executeUpdate();
                if (estatus>0) {
                    out.print("<script>alert('Alcaldia eliminada');</script>");
                }
                response.sendRedirect("crudAlcaldias.jsp");
                cn.close();

            }catch(Exception d){
                System.out.println("No hay conexion... (Solo jugo contigo) Actualizar");
                System.out.println(d.getMessage());
                System.out.println(d.getStackTrace());
            }
        
        
        %>
    </body>
</html>
