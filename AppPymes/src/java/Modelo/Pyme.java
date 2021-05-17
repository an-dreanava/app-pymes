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
    private String categoria;
    private String direccion;
    private int Comuna;
    private String estado;

    public Pyme(int id, String nombre, String apellido, String rut, String nombrePyme, String correo, String contraseña, String telefono, String categoria, String direccion, int Comuna, String estado) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.rut = rut;
        this.nombrePyme = nombrePyme;
        this.correo = correo;
        this.contraseña = contraseña;
        this.telefono = telefono;
        this.categoria = categoria;
        this.direccion = direccion;
        this.Comuna = Comuna;
        this.estado = estado;
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

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getComuna() {
        return Comuna;
    }

    public void setComuna(int Comuna) {
        this.Comuna = Comuna;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Pyme{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", rut=" + rut + ", nombrePyme=" + nombrePyme + ", correo=" + correo + ", contrase\u00f1a=" + contraseña + ", telefono=" + telefono + ", categoria=" + categoria + ", direccion=" + direccion + ", Comuna=" + Comuna + ", estado=" + estado + '}';
    }

    
    
    
    
}
