/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author drean
 */
public class Region {
    int id;
    String name;
    
    /**
     * Referencia a la región de la dirección del cliente.
     * @param id Identificador de la región
     * @param name Nombre de la región
     */
    public Region(int id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * Accesador
     * @return
     */
    public int getId() {
        return id;
    }

    /**
     * Mutador
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Accesador
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     * Mutador
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Region{" + "id=" + id + ", name=" + name + '}';
    }
}
