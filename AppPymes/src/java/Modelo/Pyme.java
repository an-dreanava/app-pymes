/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author AngieRiera
 */
public class Pyme {
    private int id;
    private String nombre;
    private String apellido;
    private String rut;
    private String nombrePyme;
    private String correo;
    private String contraseña;
    private String telefono;
    private int id_categoria;
    private String des_direccion;
    private int id_comuna;
    private int id_region;
    private int id_direccion;
    private int estado;
    private String logo;

    public Pyme(int id, String nombre, String apellido, String rut,
            String nombrePyme, String correo, String contraseña, String telefono,
            int id_categoria, String des_direccion, int id_comuna, int id_region,
            int id_direccion, int estado, String logo) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.rut = rut;
        this.nombrePyme = nombrePyme;
        this.correo = correo;
        this.contraseña = contraseña;
        this.telefono = telefono;
        this.id_categoria = id_categoria;
        this.des_direccion = des_direccion;
        this.id_comuna = id_comuna;
        this.id_region = id_region;
        this.id_direccion = id_direccion;
        this.estado = estado;
        this.logo = logo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombrePyme() {
        return nombrePyme;
    }

    public void setNombrePyme(String nombrePyme) {
        this.nombrePyme = nombrePyme;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getDes_direccion() {
        return des_direccion;
    }

    public void setDes_direccion(String des_direccion) {
        this.des_direccion = des_direccion;
    }

    public int getId_comuna() {
        return id_comuna;
    }

    public void setId_comuna(int id_comuna) {
        this.id_comuna = id_comuna;
    }

    public int getId_region() {
        return id_region;
    }

    public void setId_region(int id_region) {
        this.id_region = id_region;
    }

    public int getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(int id_direccion) {
        this.id_direccion = id_direccion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
    @Override
    public String toString() {
        return "Pyme{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", rut=" + rut + ", nombrePyme=" + nombrePyme + ", correo=" + correo + ", contrase\u00f1a=" + contraseña + ", telefono=" + telefono + ", id_categoria=" + id_categoria + ", des_direccion=" + des_direccion + ", id_comuna=" + id_comuna + ", id_region=" + id_region + ", id_direccion=" + id_direccion + ", estado=" + estado + ", logo=" + logo + '}';
    }
}
