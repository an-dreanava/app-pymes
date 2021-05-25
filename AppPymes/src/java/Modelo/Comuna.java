/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *Clase que hace referencia a la comuna de las direcciones de los usuarios.
 * @author drean
 */
public class Comuna {
     int id;
    int id_ciudad;
    int id_pais;
    String name;
    
    /**
     *Constructor de la comuna
     * @param id Identificador de la comuna
     * @param id_ciudad Identificador de la ciudad de la comuna
     * @param id_pais Identificador de la region de la comuna
     * @param name Nombre de la comuna
     */
    public Comuna(int id, int id_ciudad, int id_pais, String name) {
        this.id = id;
        this.id_ciudad = id_ciudad;
        this.id_pais = id_pais;
        this.name = name;
    }

    /**
     *Accesador
     * @return
     */
    public int getId() {
        return id;
    }

    /**
     *Mutador
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     *Accesador
     * @return
     */
    public int getId_ciudad() {
        return id_ciudad;
    }

    /**
     * Mutador
     * @param id_ciudad
     */
    public void setId_ciudad(int id_ciudad) {
        this.id_ciudad = id_ciudad;
    }

    /**
     *Accesador
     * @return
     */
    public int getId_pais() {
        return id_pais;
    }

    /**
     * Mutador
     * @param id_pais
     */
    public void setId_pais(int id_pais) {
        this.id_pais = id_pais;
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
        return "Comuna{" + "id=" + id + ", id_ciudad=" + id_ciudad + ", id_pais=" + id_pais + ", name=" + name + '}';
    }
    
}
