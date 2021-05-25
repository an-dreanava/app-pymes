/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *Clase que hace referencia a los datos del cliente.
 * @author AngieRiera
 */
public class Cliente {
    private String rut;
    private String nombre;
    private String apellido;
    private String correo;
    private String contraseña;
    private String telefono;
    private String direccion;
    private int Comuna;

    /**
     *Constructor sin parámetros de cliente.
     */
    public Cliente() {
    }
    
    /**
     *Contructor de un nuevo cliente.
     * @param rut Documentación RUT del cliente.
     * @param nombre Nombre del cliente.
     * @param apellido Apellido del cliente.
     * @param correo Correo electrónico del cliente.
     * @param contraseña Contraseña para ingresar a la plataforma del cliente.
     * @param telefono Teléfono personal del cliente.
     * @param direccion Descripción (calle y número) de la dirección del cliente.
     * @param Comuna Identificador de la comuna donde reside el cliente. 
     */
    public Cliente(String rut, String nombre, String apellido, String correo, String contraseña, String telefono, String direccion, int Comuna) {
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.contraseña = contraseña;
        this.telefono = telefono;
        this.direccion = direccion;
        this.Comuna = Comuna;
    }

    /**
     *Accesador del número RUT del cliente.
     * @return Número RUT del cliente.
     */
    public String getRut() {
        return rut;
    }

    /**
     *Mutador del número RUT del cliente.
     * @param rut Número RUT editado a cambiar.
     */
    public void setRut(String rut) {
        this.rut = rut;
    }

    /**
     *Accesador del nombre del cliente.
     * @return Nombre del cliente.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     *Mutador del nombre del cliente.
     * @param nombre Nombre del cliente editado.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     *Acesador del apellido del cliente.
     * @return Apellido del cliente.
     */
    public String getApellido() {
        return apellido;
    }

    /**
     *Mutador del apellido del cliente.
     * @param apellido Apellido del cliente modificado a cambiar.
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     *Accesador correo electrónico del cliente.
     * @return Correo electrónico del cliente.
     */
    public String getCorreo() {
        return correo;
    }

    /**
     *Mutador del correo electrónico.
     * @param correo Correo electrónico editado.
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     *Accesador de la contraseña del cliente.
     * @return Contraseña del cliente.
     */
    public String getContraseña() {
        return contraseña;
    }

    /**
     *Mutador de la contraseña del cliente.
     * @param contraseña Contraseña del cliente modificada a cambiar.
     */
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    /**
     *Accesador número de teléfono del cliente.
     * @return Teléfono del cliente.
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     *Mutador número de teléfono del cliente.
     * @param telefono Número del teléfono modificado a cambiar.
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     *Accesador dirección del cliente.
     * @return 
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     *Mutador dirección del cliente.
     * @param direccion Dirección editada del cliente.
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     *Accesador del identificador de la comuna.
     * @return
     */
    public int getComuna() {
        return Comuna;
    }

    /**
     *Mutador del identificador de la comuna.
     * @param Comuna Identificador de la comuna editado.
     */
    public void setComuna(int Comuna) {
        this.Comuna = Comuna;
    }

    @Override
    public String toString() {
        return "Cliente{" + "rut=" + rut + ", nombre=" + nombre + ", apellido=" + apellido + ", correo=" + correo + ", contrase\u00f1a=" + contraseña + ", telefono=" + telefono + ", direccion=" + direccion + ", Comuna=" + Comuna + '}';
    }
    
    
    
}

