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
 *
 * @author AngieRiera
 */
public class ClienteDAO {
    
    PreparedStatement ps = null;
    ResultSet rs = null;
    
       public boolean buscar(Cliente cliente) {
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT C.RUT, C.NOMBRES, C.APELLIDOS, C.TELEFONO,  "
                    + "C.CORREO, C.CONTRASEÑA, C.ID_DIRECCION, D. FROM CLIENTE C INNER JOIN DIRECCION D ON C.ID_DIRECCION=D.ID WHERE C.RUT=?");
            ps.setString(1, cliente.getRut());
            rs = ps.executeQuery();

            while (rs.next()) {
                cliente.setRut(rs.getString("RUT"));
                cliente.setNombre(rs.getString("NOMBRES"));
                cliente.setApellido(rs.getString("APELLIDOS"));
                cliente.setTelefono(rs.getString("TELEFONO"));
                cliente.setCorreo(rs.getString("CORREO"));
                cliente.setContraseña(rs.getString("CONTRASENA"));
                //cliente.setDireccion;
                ;
                return true;
            }
            conexion.close();
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
            return false;
        }
        return false;
    }
       
       public boolean agregar(Cliente cliente) {
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("INSERT INTO CLIENTE (RUT, NOMBRES, APELLIDOS, TELEFONO, CORREO, CONTRASEÑA) VALUES (?,?,?,?,?,?)");
            ps.setString(1, cliente.getRut());
            ps.setString(2, cliente.getNombre());
            ps.setString(3, cliente.getApellido());
            ps.setString(4, cliente.getTelefono());
            ps.setString(5, cliente.getCorreo());
            ps.setString(6, cliente.getContraseña());

            int resultado = ps.executeUpdate();
            
            return resultado > 0;

        } catch (Exception ex) {
            System.err.println("Error, " + ex);
            return false;
        }
    }
}
