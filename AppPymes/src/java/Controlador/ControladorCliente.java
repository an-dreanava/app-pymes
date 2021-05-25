/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Dao.ClienteDAO;
import Modelo.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *Controlador que gestiona los métodos y redireccionamientos de las vistas del
 * cliente.
 * @author AngieRiera
 */
public class ControladorCliente extends HttpServlet {

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

        String opcion = request.getParameter("opcion");

        String rut = request.getParameter("rut");
        String nombres = request.getParameter("nombres");
        String apellido = request.getParameter("apellidos");
        int comuna = Integer.parseInt(request.getParameter("comuna"));
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");

        if (opcion.equals("Registrar")) {
            String clave = request.getParameter("clave");

            Cliente cliente = new Cliente(rut, nombres, apellido, correo, clave, telefono, direccion, comuna);

            ClienteDAO clienteDAO = new ClienteDAO();
            if (clienteDAO.agregar(cliente) == true) {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Registro correcto&mensaje=Se ha registrado correctamente, verifique su correo electronico e inicie sesion&boton=Volver&retorno=Index.jsp");
                System.out.println("Agregado");
            } else {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Error al registrar&mensaje=El correo ingresado ya posee una cuenta, inicie sesion o recupere clave&boton=Volver&retorno=Index.jsp");
            }
        }

        if (opcion.equals("Actualizar")) {
            Cliente cliente = new Cliente(rut, nombres, apellido, correo, "0", telefono, direccion, comuna);
            System.out.println(rut + nombres + apellido + correo + telefono + direccion + comuna);
            ClienteDAO clienteDAO = new ClienteDAO();
            if (clienteDAO.modificar(cliente) == true) {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Datos Actualizados&mensaje=Se han actualizado correctamente los datos&boton=Volver&retorno=DetallesCuenta.jsp");
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("usuario", cliente);
            } else {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Error al actualizar&mensaje=No se ha podido actualizar los datos, por favor intente de nuevo&boton=Volver&retorno=DetallesCuenta.jsp");
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("usuario", cliente);
            }
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorCliente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorCliente at " + request.getContextPath() + "</h1>");
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
