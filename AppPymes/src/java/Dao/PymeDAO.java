/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Categoria;
import Modelo.Conexion;
import Modelo.Pyme;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


/**
 * Clase que contiene los métodos con los cuales se gestionan los datos de Pymes.
 * @author drean
 */
public class PymeDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection con;

    /**
     *Método para agregar una pyme a la base de datos
     * @param pyme Objeto Pyme
     * @param des_direccion Descripción de la dirección (calle y número)
     * @param id_comuna Identificador de la comuna de la dirección
     * @return Confirmación de la inserción de la pyme en la base de datos
     */
    public boolean AgregarPyme(Pyme pyme, String des_direccion, int id_comuna) {
        int i = 0;
        boolean estado = false;
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        PymeDAO dao = new PymeDAO();
        
        
        if (conexion != null) {
            try {
                Statement st = conexion.createStatement();
                String query = "INSERT INTO pyme (nombres,apellidos,rut, nombre_pyme,correo,contrasena,telefono,id_categoria_pyme,id_direccion,id_estado,logo)VALUES('" + pyme.getNombre() + "','" + pyme.getApellido() + "','" + pyme.getRut() + "','" + pyme.getNombrePyme() + "','" + pyme.getCorreo() + "','" + pyme.getContraseña() + "','" + pyme.getTelefono() + "','" + pyme.getId_categoria() + "','" + dao.Id_Direccion(des_direccion, id_comuna) + "',2,'" + pyme.getLogo() + "')";

                int filas = st.executeUpdate(query);
                if (filas > 0) {
                    estado = true; //agregado
                }
            } catch (Exception e) {
                System.out.println("ERROR PymeDAO AgregarPyme:" + e.getMessage());
            }
        }
        return estado;
    }

    /**
     *Método que genera el identificador de la nueva dirección a agregar y
     *posteriormente inserta los datos en la tabla dirección
     * @param des_direccion Descripción de la dirección (calle y número)
     * @param id_comuna Identificador de la comuna de la dirección
     * @return Identificador de la nueva dirección agregada.
     */
    public int Id_Direccion(String des_direccion, int id_comuna) {
        int id_direccion = 0;
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT MAX(id) FROM direccion");
            rs = ps.executeQuery();

            while (rs.next()) {
                id_direccion = (rs.getInt(1) + 1);
            }
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
        }

        try {
            Statement st = conexion.createStatement();
            String query = "INSERT INTO direccion (id,descripcion,id_comuna)VALUES('" + id_direccion + "','" + des_direccion + "','" + id_comuna + "')";

            st.executeUpdate(query);
        } catch (Exception e) {
            System.out.println("ERROR PymeDAO Id_Direccion:" + e.getMessage() + id_direccion);
        }

        return (id_direccion);
    }

    /**
     *Método que busca la pyme a partir del correo electrónico y la contraseña
     * de ingreso a la plataforma
     * @param correo Correo electrónico de la pyme
     * @param contrasena Contraseña de la pyme
     * @return Pyme encontrada
     */
    public Pyme login(String correo, String contrasena) {
        Conexion con = new Conexion();
        com.mysql.jdbc.Connection conexion = con.getConnection();
        Pyme pyme = null;

        try {
            ps = conexion.prepareStatement("SELECT * FROM pyme WHERE correo=? AND contrasena=?");
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id_pyme = rs.getInt(1);
                String nombre = rs.getString(2);
                String apellido = rs.getString(3);
                String rut = rs.getString(4);
                String nombre_pyme = rs.getString(5);
                String telefono = rs.getString(8);
                int id_categoria = rs.getInt(9);
                int id_direccion = rs.getInt(10);
                int id_estado = rs.getInt(11);
                String logo = rs.getString(12);
                pyme = new Pyme(0, nombre, apellido, rut, nombre_pyme, correo, contrasena, telefono, id_categoria, id_direccion, id_estado, logo);
            }
        } catch (Exception ex) {
            System.err.println("Error LOGIN PYMEDAO, " + ex);
        }
        return pyme;
    }

    /**
     *Método que recolecta todas las categorías de las pymes
     * @return Colección de categorías de pymes
     */
    public ArrayList<Categoria> Categoria() {
        ArrayList<Categoria> categorias = new ArrayList();
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT * FROM categoria_pyme");
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
}
