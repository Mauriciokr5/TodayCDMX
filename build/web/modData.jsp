<%-- 
    Document   : modData
    Created on : 2/06/2019, 03:06:58 PM
    Author     : Mauricio Beltrán
--%>

<%@page import="java.sql.PreparedStatement"%>
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
        
        int id, idGraf, estatus;
        id=Integer.parseInt(request.getParameter("idAlca"));
        idGraf=Integer.parseInt(request.getParameter("idGraf"));
        
        float antes=15, now=15, despues=15;
        String hol="yes";
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="SELECT atras,now,delante FROM proaula.graficasdata where idtipograf= ? and idalcaldia=?";//?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            ps.setInt(1, idGraf);
            ps.setInt(2, id);
            
            ResultSet rs=ps.executeQuery();
            if (rs.next()) {
                antes=rs.getFloat(1);
                now=rs.getFloat(2);
                despues=rs.getFloat(3);
                
            }else{
                dbmanager db2= new dbmanager();
            
                Connection cn2 = db2.Conectar();
                String q2;
                q2="insert into proaula.graficasdata(idtipograf,idalcaldia) values (?,?)";//?= echale lo que quieras

                ps=cn2.prepareStatement(q2);



                ps.setInt(1, idGraf);
                ps.setInt(2, id);




                estatus=ps.executeUpdate();
                response.sendRedirect("modData.jsp?&idAlca="+id+"&idGraf="+idGraf);
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
        <title>Midificar Datos</title>
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
            <h1 class="rale">Modificar Datos</h1>
            <div class="row justify-content-md-center">
                <div class="man col-md-6">
                    <form action="modDataBD">
                        <input type="hidden" value="<%out.print(id);%>" name="idalca">
                        <input type="hidden" value="<%out.print(idGraf);%>" name="idgraf">
                        
                        <div class="row">
                            <div class="col-md-4">
                                <h1 class="tit">Dato Pasado</h1>
                                <input type="number" value="<%out.print(antes);%>" name="antes" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <h1 class="tit">Dato actual</h1>
                                <input type="number" value="<%out.print(now);%>" name="now" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <h1 class="tit" >Estimación</h1>
                                <input type="number" value="<%out.print(despues);%>"readonly="readonly" class="form-control">
                            </div>
                        </div>
                        <br><br>
                        <input type="submit" value="Enviar" class="form-control bot">

                    </form>
                </div>
            </div>
        </div>
        
        
        
        
    </body>
</html>
