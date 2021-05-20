/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Dao.PedidoDAO;
import Modelo.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AngieRiera
 */
public class ControladorPedido extends HttpServlet {

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

        if (opcion.equals("Confirmar")) {
            String cliente = request.getParameter("cliente");
            int pyme = Integer.parseInt(request.getParameter("pyme"));
            int producto = Integer.parseInt(request.getParameter("producto"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad-oculta"));
            int total = Integer.parseInt(request.getParameter("total-oculto"));

            java.util.Date date = new Date();
            SimpleDateFormat formateador = new SimpleDateFormat("hh:mm a");
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String fecha = dateFormat.format(date) + " " + formateador.format(date);
            System.out.println(cliente + pyme + producto + "1" + fecha + "2000");
            Pedido pedido = new Pedido(cliente, pyme, producto, cantidad, fecha, total, 1);
            PedidoDAO pedidoDAO = new PedidoDAO();
            
            if (pedidoDAO.agregar(pedido) == true) {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Solicitud de compra recibidad&mensaje=Se ha registrado correctamente, verifique su correo electronico e inicie sesion&boton=Volver&retorno=Index.jsp");
                System.out.println("Agregado");
            } else {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Error al comprar&mensaje=El correo ingresado ya posee una cuenta, inicie sesion o recupere clave&boton=Volver&retorno=Index.jsp");
            }
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorPedido</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorPedido at " + request.getContextPath() + "</h1>");
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
