/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Dao.ProductoDAO;
import Modelo.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AngieRiera
 */
public class ControladorProductos extends HttpServlet {

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

        ProductoDAO dao = new ProductoDAO();
        String titulo, descripcion, foto = "";
        int id, id_categoria, precio, stock, id_pyme = 0;

        titulo = request.getParameter("titulo");
        
        id_categoria = Integer.parseInt(request.getParameter("id_categoria"));
        precio = Integer.parseInt(request.getParameter("precio"));
        stock = Integer.parseInt(request.getParameter("stock"));
        id_pyme = Integer.parseInt(request.getParameter("id_pyme"));
        descripcion = request.getParameter("descripcion");
        foto = request.getParameter("foto");

        if (opcion.equals("Agregar")) {
            Productos producto = new Productos(0, titulo, descripcion, foto, precio, stock, id_pyme, id_categoria);

            if (dao.agregar(producto) == true) {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Agregado&mensaje=Producto agregado correctamente&boton=Aceptar&retorno=MenuPyme.jsp");
            } else {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Error&mensaje=No se ha agregado correctamente el producto&boton=Aceptar&retorno=MenuPyme.jsp");
            }

        }

        if (opcion.equals("Actualizar")) {            
            id = Integer.parseInt(request.getParameter("id_producto"));
            
            Productos producto = new Productos(id, titulo, descripcion, foto, precio, stock, id_pyme, id_categoria);
            System.out.println("entro actualizar");
            if (dao.actualizar(producto) == true) {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Actualizado&mensaje=Se han actualizado correctamente los datos del producto&boton=Aceptar&retorno=MenuPyme.jsp");
            } else {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Error&mensaje=No se han actualizado correctamente los datos del producto&boton=Aceptar&retorno=MenuPyme.jsp");
            }
        }
        
        if (opcion.equals("Eliminar")) {
            id = Integer.parseInt(request.getParameter("id_producto"));
            
            if (dao.eliminar(id) == true) {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Eliminado&mensaje=Se ha eliminado correctamente el producto&boton=Aceptar&retorno=MenuPyme.jsp");
            } else {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Error&mensaje=No se ha eliminadoel producto&boton=Aceptar&retorno=MenuPyme.jsp");
            }

        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorProductos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorProductos at " + request.getContextPath() + "</h1>");
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
