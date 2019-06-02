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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mauricio Beltrán
 */
public class inicioSesionBD extends HttpServlet {

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
            
            String pass, email;
            pass=request.getParameter("contra");
            email=request.getParameter("correo");
            
            USU e = new USU();
            
            metodo met = new metodo();
            
            e = met.verificarUsuario(email, pass);
            
            if (e!=null) {
                
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("usuario", e);
                System.out.println(e.getNombre());
                //Sesion por parte del formulario
                HttpSession sesionOK = request.getSession(true);
                sesionOK.setAttribute("usuario", email);
                int rolicus= e.getTipo();
                sesion.setAttribute("levelac", null);
                sesion.setAttribute("levelac", e.getTipo());
                sesion.setAttribute("nombreusu", e.getNombre());
                if (rolicus!=0) {
                    if(e.getTipo()==1){
                    response.sendRedirect("ses.jsp");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('admin');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                    }
                    else{
                        response.sendRedirect("ses.jsp");
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('no admin');");
                        out.println("location='index.jsp';");
                        out.println("</script>");
                    }
                }else{
                    sesion.setAttribute("levelac", null);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Correo o contraseña incorrecta');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                    
                    //out.println("<body onload=\"alert('Usuario o Contraseña incorrectos'); window.location='/ProyectoAula/' \"></body>");
                    //out.print("<script>alert('Usuario o Contraseña incorrectos');");
                    //response.sendRedirect("#IS");
                    
                    //response.sendRedirect("#IS");
                }
                
            }else{
                //out.println("<script>alert('Error');</script>");
                response.sendRedirect("index.jsp");
            }
            
            
            
            
            
            
            
            
            
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet inicioSesionBD</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet inicioSesionBD at " + request.getContextPath() + "</h1>");
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
