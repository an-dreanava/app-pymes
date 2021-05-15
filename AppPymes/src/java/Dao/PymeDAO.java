/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Conexion;
import Modelo.Pyme;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author drean
 */
public class PymeDAO {
     PreparedStatement ps = null;
    ResultSet rs = null;
    
    private static ArrayList<String> regiones = new ArrayList<>();
    
       public ArrayList<String> Regiones(Pyme pyme) {
           
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT * FROM region");
            rs = ps.executeQuery();

            while (rs.next()) {
                regiones.add(rs.getString(1));
            }
            conexion.close();
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
        }
        return regiones;
    }
}
