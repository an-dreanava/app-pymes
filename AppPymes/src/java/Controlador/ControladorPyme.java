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
        
        String rut,nombre_pyme,nombre,apellido,des_direccion,telefono,correo,contrasena,opcion="";
        int id_region=0,id_comuna=0,id_categoria=0;
        
        rut = request.getParameter("rut");
        nombre_pyme = request.getParameter("nombre_pyme");
        nombre = request.getParameter("nombre");
        apellido = request.getParameter("apellido");
        id_region = Integer.parseInt(request.getParameter("id_region"));
        id_comuna = Integer.parseInt(request.getParameter("id_comuna"));
        des_direccion = request.getParameter("des_direccion");
        telefono = request.getParameter("telefono");
        correo = request.getParameter("correo");
        contrasena = request.getParameter("contrasena");
        id_categoria = Integer.parseInt(request.getParameter("id_categoria"));
        opcion = request.getParameter("opcion");
        
        if(opcion.equals("Agregar")){
            try{
                Pyme pyme=new Pyme(0,nombre,apellido,rut,nombre_pyme,correo,contrasena,telefono,id_categoria,0,2," ");           
            PymeDAO PymeDAO=new PymeDAO();
            if(PymeDAO.AgregarPyme(pyme, des_direccion, id_comuna)==true){
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Solicitud Ingresada&mensaje=Sus datos han sido recepcionados con exito,en cuanto la validacion este completada podra iniciar sesion sin problemas.&boton=Aceptar&retorno=IndexPyme.jsp");
            }else{
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Solicitud NO Ingresada&mensaje=Sus datos NO han sido recepcionados con exito,vuelva a intentarlo.&boton=Aceptar&retorno=IndexPyme.jsp");
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
