/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Comuna;
import Modelo.Conexion;
import Modelo.Region;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *Clase que contiene los métodos que extrae las regiones y comunas de la base
 * de datos
 * @author drean
 */
public class DireccionDAO {
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection con;
    
    /**
     * Método que extrae las regiones desde la base de datos
     * @return Colección con las regiones encontradas
     */
    public ArrayList<Region> Regiones(){
        ArrayList<Region> regiones = new ArrayList();
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT * FROM region");
            rs = ps.executeQuery();

            while (rs.next()) {
                int id=rs.getInt("id");
                String nombre=rs.getString("descripcion");
                regiones.add(new Region(id,nombre));               
            }
            conexion.close();                     
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
        }       
        return regiones;
    }   
         
    /**
     * Método que extrae las comunas desde la base de datos
     * @return Colección con las comunas encontradas
     */
    public ArrayList<Comuna> Comunas(){
        ArrayList<Comuna> comunas = new ArrayList();
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT * FROM comuna");
            rs = ps.executeQuery();

            while (rs.next()) {
                int id=rs.getInt(1);
                int id_ciudad=rs.getInt(3);
                int region=0;
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
