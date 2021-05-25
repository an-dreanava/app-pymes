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
 *Clase que contiene los métodos que gestionan el registro y cambio de
 * estado de los pedidos
 * @author AngieRiera
 */
public class PedidoDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;

    /**
     * Método que registra un pedido en la base de datos
     * @param pedido Pedido nuevo a ser ingresado
     * @return Confirmación de la inserción del pedido en la base de datos
     */
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
    
    /**
     * Método que cambia el estado en el que se encuentra el proceso del pedido
     * @param id Identificador de la boleta del pedido
     * @param estado_pedido Estado en el que se encuentra el pedido actualmente
     * @return Confirmación del cambio del estado en la base de datos
     */
    public boolean cambiarEstado(int id, int estado_pedido){
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        boolean estado = false;
        
        try {
            ps = conexion.prepareStatement("UPDATE PEDIDOS SET ID_ESTADO_PEDIDO = ? WHERE BOLETA = ?");
            ps.setInt(1, estado_pedido);
            ps.setInt(2, id);           

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
