/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import beans.USU;
import beans.metodo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mauricio Beltrán
 */
public class registroBD extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String nom, pass, email;
            nom=request.getParameter("nomb");
            pass=request.getParameter("contra");
            email=request.getParameter("correo");
            
            
            USU e = new USU();
            metodo met = new metodo();
            
            e.setNombre(nom);
            e.setCorreo(email);
            e.setContrasena(pass);
            e.setTipo(2);
            
            int estatus = met.Guardar(e);
            if (estatus>0) {
                out.print("<script>alert('El usuario se guardo con exito');</script>");
                response.sendRedirect("index.jsp");
            }else{
                out.print("<script>alert('El usuario no se pudo guardar');</script>");
                //response.sendRedirect("index.jsp");
            }
            
            
            
            
            
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registroBD</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>"+ nom + "</h1>");
            out.println("<h1>"+ pass + "</h1>");
            out.println("<h1>"+ email + "</h1>");
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
        /*try (PrintWriter out = response.getWriter()) {
            
            String nom, pass, email;
            nom=request.getParameter("nomb");
            pass=request.getParameter("contra");
            email=request.getParameter("correo");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registroBD</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registroBD at " + nom + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
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

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
