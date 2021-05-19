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

/**
 *
 * @author drean
 */
public class ControladorPyme extends HttpServlet {

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
        
        String rut = request.getParameter("rut");
        String nombre_pyme = request.getParameter("nombre_pyme");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        int id_region = Integer.parseInt(request.getParameter("id_region"));
        int id_comuna = Integer.parseInt(request.getParameter("id_comuna"));
        String des_direccion = request.getParameter("des_direccion");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
         String id_categoria = request.getParameter("id_categoria");
        String opcion = request.getParameter("opcion");
        
        if(opcion.equals("Agregar")){
            try{
                Pyme pyme=new Pyme(0,nombre,apellido,rut,nombre_pyme,correo,contrasena,telefono,id_categoria,des_direccion,id_comuna,id_region,0,2," ");
            
            PymeDAO PymeDAO=new PymeDAO();
            if(PymeDAO.AgregarPyme(pyme)==true){
                response.sendRedirect("#modall");
            }
            
            }catch(Exception e){
                 System.out.println("ERROR ControladorPyme AgregarPyme:" + e.getMessage());
            }
            
        }
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorPyme</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorPyme at " + request.
                    getContextPath() + "</h1>");
             /*out.println("<h1> RUT:"+rut+"</h1>");
             out.println("<h1> NOMBRE PYMES:"+nombre_pyme+"</h1>");
             out.println("<h1> APELLIDO:"+apellido+"</h1>");
             out.println("<h1> REGION:"+region+"</h1>");
             out.println("<h1> COMUNA:"+comuna+"</h1>");
             out.println("<h1>DIRECCION:"+direccion+"</h1>");
             out.println("<h1>TELEFONO:"+telefono+"</h1>");
             out.println("<h1>CORREO:"+correo+"</h1>");
             out.println("<h1>CONTRASEÑA:"+contraseña+"</h1>");*/
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
