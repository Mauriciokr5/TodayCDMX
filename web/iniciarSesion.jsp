
<%-- 
    Document   : iniciarSesion
    Created on : 31/05/2019, 03:44:29 PM
    Author     : Mauricio Beltrán
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./CSS/navbar_css.css"/>
        <link rel="stylesheet" href="./CSS/login_css.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesión</title>
    </head>
    <body>
        <header>
            <div class="container">
                <h1 class="logo">TodayCDMX</h1>

                <nav>
                    <ul>
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="registro.jsp">Registro</a></li>
                        <li><a href="iniciarSesion.jsp">Iniciar Sesión</a></li>
                    </ul>
                </nav>
            </div>
        </header> 
        <div class="container">
            <h1 class="rale">Inicio de sesión</h1>
            <div class="row justify-content-md-center">
                <div class="man col-md-4">

                    <form action="inicioSesionBD" >
                        <label class="tit">Correo</label>
                        <input type="email" name="correo" minlength="3" maxlength="50"  class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                        <label class="tit">Contraseña</label>
                        <input type="password" name="contra" minlength="3" maxlength="50"  class="form-control" pattern="[A-Za-z]{3,}" required>
                        <br><br>
                        <input type="submit" value="Iniciar" class="form-control bot">
                    </form>
                </div> 
            </div>
        </div>

        
    </body>
</html>
