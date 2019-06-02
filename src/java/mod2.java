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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mauricio Beltrán
 */
public class mod2 extends HttpServlet {

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
            
            String nom, pass, email;
            int id, estatus, tipo;
            id=Integer.parseInt(request.getParameter("id"));
            nom=request.getParameter("nom");
            pass=request.getParameter("contra");
            email=request.getParameter("mail");
            tipo=Integer.parseInt(request.getParameter("tipo"));
            
            
            try{
                dbmanager db= new dbmanager();

                Connection cn = db.Conectar();
                String q;
                q="update usuario set nombre = ?, correo = ?, contrasena = ?, idtipo = ? where idUsuario = ?";//?= echale lo que quieras

                PreparedStatement ps=cn.prepareStatement(q);
                ps.setString(1, nom);
                ps.setString(2, email);
                ps.setString(3, pass);
                ps.setInt(4, tipo);
                ps.setInt(5, id);

                estatus=ps.executeUpdate();
                if (estatus>0) {
                    out.print("<script>alert('Usuario modificado');</script>");
                }
                response.sendRedirect("crudUsu.jsp");
                cn.close();

            }catch(Exception d){
                System.out.println("No hay conexion... (Solo jugo contigo) Actualizar");
                System.out.println(d.getMessage());
                System.out.println(d.getStackTrace());
            }
            
            
            
            
            
            
            
            
            
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet mod2</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet mod2 at " + request.getContextPath() + "</h1>");
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
