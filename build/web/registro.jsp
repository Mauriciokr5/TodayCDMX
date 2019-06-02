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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <div class="container">
                <h1 class="logo">ProAula</h1>

                <nav>
                    <ul>
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="registro.jsp">Registro</a></li>
                        <li><a href="iniciarSesion.jsp">Iniciar Sesión</a></li>
                    </ul>
                </nav>
            </div>
        </header> 
        
        <form action="registroBD" >
            <p>Nombre</p>
            <input type="text" name="nomb" minlength="3" maxlength="50">
            <p>Correo</p>
            <input type="email" name="correo" minlength="3" maxlength="50">
            <p>Contraseña</p>
            <input type="password" name="contra" minlength="3" maxlength="50">
            <input type="submit">
        </form>
    </body>
</html>
