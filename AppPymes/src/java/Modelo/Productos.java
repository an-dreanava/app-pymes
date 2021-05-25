/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *Clase que hace referencia a cada producto de venta de la pyme
 * @author AngieRiera
 */
public class Productos {
    private int id;
    private String titulo;
    private String descripcion;
    private String foto;
    private int precio;
    private int stock;
    private int pyme;
    private int categoria;

    /**
     *Constructor del producto
     * @param id Identificador del producto de la pyme
     * @param titulo Nombre del producto de la pyme
     * @param descripcion Descripción del producto de la pyme
     * @param foto Foto del producto de la pyme
     * @param precio Precio de venta del producto de la pyme
     * @param stock Stock del producto de la pyme
     * @param pyme Identificador de la pyme a la cual pertenece el producto
     * @param categoria Categoria a la cual pertenece el producto
     */
    public Productos(int id, String titulo, String descripcion, String foto, int precio, int stock, int pyme, int categoria) {
        this.id = id;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.foto = foto;
        this.precio = precio;
        this.stock = stock;
        this.pyme = pyme;
        this.categoria = categoria;
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
    public String getTitulo() {
        return titulo;
    }

    /**
     *
     * @param titulo
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     *
     * @return
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     *
     * @param descripcion
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     *
     * @return
     */
    public String getFoto() {
        return foto;
    }

    /**
     *
     * @param foto
     */
    public void setFoto(String foto) {
        this.foto = foto;
    }

    /**
     *
     * @return
     */
    public int getPrecio() {
        return precio;
    }

    /**
     *
     * @param precio
     */
    public void setPrecio(int precio) {
        this.precio = precio;
    }

    /**
     *
     * @return
     */
    public int getStock() {
        return stock;
    }

    /**
     *
     * @param stock
     */
    public void setStock(int stock) {
        this.stock = stock;
    }

    /**
     *
     * @return
     */
    public int getPyme() {
        return pyme;
    }

    /**
     *
     * @param pyme
     */
    public void setPyme(int pyme) {
        this.pyme = pyme;
    }

    /**
     *
     * @return
     */
    public int getCategoria() {
        return categoria;
    }

    /**
     *
     * @param categoria
     */
    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    @Override
    public String toString() {
        return "Productos{" + "id=" + id + ", titulo=" + titulo + ", descripcion=" + descripcion + ", foto=" + foto + ", precio=" + precio + ", stock=" + stock + ", pyme=" + pyme + ", categoria=" + categoria + '}';
    }
    
    
}
