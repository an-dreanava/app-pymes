/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Conexion;
import Modelo.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author AngieRiera
 */
public class PedidoDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean agregar(Pedido pedido) {
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        boolean estado = false;


        try {
            ps = conexion.prepareStatement("INSERT INTO PEDIDOS (RUT_CLIENTE, ID_PYME, ID_PRODUCTO, CANTIDAD, FECHA, TOTAL, ID_ESTADO_PEDIDO) VALUES (?,?,?,?,?,?,?)");
            ps.setString(1, pedido.getRutCliente());
            ps.setInt(2, pedido.getIdPyme());
            ps.setInt(3, pedido.getProducto());
            ps.setInt(4, pedido.getCantidad());
            ps.setString(5, pedido.getFecha());
            ps.setInt(6, pedido.getTotal());
            ps.setInt(7, pedido.getEstado());            

            int resultado = ps.executeUpdate();

            conexion.close();
            estado = true;

        } catch (Exception ex) {
            System.err.println("Error, " + ex);
            estado = false;
        }
        return estado;
    }

}
