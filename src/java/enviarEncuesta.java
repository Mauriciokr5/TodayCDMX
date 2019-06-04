/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import beans.dbmanager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mauricio Beltrán
 */
public class enviarEncuesta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int idUsu, estatus=0;
            idUsu=Integer.parseInt(request.getParameter("idUsu"));
            try{
                dbmanager db= new dbmanager();

                java.sql.Connection cn = db.Conectar();
                Statement st= cn.createStatement();

                ResultSet rs= st.executeQuery("SELECT * FROM preguntas;");

                while(rs.next()){
                    String opcion = request.getParameter("op"+rs.getString(1));
                    try{
                        dbmanager db2= new dbmanager();

                        Connection cn2 = db2.Conectar();
                        String q;
                        q="INSERT INTO respuestas (idpregunta,idusuario,idopcion) values (?,?,?);";//?= echale lo que quieras

                        PreparedStatement ps2=cn2.prepareStatement(q);



                        ps2.setString(1, rs.getString(1));
                        ps2.setInt(2, idUsu);
                        ps2.setString(3, opcion);




                        estatus=ps2.executeUpdate();

                        cn2.close();

                    }catch(Exception d){
                        System.out.println("No hay conexion... (Solo jugo contigo) guardar");
                        System.out.println(d.getMessage());
                        System.out.println(d.getStackTrace());
                    }
                }
                
                try{
                    dbmanager db3= new dbmanager();

                    Connection cn3 = db3.Conectar();
                    String q;
                    q="update enclisto set hecho = ? where idUsu = ?";//?= echale lo que quieras

                    PreparedStatement ps3=cn3.prepareStatement(q);
                    ps3.setInt(1, 1);
                    ps3.setInt(2, idUsu);

                    estatus=ps3.executeUpdate();
                    if (estatus>0) {
                        out.print("<script>alert('Usuario modificado');</script>");
                    }
                    cn3.close();

                }catch(Exception d){
                    System.out.println("No hay conexion... (Solo jugo contigo) Actualizar");
                    System.out.println(d.getMessage());
                    System.out.println(d.getStackTrace());
                }
                response.sendRedirect("ses.jsp");
                cn.close();

            }catch(Exception d){
                System.out.println("No hay conexion... (Solo jugo contigo) Actualizar");
                System.out.println(d.getMessage());
                System.out.println(d.getStackTrace());
            }
            if (estatus>0) {
            }
            
            
            
            
            
            
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet enviarEncuesta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet enviarEncuesta at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
