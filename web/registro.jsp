<%-- 
    Document   : registro
    Created on : 31/05/2019, 09:14:44 AM
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
        <title>Registro</title>
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
            <h1 class="rale">Registro</h1>
            <div class="row justify-content-md-center">
                <div class="man col-md-4">
                    <form action="registroBD" >
                        <label for="nomb" class="tit">Nombre</label>
                        <input class="form-control" type="text" name="nomb" id="nomb" minlength="3" maxlength="50" pattern="[A-Za-z]{3,}" required>
                        <label for="correo" class="tit">Correo</label>
                        <input class="form-control" type="email" name="correo" id="correo" minlength="3" maxlength="50" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                        <label for="pass" class="tit">Contraseña</label>
                        <input class="form-control" type="password" name="contra" id="pass" minlength="3" maxlength="50" pattern="[A-Za-z]{3,}" required>
                        <br><br>
                        <input type="submit" class="form-control bot" value="Registrarse">
                    </form>
                    
                </div>
                
            </div>
        </div>
        
    </body>
</html>
