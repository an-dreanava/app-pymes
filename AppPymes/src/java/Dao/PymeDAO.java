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
 *
 * @author drean
 */
public class PymeDAO {
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection con;
    
       public boolean AgregarPyme(Pyme pyme) {
        int i = 0;
        boolean estado = false;
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        PymeDAO dao=new PymeDAO();
        if (conexion != null) {
            try {                
                Statement st = conexion.createStatement();
                String query = "INSERT INTO pyme (nombres,apellidos,rut, nombre_pyme,correo,contrasena,telefono,id_categoria_pyme,id_direccion,id_estado,                                 logo)VALUES('"+pyme.getNombre()+"','"+pyme.getApellido()+"','"+pyme.getRut()+"','"+pyme.getCorreo()+"','"+pyme.getContraseña()+"','"+pyme.getTelefono()+"','"+pyme.getCategoria()+"','"+dao.Id_Direccion(pyme)+"',2,'"+pyme.getLogo()+"')";
               
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
       
        public int Id_Direccion(Pyme pyme) {
        int id_direccion = 0;
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT MAX(id) FROM direccion");
            rs = ps.executeQuery();

            while (rs.next()) {
                id_direccion=rs.getInt(1);        
            }
            conexion.close();                     
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
        }       
        
         try {                
                Statement st = conexion.createStatement();
                String query = "INSERT INTO direccion (id,descripcion,id_comuna)VALUES('"+id_direccion+"','"+pyme.getDes_direccion()+"','"+pyme.getId_comuna()+"')";
               
                st.executeUpdate(query);
            } catch (Exception e) {
                System.out.println("ERROR PymeDAO AgregarPyme:" + e.getMessage());
            }
        
        return id_direccion;
    }
        
        public ArrayList<Categoria> Categoria() {
        ArrayList<Categoria> categorias = new ArrayList();
        Conexion con = new Conexion();
        Connection conexion = con.getConnection();
        try {
            ps = conexion.prepareStatement("SELECT * FROM categoria_pyme");
            rs = ps.executeQuery();
            while (rs.next()) {
                int id_categoria=rs.getInt(1);        
                String descripcion=rs.getString(2);   
                categorias.add(new Categoria(id_categoria,descripcion));
            }           
            conexion.close();      
        } catch (Exception ex) {
            System.err.println("Error, " + ex);
        }       
        return categorias;
       }
}
