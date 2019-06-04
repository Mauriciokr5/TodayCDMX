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
        <meta http-equiv="refresh" content="5">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./CSS/navbar_css.css"/>
        <link rel="stylesheet" href="./CSS/login_css.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentarios</title>
    </head>
    <body>
        <header>
            <div class="container">
                <h1 class="logo">TodayCDMX</h1>

                <nav>
                    <ul>
                        <li><a href="ses.jsp">Inicio</a></li>
                        <li><a href="mapa.jsp">Mapa ciudad</a></li>
                        <li><a href="crudUsu.jsp">Usuarios</a></li>
                        <li><a href="crudAlcaldias.jsp">Alcaldias</a></li>
                        <li><a href="encuestas.jsp">Encuestas</a></li>
                        <li><a href="comentarios.jsp">Comentarios</a></li>
                        <li><a href="cerrarSesion.jsp">Cerrar Sesión</a></li>
                    </ul>
                </nav>
            </div>
        </header> 
        <h1 class="rale">Comentarios</h1>
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
    <style>
        .comen{
            width: 80%;
            border: solid 1px black;
            margin: 2%;
            padding: 2%;
            border-radius:10px;
        }
        .fecha{
            display: inline;
            font-size: 80%;
        }
        .usuario{
            display: inline;
            font-size: 150%; 
            color: #112d4e;
        }
        .comentarioUsu{
            font-size: 130%;
            margin-top: 20px;
            margin-left: 30px;
        }
    </style>
</html>
