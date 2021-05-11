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
public class Productos {
    private int id;
    private String titulo;
    private String descripcion;
    private String foto;
    private int precio;
    private int stock;
    private String nombrePyme;
    private String categoria;

    public Productos(int id, String titulo, String descripcion, String foto, int precio, int stock, String nombrePyme, String categoria) {
        this.id = id;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.foto = foto;
        this.precio = precio;
        this.stock = stock;
        this.nombrePyme = nombrePyme;
        this.categoria = categoria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getNombrePyme() {
        return nombrePyme;
    }

    public void setNombrePyme(String nombrePyme) {
        this.nombrePyme = nombrePyme;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    @Override
    public String toString() {
        return "Productos{" + "id=" + id + ", titulo=" + titulo + ", descripcion=" + descripcion + ", foto=" + foto + ", precio=" + precio + ", stock=" + stock + ", nombrePyme=" + nombrePyme + ", categoria=" + categoria + '}';
    }
    
    
}
