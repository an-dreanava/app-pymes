/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Categoria;
import Modelo.Conexion;
import Modelo.Productos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *Clase que contiene los métodos de gestionamiento de los productos.
 * @author AngieRiera
 */
public class ProductoDAO {
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection con;
    
    /**
     * Método que recolecta las categorías de los productos
     * @return Colección de las categorías de los productos
     */
    public ArrayList<Categoria> Categoria() {
        ArrayList<Categoria> categorias = new ArrayList();
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT * FROM categoria_producto");
            rs = ps.executeQuery();
            while (rs.next()) {
                int id_categoria = rs.getInt(1);
                String descripcion = rs.getString(2);
                categorias.add(new Categoria(id_categoria, descripcion));
            }
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
        }
        return categorias;
    }
    
    /**
     *Método para insertar un producto en la base de datos.
     * @param producto Producto que se va a insertar
     * @return Confirmación de la inserción en la base de datos.
     */
    public boolean agregar(Productos producto) {
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        boolean estado = false;

        try {
            ps = conexion.prepareStatement("INSERT INTO PRODUCTOS (TITULO, DESCRIPCION, FOTO, PRECIO, STOCK, ID_PYME, ID_CATEGORIA_PRODUCTO) VALUES (?,?,?,?,?,?,?)");
            ps.setString(1, producto.getTitulo());
            ps.setString(2, producto.getDescripcion());
            ps.setString(3, producto.getFoto());
            ps.setInt(4, producto.getPrecio());
            ps.setInt(5, producto.getStock());
            ps.setInt(6, producto.getPyme());
            ps.setInt(7, producto.getCategoria());            

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
     *Método para modificar los datos del producto en la base de datos
     * @param producto Producto con los respectivos campos modificados
     * @return Confirmación de la modificación del producto
     */
    public boolean actualizar(Productos producto) {
        Conexion con = new Conexion();
        com.mysql.jdbc.Connection conexion = con.getConnection();

        try {
            ps = conexion.prepareStatement("UPDATE PRODUCTOS SET TITULO=?, DESCRIPCION=?, FOTO=?, PRECIO=?, STOCK=?, ID_CATEGORIA_PRODUCTO=? WHERE ID=?");
            ps.setString(1, producto.getTitulo());
            ps.setString(2, producto.getDescripcion());
            ps.setString(3, producto.getFoto());
            ps.setInt(4, producto.getPrecio());
            ps.setInt(5, producto.getStock());
            ps.setInt(6, producto.getCategoria());
            ps.setInt(7, producto.getId());

            int r = ps.executeUpdate();

            if (r > 0) {
                return true;
            } else {
                return false;
            }

        } catch (Exception ex) {
            System.err.println("Error, " + ex);
            return false;
        } finally {
            try {
                conexion.close();
            } catch (Exception ex) {
                System.err.println("Error, " + ex);
            }
        }
    }
     
    /**
     * Método para eliminar un producto de la base de datos
     * @param id Identificador del producto que se va a eliminar
     * @return Confirmación de la eliminación del producto
     */
    public boolean eliminar(int id) {
        Conexion con = new Conexion();
        com.mysql.jdbc.Connection conexion = con.getConnection();

        try {
            ps = conexion.prepareStatement("DELETE FROM PRODUCTOS WHERE ID=?");
            ps.setInt(1, id);

            int r = ps.executeUpdate();

            if (r > 0) {
                return true;
            } else {
                return false;
            }

        } catch (Exception ex) {
            System.err.println("Error, " + ex);
            return false;
        } finally {
            try {
                conexion.close();
            } catch (Exception ex) {
                System.err.println("Error, " + ex);
            }
        }
    }
     
    /**
     * Método que extrae la descripción o nombre de la categoría a la cual 
     * pertenece el producto
     * @param id_categoria Identificador de la categoria que se buscará
     * @return Descripción de la categoría
     */
    public String Des_Categoria(int id_categoria){
        String des_categoria="";
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT descripcion FROM categoria_producto WHERE id=?");
            ps.setInt(1,id_categoria);
            rs = ps.executeQuery();
            while (rs.next()) {
                des_categoria= rs.getString(1);
            }
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
        }
        return des_categoria;
    }
}
