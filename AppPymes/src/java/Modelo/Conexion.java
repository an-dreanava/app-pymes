/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;

/**
 *Clase con la cual se realiza la conexión a la base de datos.
 * @author AngieRiera
 */
public class Conexion {

    /**
     *URL de la base de datos
     */
    public static final String URL = "jdbc:mysql://localhost:3306/apppymes";

    /**
     *Usuario de la base de datos
     */
    public static final String usuario = "root";

    /**
     *Contraseña del usuario de la base de datos
     */
    public static final String contraseña = "";

    /**
     *Método de conexión a la base de datos.
     * @return Conexión a la base de datos.
     */
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
