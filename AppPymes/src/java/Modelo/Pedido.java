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
public class Pedido {
    private int boleta;
    private String rutCliente;
    private int idPyme;
    private int producto;
    private int cantidad;
    private String fecha;
    private int total;
    private String estado;

    public Pedido(int boleta, String rutCliente, int idPyme, int producto, int cantidad, String fecha, int total, String estado) {
        this.boleta = boleta;
        this.rutCliente = rutCliente;
        this.idPyme = idPyme;
        this.producto = producto;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.total = total;
        this.estado = estado;
    }

    public int getBoleta() {
        return boleta;
    }

    public void setBoleta(int boleta) {
        this.boleta = boleta;
    }

    public String getRutCliente() {
        return rutCliente;
    }

    public void setRutCliente(String rutCliente) {
        this.rutCliente = rutCliente;
    }

    public int getIdPyme() {
        return idPyme;
    }

    public void setIdPyme(int idPyme) {
        this.idPyme = idPyme;
    }

    public int getProducto() {
        return producto;
    }

    public void setProducto(int producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Pedido{" + "boleta=" + boleta + ", rutCliente=" + rutCliente + ", idPyme=" + idPyme + ", producto=" + producto + ", cantidad=" + cantidad + ", fecha=" + fecha + ", total=" + total + ", estado=" + estado + '}';
    }
    
    
}
