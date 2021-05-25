/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *Esta clase hace referencia a las categorias de los clientes y/o pymes en
 *la plataforma
 * @author drean
 */
public class Categoria {
    private int id_categoria;
    private String descripcion;

    /**
     *Constructor de la categoria.
     * @param id_categoria Identificador de la categoria
     * @param descripcion Definición de la categoria
     */
    public Categoria(int id_categoria, String descripcion) {
        this.id_categoria = id_categoria;
        this.descripcion = descripcion;
    }

    /**
     *Accesador del Identificador de la categoría.
     * @return Accesador al identificador de la categoria.
     */
    public int getId_categoria() {
        return id_categoria;
    }

    /**
     * Mutador del identificador de la categoria.
     * @param id_categoria Identificador editado a cambiar.
     */
    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    /**
     *Accsesador de la definición de la categoría.
     * @return Accesador a la definición de la categoria.
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * Mutador a la definición de la categoria.
     * @param descripcion Descripción editada a cambiar.
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
