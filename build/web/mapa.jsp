<%-- 
    Document   : mapa
    Created on : 3/06/2019, 06:43:06 PM
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
            /*if (nivel!=1) {
                    response.sendRedirect("index.jsp");
                }*/
            
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if (nivel==1) {
            %>
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
            <%
        }else{
            %>
                <header>
                    <div class="container">
                        <h1 class="logo">TodayCDMX</h1>

                        <nav>
                            <ul>
                                <li><a href="ses.jsp">Inicio</a></li>
                                <li><a href="mapa.jsp">Mapa ciudad</a></li>
                                <li><a href="cerrarSesion.jsp">Cerrar Sesión</a></li>
                            </ul>
                        </nav>
                    </div>
                </header>
            <%
        }
        %>
        
        <div class="row">
            
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <br>
                <%
                try{
                    dbmanager db= new dbmanager();

                    Connection cn = db.Conectar();

                    Statement st= cn.createStatement();

                    ResultSet rs= st.executeQuery("SELECT * FROM alcaldias where visibilidad = 1;");

                    while(rs.next()){
                        //out.print(rs.getString("comentario"));
                        %>
                        <a id="<%out.print(rs.getString("idalcaldias"));%>" onclick="cambioHref(this.id)"><input  id="but<%out.print(rs.getString("idalcaldias"));%>"type="button" class="btn btn-light" value="<%out.print(rs.getString("alcaldia"));%>"></a>
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
            <div class="col-md-2">
                <br><br><br>
                <%
                try{
                    dbmanager db= new dbmanager();

                    Connection cn = db.Conectar();

                    Statement st= cn.createStatement();

                    ResultSet rs= st.executeQuery("SELECT * FROM tipografica ;");

                    while(rs.next()){
                        //out.print(rs.getString("comentario"));
                        %>
                        <a id="<%out.print(rs.getString("idtipografica"));%>" onclick="redi(this.id)" style="display:none;" name="boton"><button  type="button" class="btn btn-light" ><%out.print(rs.getString("tipografica"));%></button></a>
                        <br><br>
                        <%
                        //plat.add(rs.getString("platillos.platillo"));
                    }
                    cn.close();

                }catch(Exception e){
                   // producto=String.valueOf(e);

                }
                %>
            </div>
            <div class="col-md-4">
                <h1 id="nom" class="rale" ></h1>
                <img src="SRC/CDMX.PNG" alt="cdmx" style="width: 100%;" class="nos"/>
                <img src="SRC/CDMX2.png" alt="cdmx2" style="width: 100%;" class="nos"/>
                
                
                
                
            </div>
        </div>
            <input type="hidden" value="" id="alcal">
    </body>
    <script src="./JS/botones.js"></script>
    
</html>
