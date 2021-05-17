/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Comuna;
import Modelo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author drean
 */
public class DireccionDAO {
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection con;
    
//    public DireccionDAO (Connection con) {
//        this.con = con;
//    }
    //OBTENER REGIONES
    public ArrayList<Region> RegionxI(){
        ArrayList<Region> regiones = new ArrayList();
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT * FROM region");
            rs = ps.executeQuery();

            while (rs.next()) {
                int id=rs.getInt("id");
                String nombre=rs.getString("descripcion");
                //regiones.add(new Region(id,nombre));               
            }
            conexion.close();                     
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
        }       
        return regiones;
    }
        /*//OBTENER CIUDADES
        public ArrayList<Ciudad> CiudadxR(String id_region){
        ArrayList<Ciudad> ciudades = new ArrayList();
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT * FROM ciudad WHERE id_region=?");
            ps.setString(1, id_region);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id=rs.getInt("id");
                String nombre=rs.getString("descripcion");
                int region=rs.getInt("id_region");
                ciudades.add(new Ciudad(id,region,nombre));         
            }
            conexion.close();                     
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
        }       
        return ciudades;
    }*/
    
         public ArrayList<Comuna> ComunaxR(int id_region){
        ArrayList<Comuna> comunas = new ArrayList();
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT co.id, co.descripcion, ci.id, r.id\n" +
                                           "FROM comuna co\n" +
                                           "INNER JOIN ciudad ci ON co.id_ciudad = ci.id\n" +
                                           "INNER JOIN region r ON r.id = ci.id_region\n" +
                                           "WHERE r.id =?");
            ps.setInt(1, id_region);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id=rs.getInt(1);
                int id_ciudad=rs.getInt("3");
                int region=rs.getInt("4");
                String nombre=rs.getString(2);
                comunas.add(new Comuna(id,id_ciudad,region,nombre));         
            }
            conexion.close();                     
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
        }       
        return comunas;
    }
}
