<%-- 
    Document   : doEncuesta
    Created on : 3/06/2019, 09:56:38 PM
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

        //e = (USU) session.getAttribute("usuario");

    }catch(Exception ws){
    response.sendRedirect("index.jsp");
    }



    int id, estatus;
    id=Integer.parseInt(request.getParameter("idUsu"));
%>

<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./CSS/login_css.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Encuesta</title>
    </head>
    <body>
        <div class="container">
            <h1 class="rale">Encuesta</h1>
            <div class="row justify-content-md-center">
                <div class="man col-md-8">
                    
                    <form action="enviarEncuesta">

                        <%
                            try{
                                dbmanager db= new dbmanager();

                                Connection cn = db.Conectar();

                                Statement st= cn.createStatement();

                                ResultSet rs= st.executeQuery("SELECT * FROM preguntas;");

                                while(rs.next()){

                                    %>
                                    <p class="tit"><%out.print(rs.getString("pregunta"));%></p>
                                    <select name="op<%out.print(rs.getString("idpreguntas"));%>" required class="form-control">
                                        <%
                                        try{
                                            dbmanager db2= new dbmanager();

                                            Connection cn2 = db2.Conectar();

                                            Statement st2= cn2.createStatement();

                                            ResultSet rs2= st2.executeQuery("SELECT * FROM opciones where idpregunta = "+rs.getString("idpreguntas")+";");

                                            while(rs2.next()){
                                                %>
                                                <option value="<%out.print(rs2.getString("idopciones"));%>"><%out.print(rs2.getString("opcion"));%></option>
                                               <%
                                            }
                                            cn2.close();

                                        }catch(Exception e){
                                           // producto=String.valueOf(e);

                                        }
                                        %>
                                    </select>
                                    <%
                                    //plat.add(rs.getString("platillos.platillo"));
                                }
                                cn.close();

                            }catch(Exception e){
                               // producto=String.valueOf(e);

                            }
                            %>
                            <input type="hidden" value="<%out.print(id);%>" name="idUsu">
                            <br><br>
                            <input type="submit" value="Enviar" class="form-control bot">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
