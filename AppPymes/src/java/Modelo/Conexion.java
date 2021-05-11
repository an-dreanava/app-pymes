/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;

/**
 *
 * @author AngieRiera
 */
public class Conexion {
        public static final String URL = "jdbc:mysql://localhost:3306/AppPymes";
    public static final String usuario = "root";
    public static final String contraseña = "";

    public Connection getConnection() {
        Connection conexion = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = (Connection) DriverManager.getConnection(URL, usuario, contraseña);
            System.out.println("Conectado a la base de datos");

        } catch (Exception ex) {
            System.err.println("Error" + ex);
        }

        return conexion;
    }
}
