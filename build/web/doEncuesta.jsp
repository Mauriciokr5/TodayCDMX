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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Encuesta</h1>
        <form action="enviarEncuesta">
            
            <%
                try{
                    dbmanager db= new dbmanager();

                    Connection cn = db.Conectar();

                    Statement st= cn.createStatement();

                    ResultSet rs= st.executeQuery("SELECT * FROM preguntas;");

                    while(rs.next()){
                        
                        %>
                        <p><%out.print(rs.getString("pregunta"));%></p>
                        <select name="op<%out.print(rs.getString("idpreguntas"));%>" required>
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
                <input type="submit" value="Enviar">
        </form>
    </body>
</html>
