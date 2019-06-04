<%-- 
    Document   : modUsu
    Created on : 31/05/2019, 08:28:43 PM
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





        USU e = new USU();
                
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="Select * from usuario where idusuario = ?";//?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            ps.setInt(1, id);
            
            ResultSet rs=ps.executeQuery();
            if (rs.next()) {
                e.setNombre(rs.getString(2));
                e.setCorreo(rs.getString(3));
                e.setContrasena(rs.getString(4));
                e.setTipo(rs.getInt(5));
                
            }            
            cn.close();        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) getEmpleado");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }



%>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./CSS/navbar_css.css"/>
        <link rel="stylesheet" href="./CSS/login_css.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Usuario</title>
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
            <h1 class="rale">Modificar Usuario</h1>
            <div class="row justify-content-md-center">
                <div class="man col-md-4">
                    <form action="mod2">
                        <input type="hidden" value="<%out.print(id);%>" name="id">
                        <p class="tit">Nombre</p>
                        <input class="form-control" type="text" value="<%out.print(e.getNombre());%>" name="nom" required>
                        <p class="tit">Correo</p>
                        <input class="form-control" type="email" value="<%out.print(e.getCorreo());%>" name="mail" required>
                        <p class="tit">Contraseña</p>
                        <input class="form-control" type="password" value="<%out.print(e.getContrasena());%>" name="contra" required>
                        <p class="tit">Tipo Usario</p>
                        <input class="form-control" type="text" value="<%out.print(e.getTipo());%>" name="tipo" required>
                        <br><br>
                        <input type="submit" value="Enviar" class="form-control bot">

                    </form>
                </div>
            </div>
        </div>
        
    </body>
</html>
