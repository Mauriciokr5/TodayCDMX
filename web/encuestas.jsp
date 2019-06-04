<%-- 
    Document   : encuestas
    Created on : 4/06/2019, 12:26:26 AM
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
        <link rel="stylesheet" href="./CSS/login_css.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Encuestas</title>
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
        <div class="container">
            <h1 class="rale">Encuestas</h1>
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>
                            Usuario
                        </th>
                        <th style="width: 120px;"></th>
                    </tr>
                    <%
                        try{
                            dbmanager db= new dbmanager();

                            Connection cn = db.Conectar();

                            Statement st= cn.createStatement();

                            ResultSet rs= st.executeQuery("SELECT Distinct usuario.idusuario,nombre FROM proaula.respuestas INNER join usuario on usuario.idusuario= respuestas.idusuario;");

                            while(rs.next()){
                                //out.print(rs.getString("comentario"));
                                %>
                                    <tr>
                                        <td>
                                            <%out.print(rs.getString("idusuario"));%>
                                        </td>
                                        <td>
                                            <%out.print(rs.getString("nombre"));%>
                                        </td>
                                        <td>
                                            <a href="verEncuesta.jsp?idUSU=<%out.print(rs.getString("idusuario"));%>"><button  type="button" class="btn btn-warning">Ver Encuesta</button></a>
                                        </td>
                                    </tr>
                                <%
                                //plat.add(rs.getString("platillos.platillo"));
                            }
                            cn.close();

                        }catch(Exception e){
                           // producto=String.valueOf(e);

                        }
                        %>
                    
                </tbody>
            </table>
        </div>
    </body>
</html>
