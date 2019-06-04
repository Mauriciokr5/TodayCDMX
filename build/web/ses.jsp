<%-- 
    Document   : ses
    Created on : 31/05/2019, 04:40:07 PM
    Author     : Mauricio Beltrán
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.dbmanager"%>
<%@page import="beans.USU"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
        int nivel=0;
        int id = 0;
        try{
            session = request.getSession();
            String y,mail;
            y=""+session.getAttribute("levelac");
            mail=""+session.getAttribute("correo");
            nivel=Integer.parseInt(y);
            USU e = new USU();
            //e = (USU) session.getAttribute("usuario");
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="SELECT hecho, idUsu FROM proaula.usuario INNER JOIN enclisto ON usuario.idusuario = enclisto.idUsu where correo=?;";//?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            ps.setString(1, mail);
            
            ResultSet rs=ps.executeQuery();
            if (rs.next()) {
                id=rs.getInt(2);
                if (rs.getInt(1)==0) {
                    response.sendRedirect("doEncuesta.jsp?idUsu="+rs.getInt(2));
                }
                
            }            
            cn.close();        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) getEmpleado");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
            response.sendRedirect("index.jsp");
        }
        
        
       
    
    
%>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./CSS/navbar_css.css"/>
        <link rel="stylesheet" href="./CSS/login_css.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <div class="container">
                <h1 class="logo">TodayCDMX</h1>

                <nav>
                    <ul>
                        <%
                   
                        switch(nivel){
                            case 1:
                                %>
                                <li><a href="ses.jsp">Inicio</a></li>
                                <li><a href="mapa.jsp">Mapa ciudad</a></li>
                                <li><a href="crudUsu.jsp">Usuarios</a></li>
                                <li><a href="crudAlcaldias.jsp">Alcaldias</a></li>
                                <li><a href="encuestas.jsp">Encuestas</a></li>
                                <li><a href="comentarios.jsp">Comentarios</a></li>
                                <li><a href="cerrarSesion.jsp">Cerrar Sesión</a></li>
                            <%
                                //out.print("Admin "+ session.getAttribute("nombreusu"));
                            break;

                            case 2:
                                //out.print("Cliente");
                                %>
                                <li><a href="ses.jsp">Inicio</a></li>
                                <li><a href="mapa.jsp">Mapa ciudad</a></li>
                                <li><a href="cerrarSesion.jsp">Cerrar Sesión</a></li>
                            <%

                            break;

                        }
                        %>
                    </ul>
                </nav>
            </div>
        </header> 
        <%
                   
        switch(nivel){
            case 1:
                %>
                <h1 class="rale">Bienvenido Administrador</h1>
            <%
                //out.print("Admin "+ session.getAttribute("nombreusu"));
            break;

            case 2:
                //out.print("Cliente");
                %>
                <div class="container">
                    <h1 class="rale">Ingresa un comentario</h1>
                    <div class="row justify-content-md-center">
                        <div class="col-md-4">
                            <form action="comentar">
                                <textarea name="comentario" cols="40" rows="5" required class="form-control"></textarea>
                                <input type="hidden" value="<%out.print(id);%>" name="id">
                                <br>
                                <input type="submit" value="Comentar" class="bot form-control">
                            </form>
                            
                        </div>
                    </div>
                    
                </div>
                    
            <%

            break;

        }
        %>
        
    </body>
</html>
