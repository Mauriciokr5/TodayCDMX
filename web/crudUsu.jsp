<%-- 
    Document   : crudUsu
    Created on : 31/05/2019, 07:12:36 PM
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
        <title>Usuarios</title>
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
        <h1 class="rale" >Usuarios</h1>
        
        <div class="container">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>
                            Nombre
                        </th>
                        <th>
                            Correo
                        </th>
                        <th>
                            Contraseña
                        </th>
                        <th><a href="newUsu.jsp" ><button type="button" class="btn btn-success">Nuevo</button></a></th>
                        <th></th>
                    </tr>
                    <%
                        try{
                            dbmanager db= new dbmanager();

                            Connection cn = db.Conectar();

                            Statement st= cn.createStatement();

                            ResultSet rs= st.executeQuery("select * from usuario where idusuario>1;");

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
                                            <%out.print(rs.getString("correo"));%>
                                        </td>
                                        <td>
                                            <%out.print(rs.getString("contrasena"));%>
                                        </td>
                                        <td>
                                            <a href="modUsu.jsp?idUSU=<%out.print(rs.getString("idusuario"));%>"><button  type="button" class="btn btn-warning">Modificar</button></a>
                                        </td>
                                        <td>
                                            <a href="delUsu.jsp?idUSU=<%out.print(rs.getString("idusuario"));%>"><button  type="button" class="btn btn-danger">Eliminar</button></a>
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
