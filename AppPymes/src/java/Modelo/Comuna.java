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
public class Comuna {
     int id;
    int id_ciudad;
    int id_pais;
    String name;
    
    public Comuna(int id, int id_ciudad, int id_pais, String name) {
        this.id = id;
        this.id_ciudad = id_ciudad;
        this.id_pais = id_pais;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_ciudad() {
        return id_ciudad;
    }

    public void setId_ciudad(int id_ciudad) {
        this.id_ciudad = id_ciudad;
    }

    public int getId_pais() {
        return id_pais;
    }

    public void setId_pais(int id_pais) {
        this.id_pais = id_pais;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Comuna{" + "id=" + id + ", id_ciudad=" + id_ciudad + ", id_pais=" + id_pais + ", name=" + name + '}';
    }
    
}
