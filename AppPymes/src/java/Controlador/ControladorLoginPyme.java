/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Dao.PymeDAO;
import Modelo.Pyme;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *Controlador que gestiona los métodos y redireccionamientos de la validación
 * del acceso a la página como pyme (tienda).
 * @author drean
 */
public class ControladorLoginPyme extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PymeDAO PymeDAO = new PymeDAO();

        String correo = "";
        String clave = "";
        String opcion = "";

        opcion = request.getParameter("opcion");
        clave = request.getParameter("claveL");
        correo = request.getParameter("correoL");

        if (opcion.equals("Iniciar")) {

            HttpSession sesion = request.getSession(true);

            sesion.setAttribute("pyme", null);
            sesion.setAttribute("estadoSesion", "off");

            Pyme pyme = PymeDAO.login(correo, clave);

            if (pyme != (null)) {
                sesion.setAttribute("usuario", pyme);
                sesion.setAttribute("estadoSesion", "on");
                sesion.setAttribute("tipo", "2");
                response.sendRedirect("MenuPyme.jsp");
                System.out.println("pyme encontrada");
            }else{
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Acceso Denegado&mensaje=Sus datos NO han sido encontrados en nuestra base de datos, debe registrarse primero.&boton=Registrarse&retorno=RegistroPyme.jsp");
            }

        } 
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorLoginPyme</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorLoginPyme at " + request.
                    getContextPath() + "</h1>");
            out.println("CORREO:" + correo);
            out.println("CLAVE:" + clave);
            out.println("OPCION:" + opcion);
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
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
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
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
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
