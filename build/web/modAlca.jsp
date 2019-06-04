<%-- 
    Document   : modAlca
    Created on : 2/06/2019, 01:59:44 PM
    Author     : Mauricio Beltrán
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
        
        int id, estatus;
        id=Integer.parseInt(request.getParameter("idAlca"));

        String alcaldia="";
                
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="SELECT * FROM proaula.alcaldias where idalcaldias = ?";//?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            ps.setInt(1, id);
            
            ResultSet rs=ps.executeQuery();
            if (rs.next()) {
                alcaldia = rs.getString(2);
                
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
        <title>Modificar Alcaldía</title>
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
            <h1 class="rale">Modificar Alcaldía</h1>
            <div class="row justify-content-md-center">
                <div class="man col-md-4">
                    <form action="modNombreAlca">
                        <input type="hidden" value="<%out.print(id);%>" name="idAlca">
                        <h2 class="tit">Nombre</h2>
                        <input type="text" value="<%out.print(alcaldia);%>" name="newNom" class="form-control" required>
                        <br><br>
                        <input type="submit" value="Enviar" class="bot form-control">

                    </form>
                </div>
        
            <div class="col-md-1">
            <div class="col-md-3 dist_botones">
            <%
        try{
            dbmanager db= new dbmanager();

            Connection cn = db.Conectar();

            Statement st= cn.createStatement();

            ResultSet rs= st.executeQuery("SELECT * FROM tipografica ");

            while(rs.next()){
                //out.print(rs.getString("comentario"));
                %>
                <a  href="modData.jsp?&idAlca=<%out.print(id);%>&idGraf=<%out.print(rs.getString("idtipografica"));%>"><button type="button" class="sep btn btn-secondary"><%out.print(rs.getString("tipografica"));%></button></a>
                <br>
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
        <style>
            .sep{
                margin-top: 5px;
                margin-bottom: 5px;
            }
        </style>
    </body>
</html>
