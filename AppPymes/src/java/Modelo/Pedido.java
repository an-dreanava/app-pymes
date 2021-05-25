/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 * Clase que hace referencia a los pedidos que existen entre cliente y pyme 
 * (tienda).
 * @author AngieRiera
 */
public class Pedido {
    private String rutCliente;
    private int idPyme;
    private int producto;
    private int cantidad;
    private String fecha;
    private int total;
    private int estado;

    /**
     * Constructor del pedido de la pyme
     * @param rutCliente Número RUT del identificador del cliente que 
     * hace el pedido.
     * @param idPyme Identificador de la pyme a la cual se le hace el pedido.
     * @param producto Identificador del producto sobre el cual 
     * se hace el pedido.
     * @param cantidad Cantidad del producto que se pide.
     * @param fecha Fecha en la que se realiza el pedido.
     * @param total Monto total a pagar.
     * @param estado Estado en el que se encuentra el pedido (pendiente,
     * finalizado)
     */
    public Pedido(String rutCliente, int idPyme, int producto, int cantidad, String fecha, int total, int estado) {
        this.rutCliente = rutCliente;
        this.idPyme = idPyme;
        this.producto = producto;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.total = total;
        this.estado = estado;
    }

    /**
     *
     * @return
     */
    public String getRutCliente() {
        return rutCliente;
    }

    /**
     *
     * @param rutCliente
     */
    public void setRutCliente(String rutCliente) {
        this.rutCliente = rutCliente;
    }

    /**
     *
     * @return
     */
    public int getIdPyme() {
        return idPyme;
    }

    /**
     *
     * @param idPyme
     */
    public void setIdPyme(int idPyme) {
        this.idPyme = idPyme;
    }

    /**
     *
     * @return
     */
    public int getProducto() {
        return producto;
    }

    /**
     *
     * @param producto
     */
    public void setProducto(int producto) {
        this.producto = producto;
    }

    /**
     *
     * @return
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     *
     * @param cantidad
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    /**
     *
     * @return
     */
    public String getFecha() {
        return fecha;
    }

    /**
     *
     * @param fecha
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    /**
     *
     * @return
     */
    public int getTotal() {
        return total;
    }

    /**
     *
     * @param total
     */
    public void setTotal(int total) {
        this.total = total;
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

    @Override
    public String toString() {
        return "Pedido{" + "rutCliente=" + rutCliente + ", idPyme=" + idPyme + ", producto=" + producto + ", cantidad=" + cantidad + ", fecha=" + fecha + ", total=" + total + ", estado=" + estado + '}';
    }

    
    
    
}
