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
public class Direccion {
    private String direccion;
    private int comuna;
    private int ciudad;
    private int region;

    public Direccion(String direccion, int comuna, int ciudad, int region) {
        this.direccion = direccion;
        this.comuna = comuna;
        this.ciudad = ciudad;
        this.region = region;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getComuna() {
        return comuna;
    }

    public void setComuna(int comuna) {
        this.comuna = comuna;
    }

    public int getCiudad() {
        return ciudad;
    }

    public void setCiudad(int ciudad) {
        this.ciudad = ciudad;
    }

    public int getRegion() {
        return region;
    }

    public void setRegion(int region) {
        this.region = region;
    }

    @Override
    public String toString() {
        return "Direccion{" + "direccion=" + direccion + ", comuna=" + comuna + ", ciudad=" + ciudad + ", region=" + region + '}';
    }
    
    
}
