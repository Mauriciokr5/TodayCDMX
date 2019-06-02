<%-- 
    Document   : ses
    Created on : 31/05/2019, 04:40:07 PM
    Author     : Mauricio Beltrán
--%>

<%@page import="beans.USU"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
        int nivel=0;
        try{
            session = request.getSession();
            String y;
            y=""+session.getAttribute("levelac");

            nivel=Integer.parseInt(y);
            USU e = new USU();
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
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <div class="container">
                <h1 class="logo">ProAula</h1>

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
        
    </body>
</html>