/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Modelo.Conexion;
import Modelo.Cliente;

/**
 * Clases que contiene los métodos que gestionan la inserción, modificación y
 * búsqueda del cliente
 * @author AngieRiera
 */
public class ClienteDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;

    /**
     * Método que inserta un cliente nuevo en la base de datos
     * @param cliente Cliente nuevo que se va a insertar en la base de datos
     * @return Confirmación de la inserción del cliente en la base de datos
     */
    public boolean agregar(Cliente cliente) {
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        boolean estado = false;

        try {
            ps = conexion.prepareStatement("CALL SP_AGREGAR_CLIENTE (?,?,?,?,?,?,?,?)");
            ps.setString(1, cliente.getRut());
            ps.setString(2, cliente.getNombre());
            ps.setString(3, cliente.getApellido());
            ps.setString(4, cliente.getTelefono());
            ps.setString(5, cliente.getCorreo());
            ps.setString(6, cliente.getContraseña());
            ps.setString(7, cliente.getDireccion());
            ps.setInt(8, cliente.getComuna());

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
     * Método que modifica los datos que de un cliente en la base de datos
     * @param cliente Cliente con los datos respectivamente modificados
     * @return Confirmación de la modificación en la base de datos
     */
    public boolean modificar(Cliente cliente) {
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        boolean estado = false;

        try {
            ps = conexion.prepareStatement("CALL SP_MODIFICAR_CLIENTE (?,?,?,?,?,?,?)");
            ps.setString(1, cliente.getRut());
            ps.setString(2, cliente.getNombre());
            ps.setString(3, cliente.getApellido());
            ps.setString(4, cliente.getTelefono());
            ps.setString(5, cliente.getCorreo());
            ps.setString(6, cliente.getDireccion());
            ps.setInt(7, cliente.getComuna());

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
     * Método que busca a un cliente en la base de datos a partir de su correo
     * electrónico y lo valida con la contraseña
     * @param cliente Cliente a buscar
     * @return Confirmación de la búsqueda exitosa
     */
    public boolean login(Cliente cliente) {
        Conexion con = new Conexion();
        com.mysql.jdbc.Connection conexion = con.getConnection();

        try {
            ps = conexion.prepareStatement("SELECT * FROM CLIENTE WHERE CORREO=?");
            ps.setString(1, cliente.getCorreo());
            rs = ps.executeQuery();

            if (rs.next()) {
                if (cliente.getContraseña().equals(rs.getString("CONTRASENA"))) {
                    cliente.setRut(rs.getString("RUT"));
                    cliente.setNombre(rs.getString("NOMBRES"));
                    cliente.setApellido(rs.getString("APELLIDOS"));
                    cliente.setTelefono(rs.getString("TELEFONO"));
                    cliente.setCorreo(rs.getString("CORREO"));
                    cliente.setContraseña(rs.getString("CONTRASENA"));
                    return true;
                } else {
                    return false;
                }

            }
            return false;
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
            return false;
        }
    }
}
