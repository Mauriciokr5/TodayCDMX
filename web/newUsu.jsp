<%-- 
    Document   : newUsu
    Created on : 31/05/2019, 09:17:03 PM
    Author     : Mauricio Beltrán
--%>


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
        <title>Nuevo Usuario</title>
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
                    <form action="registroAdmin" >
                        <p class="tit">Nombre</p>
                        <input type="text" name="nomb" minlength="3" maxlength="50" class="form-control" required>
                        <p class="tit">Correo</p>
                        <input type="email" name="correo" minlength="3" maxlength="50" class="form-control" required>
                        <p class="tit">Contraseña</p>
                        <input type="password" name="contra" minlength="3" maxlength="50" class="form-control" required>
                        <p class="tit">Tipo usuario</p>
                        <select name="tipo" class="form-control">
                            <option value="1">Administrador</option>
                            <option value="2" selected >Cliente</option>
                         </select>
                        <br><br>
                        <input type="submit" class="form-control bot">
                    </form>
                </div>
            </div>
        </div>
        
    </body>
</html>
