<%-- 
    Document   : grafica
    Created on : 3/06/2019, 08:00:27 PM
    Author     : Mauricio Beltrán
--%>

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
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script src="https://code.highcharts.com/modules/export-data.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Graficas</title>
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
        <%
            int id,idGraf;
            id=Integer.parseInt(request.getParameter("idAlca"));
            idGraf=Integer.parseInt(request.getParameter("idGraf"));
    
        

            try{
                dbmanager db= new dbmanager();

                Connection cn = db.Conectar();
                String q;
                q="SELECT tipografica,alcaldia,atras,now,delante FROM proaula.graficas where idalcaldia = ? and idtipograf = ?";//?= echale lo que quieras

                PreparedStatement ps=cn.prepareStatement(q);
                ps.setInt(1, id);
                ps.setInt(2, idGraf);

                ResultSet rs=ps.executeQuery();
                if (rs.next()) {
                    %>
                    <div class="container">
                        <div id="grafica" style="min-width: 300px; height: 400px; margin: 0 auto"></div>
                        
                    </div>
                    <script>
                        Highcharts.chart('grafica', {
                        chart: {
                          type: 'column'
                        },
                        title: {
                          text: '<%out.print(rs.getString("alcaldia")+" - "+rs.getString("tipografica"));%>'
                        },
                        xAxis: {
                          type: 'category',
                          labels: {
                            rotation: -45,
                            style: {
                              fontSize: '13px',
                              fontFamily: 'Verdana, sans-serif'
                            }
                          }
                        },
                        yAxis: {
                          min: 0,
                          title: {
                            text: '<%out.print(rs.getString("tipografica"));%>'
                          }
                        },
                        legend: {
                          enabled: false
                        },
                        tooltip: {
                          pointFormat: '<%out.print(rs.getString("tipografica"));%>: <b>{point.y:.1f}</b>'
                        },
                        series: [{
                          name: '<%out.print(rs.getString("tipografica"));%>',
                          data: [
                            ['Antes', <%out.print(rs.getFloat("atras"));%>],
                            ['Ahora', <%out.print(rs.getFloat("now"));%>],
                            ['Despues', <%out.print(rs.getFloat("delante"));%>]
                          ],
                          dataLabels: {
                            enabled: true,
                            rotation: -90,
                            color: '#FFFFFF',
                            align: 'right',
                            format: '{point.y:.1f}', // one decimal
                            y: 10, // 10 pixels down from the top
                            style: {
                              fontSize: '13px',
                              fontFamily: 'Verdana, sans-serif'
                            }
                          }
                        }]
                      });
                    </script>
        
        
                    <%

                }else{
                    out.print("<h1 class=\"rale\">No hay datos</h1>");
                }       
                cn.close();        
            }catch(Exception d){
                System.out.println("No hay conexion... (Solo jugo contigo) getEmpleado");
                System.out.println(d.getMessage());
                System.out.println(d.getStackTrace());
out.print("no hay datos");
            }



    %>
        
    </body>
</html>
