<%-- 
    Document   : comentarios
    Created on : 31/05/2019, 06:11:59 PM
    Author     : Mauricio Beltrán
--%>

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
       
    
    
%>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./CSS/navbar_css.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentarios</title>
    </head>
    <body>
        <header>
            <div class="container">
                <h1 class="logo">ProAula</h1>

                <nav>
                    <ul>
                        <li><a href="ses.jsp">Inicio</a></li>
                        <li><a href="mapa.jsp">Mapa ciudad</a></li>
                        <li><a href="crudUsu.jsp">Usuarios</a></li>
                        <li><a href="">Alcaldias</a></li>
                        <li><a href="">Encuestas</a></li>
                        <li><a href="comentarios.jsp">Comentarios</a></li>
                        <li><a href="cerrarSesion.jsp">Cerrar Sesión</a></li>
                    </ul>
                </nav>
            </div>
        </header> 
        <h1>Comentarios</h1>
        <div class="container">
        <%
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            Statement st= cn.createStatement();
            
            ResultSet rs= st.executeQuery("SELECT usuario.nombre, comentarios.comentario, comentarios.fecha FROM proaula.comentarios INNER JOIN proaula.usuario ON comentarios.idUsu=usuario.idusuario ORDER BY comentarios.idcomentarios DESC;");
            
            while(rs.next()){
                //out.print(rs.getString("comentario"));
                %>
                    <div class="comen">
                        <h1 class="usuario">
                            <%out.print(rs.getString("nombre"));%>
                        </h1>
                        <p class="fecha"><%out.print(rs.getString("fecha"));%></p>
                        <p class="comentarioUsu">
                            <%out.print(rs.getString("comentario"));%>
                        </p>
                    </div>
                <%
                //plat.add(rs.getString("platillos.platillo"));
            }
            cn.close();
            
        }catch(Exception e){
           // producto=String.valueOf(e);
            
        }
        %>
        </div>
    </body>
</html>
