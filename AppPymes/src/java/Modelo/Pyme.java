/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 * Clase que hace referencia a los datos de la Pyme (tienda)
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
    private int id_direccion;
    private int estado;
    private String logo;

    /**
     * Constructor de una pyme
     * @param id Identificador de la pyme
     * @param nombre Nombre del dueño de la pyme
     * @param apellido Apellido del dueño de la pyme
     * @param rut Número de la documentación RUT del dueño de la pyme
     * @param nombrePyme Nombre de la pyme
     * @param correo Correo electrónico del dueño de la pyme
     * @param contraseña Contraseña para el ingreso a la plataforma de la pyme
     * @param telefono Telefono del dueño de la pyme
     * @param id_categoria Identificador de la categoria de la pyme
     * @param id_direccion Identificador de la dirección de la pyme
     * @param estado Estado activo o inactivo de la pyme en la plataforma
     * @param logo Imagen representativa de la pyme
     */
    public Pyme(int id, String nombre, String apellido, String rut,
            String nombrePyme, String correo, String contraseña, String telefono,
            int id_categoria, int id_direccion, int estado, String logo) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.rut = rut;
        this.nombrePyme = nombrePyme;
        this.correo = correo;
        this.contraseña = contraseña;
        this.telefono = telefono;
        this.id_categoria = id_categoria;
        this.id_direccion = id_direccion;
        this.estado = estado;
        this.logo = logo;
    }

    /**
     *
     * @return
     */
    public int getId() {
        return id;
    }

    /**
     *
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     *
     * @return
     */
    public String getNombre() {
        return nombre;
    }

    /**
     *
     * @param nombre
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     *
     * @return
     */
    public String getApellido() {
        return apellido;
    }

    /**
     *
     * @param apellido
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     *
     * @return
     */
    public String getRut() {
        return rut;
    }

    /**
     *
     * @param rut
     */
    public void setRut(String rut) {
        this.rut = rut;
    }

    /**
     *
     * @return
     */
    public String getNombrePyme() {
        return nombrePyme;
    }

    /**
     *
     * @param nombrePyme
     */
    public void setNombrePyme(String nombrePyme) {
        this.nombrePyme = nombrePyme;
    }

    /**
     *
     * @return
     */
    public String getCorreo() {
        return correo;
    }

    /**
     *
     * @param correo
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     *
     * @return
     */
    public String getContraseña() {
        return contraseña;
    }

    /**
     *
     * @param contraseña
     */
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    /**
     *
     * @return
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     *
     * @param telefono
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     *
     * @return
     */
    public int getId_categoria() {
        return id_categoria;
    }

    /**
     *
     * @param id_categoria
     */
    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    /**
     *
     * @return
     */
    public int getId_direccion() {
        return id_direccion;
    }

    /**
     *
     * @param id_direccion
     */
    public void setId_direccion(int id_direccion) {
        this.id_direccion = id_direccion;
    }

    /**
     *
     * @return
     */
    public int getEstado() {
        return estado;
    }

    /**
     *
     * @param estado
     */
    public void setEstado(int estado) {
        this.estado = estado;
    }

    /**
     *
     * @return
     */
    public String getLogo() {
        return logo;
    }

    /**
     *
     * @param logo
     */
    public void setLogo(String logo) {
        this.logo = logo;
    }

    @Override
    public String toString() {
        return "Pyme{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", rut=" + rut + ", nombrePyme=" + nombrePyme + ", correo=" + correo + ", contrase\u00f1a=" + contraseña + ", telefono=" + telefono + ", id_categoria=" + id_categoria + ", id_direccion=" + id_direccion + ", estado=" + estado + ", logo=" + logo + '}';
    }
}
