<%-- 
    Document   : verEncuesta
    Created on : 4/06/2019, 12:48:56 AM
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
        int idUsu;
        idUsu=Integer.parseInt(request.getParameter("idUSU"));
    
    
%>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./CSS/navbar_css.css"/>
        <link rel="stylesheet" href="./CSS/login_css.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Encuesta</title>
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
            <h1 class="rale">Encuesta</h1>
            <div class="row justify-content-md-center">
                <div class="man col-md-8">
        <%
        try{
            dbmanager db= new dbmanager();

            Connection cn = db.Conectar();

            Statement st= cn.createStatement();

            ResultSet rs= st.executeQuery("SELECT * FROM preguntas;");

            while(rs.next()){

                %>
                <p class="tit" ><%out.print(rs.getString("pregunta"));%></p>
                    <%
                    try{
                        dbmanager db2= new dbmanager();

                        Connection cn2 = db2.Conectar();

                        Statement st2= cn2.createStatement();

                        ResultSet rs2= st2.executeQuery("SELECT opcion FROM proaula.respuestas inner join opciones on respuestas.idopcion = opciones.idopciones where respuestas.idpregunta="+rs.getString("idpreguntas")+" and idusuario="+idUsu+";");

                        while(rs2.next()){
                            %>
                            <input class="form-control" type="text" readonly="readonly" value="<%out.print(rs2.getString("opcion"));%>">
                            
                           <%
                        }
                        cn2.close();

                    }catch(Exception e){
                       // producto=String.valueOf(e);

                    }
                    %>
                <%
                //plat.add(rs.getString("platillos.platillo"));
            }
            cn.close();

        }catch(Exception e){
           // producto=String.valueOf(e);

        }
        %>
        </div>
        </div>
        </div>
    </body>
</html>
