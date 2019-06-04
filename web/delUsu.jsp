<%-- 
    Document   : delUsu
    Created on : 31/05/2019, 07:49:19 PM
    Author     : Mauricio Beltrán
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.dbmanager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
        int nivel=0;
        try{
            session = request.getSession();
            String y;
            y=""+session.getAttribute("levelac");

            nivel=Integer.parseInt(y);
            if (nivel!=1) {
                    response.sendRedirect("index.jsp");
                }
            
            //e = (USU) session.getAttribute("usuario");
            
        }catch(Exception ws){
        response.sendRedirect("index.jsp");
        }
        
        int id, estatus;
        id=Integer.parseInt(request.getParameter("idUSU"));
        
            
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="delete from enclisto where idUsu = ?";//?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            ps.setInt(1, id);
            
            estatus=ps.executeUpdate();
            
            
            q="delete from usuario where idusuario = ?";//?= echale lo que quieras

            PreparedStatement ps2=cn.prepareStatement(q);
            ps2.setInt(1, id);
            
            estatus=ps2.executeUpdate();
            
            response.sendRedirect("crudUsu.jsp");
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) Eliminar");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
       
    
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar</title>
    </head>
    <body>
        <h1><%out.print(id);%></h1>
    </body>
</html>
