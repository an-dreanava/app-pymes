<%-- 
    Document   : VistaProducto
    Created on : 18-05-2021, 19:26:19
    Author     : Paula Poblete
--%>
<%@page import="Modelo.Cliente"%>
<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link href="css/jquery.nice-number.css" rel="stylesheet">


        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
        <link type="text/css" rel="stylesheet" href="css/estilo.css" />

    </head>
    <body>

        <%
            Cliente cliente = null;
            String estadoSesion = "off";

            HttpSession sesion = request.getSession(true);

            estadoSesion = (String) sesion.getAttribute("estadoSesion");
            String tipo = (String) sesion.getAttribute("tipo");

            if (estadoSesion == null) {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Acceso Denegado&mensaje=Debe iniciar sesion para acceder a esta seccion&boton=Volver&retorno=Index.jsp");
            } else {
                if (!tipo.equals("1")) {
                    response.sendRedirect("Ventana_Mensajes.jsp?titulo=Acceso Denegado&mensaje=Debe iniciar sesion como cliente para acceder a esta seccion&boton=Volver&retorno=Index.jsp");
                    sesion.setAttribute("usuario", null);
                    sesion.setAttribute("estadoSesion", "close");
                    sesion.invalidate();
                } else {
                    cliente = (Cliente) sesion.getAttribute("usuario");
                    String rut = cliente.getRut();
                }
            }

            String id = "";
            id = request.getParameter("id");

            PreparedStatement ps = null;
            ResultSet rs = null;
            Conexion con = new Conexion();
            com.mysql.jdbc.Connection conexion = con.getConnection();
            ps = conexion.prepareStatement("SELECT PR.ID, PR.FOTO,PR.TITULO,PY.NOMBRE_PYME,PR.PRECIO,PR.DESCRIPCION, PR.ID_PYME FROM PRODUCTOS PR INNER JOIN PYME PY ON PR.ID_PYME = PY.ID  WHERE PR.ID =? ");
            ps.setString(1, id);
            rs = ps.executeQuery();

        %>


        <script>
            $(document).ready(function () {

                $('input[type="number"]').each(function () {
                    var name = $(this).attr('name');
                    value = localStorage.getItem(name);
                    var value = $(this).val(value);
                });

                setInterval(function () {
                    $('input[type="number"]').each(function () {
                        var name = $(this).attr('name');
                        var value = $(this).val();
                        localStorage.setItem(name, value);
                    });


                }, 1000);
            });

            $(document).ready(function () {
                $('#confirmar').click(function () {
                    /*Obtener datos almacenados*/
                    let cant = 0;
                    cant = localStorage.getItem("cant");
                    /*Mostrar datos almacenados*/
                    document.getElementById("cantidad").innerHTML = cant + " Uni.";


                    let precio = document.getElementById("precio").textContent;
                    let producto = document.getElementById("producto").textContent;
                    let nombre = document.getElementById("nombre-pyme").textContent;
                    localStorage.setItem("precio", precio);
                    localStorage.setItem("producto", producto);
                    localStorage.setItem("nombre", nombre);

                    let total = parseInt(cant) * parseInt(precio);

                    document.getElementById("totalModal").innerHTML = total;
                    document.getElementById("precioModal").innerHTML = "$ " + precio;
                    document.getElementById("productoModal").innerHTML = producto;
                    document.getElementById("pymeModal").innerHTML = nombre;

                    let cantidadOculta = document.getElementById("cantidad-oculta");
                    cantidadOculta.value = cant;

                    let totalOculto = document.getElementById("total-oculto");
                    totalOculto.value = total;
                });
            });
        </script>

        <header>
            <div class="navbar-fixed">
                <nav class="white nav-extended">
                    <div class="nav-wrapper">
                        <ul id="nav-mobile" class="left hide-on-med-and-down black-text">
                            <li><a href="sass.html" >Sass</a></li>
                        </ul>                
                        <div class="brand-logo center" id="titulo-banner">
                            <span href="#" >Tiendas</span>
                        </div>                
                        <ul id="nav-mobile" class="right hide-on-med-and-down black-text">
                            <li>
                                <a class="" href="DetallesCuenta.jsp"><i class="material-icons">account_circle</i></a>                                 
                            </li>
                            <li>
                            <h7>Cuenta</h7> 
                            </li>
                            <li>
                                <a class="" href=""><i class="material-icons">favorite</i></a> 
                            </li>
                            <li>
                                <a class="" href="CerrarSesion.jsp"><i class="material-icons">exit_to_app</i></a> 
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>

        <main>

            <br><br>
            <div class="divider"></div>
            <div class="container">
                <div class="row">
                    <div class="col s4 ">
                        <a href="IndexCliente.jsp">
                            <i class="material-icons left" >navigate_before</i>
                            <label class="label-volver">VOLVER</label>  
                        </a>
                    </div>
                </div>
            </div>
            <div class="divider separador"></div>
            <br><br>

            <div class="container">
                <div class="">
                    <fieldset>
                        <% while (rs.next()) {
                                out.println("<img src='Imagenes/" + rs.getString("PR.FOTO") + "' class='imagen'>");
                                out.println("<div class='Info'>");

                                out.println("<div class='container'>");

                                out.println("<label id='producto' class='label-producto'>" + rs.getString("PR.TITULO") + " </label> ");
                                out.println("<a class='fav right' href=''><i class='material-icons'>favorite</i></a>");
                                out.println("</div>");
                                out.println("<div class='divider'></div>");
                                out.println("<h6 id='nombre-pyme'>" + rs.getString("PY.NOMBRE_PYME") + "</h6>");
                                out.println("<div class='row'>");
                                out.println("<div class='col s2'>");
                                out.println("<label class='label-precio'>$</label>");
                                out.println("<label id='precio' class='label-precio'>" + rs.getInt("PR.PRECIO") + "</label>");
                                out.println("</div>");
                                out.println("<div class='col s3 box'>");
                                out.println("<input name='cant' id='cant' value='1' type='number' class='validate'  required>");
                                out.println("</div>");
                                out.println("<div class='col s7'>");
                                out.println("<p>" + rs.getString("PR.DESCRIPCION") + "</p>");
                                out.println("</div>");
                                out.println("<div class='col s7 left'>");
                                out.println("<a class='waves-effect  red lighten-1 btn modal-trigger white-text' href='#modal2' id='confirmar'>COMPRAR</a>");

                                out.println("</div>");
                        %>
                </div>
            </div>
        </fieldset>
    </div>
</div>



<div id="modal2" class="modal">
    <form action="ControladorPedido" method="POST">
        <div class="modal-content">
            <h5 id="modal-text" class="center">CONFIRMAR COMPRA</h5>
            <img src="Imagenes/imagen.jpg" class="imagenmodal">
            <div class="container" id="confirmar-compra">
                <div class=" left">
                    <h5 id="productoModal"></h5> 

                    <label class="left" id="pymeModal"></label><br>
                    <div class="row">
                        <div class="col s4">

                            <h6 id="precioModal"></h6>                        
                        </div>
                        <div class="col s3">
                            <h6 id="cantidad" type="text"></h6>
                            <input id="cantidad-oculta" name="cantidad-oculta" type="hidden" value="">
                        </div>
                        <div class="col s7 ">
                            <label class='label-total'>Total: $</label>
                            <label id="totalModal" class='label-total'></label>
                            <input id="total-oculto" name="total-oculto" type="hidden" value="">
                        </div>

                        <div class="col s7 center">
                            <br>
                            <input class="btn waves-effect red lighten-1 white-text" type="submit" id="opcion" name="opcion" value="Confirmar">

                        </div>
                        <%
                                out.println("<input id='cliente' name='cliente' type='hidden' value='" + cliente.getRut() + "'>");
                                out.println("<input id='pyme' name='pyme' type='hidden' value='" + rs.getInt("PR.ID_PYME") + "'>");
                                out.println("<input id='producto' name='producto' type='hidden' value='" + rs.getInt("PR.ID") + "'>");
                            }%>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>



</main>

<footer class="page-footer blue-grey darken-2">
    <div class="container">
        <div class="row">
            <div class="col s4">
                <h5 class="white-text">Nombre</h5>
            </div>
            <div class="col s2 ">
                <ul>
                    <li><a class="grey-text text-lighten-3" href="#!">Inicio</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Acerca de</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Publica tu tienda</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Planes</a></li>
                </ul>
            </div>

            <div class="col s2">
                <ul>
                    <li><a class="grey-text text-lighten-3" href="#!">Regiones</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Ciudades</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Privacidad</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Términos de servicio</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            © 2021 Copyright 
            <a class="grey-text text-lighten-4 right" href="#!"></a>
        </div>
    </div>
</footer>


<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous">
</script>
<script src="js/jquery.nice-number.js"></script>

<script>
            $(function () {
                $('input[type="number"]').niceNumber();
            });
            $(document).ready(function () {
                $('select').formSelect();
            });
            document.addEventListener('DOMContentLoaded', function () {
                var elems = document.querySelectorAll('select');
                var instances = M.FormSelect.init(elems, options);
            });
            document.addEventListener('DOMContentLoaded', function () {
                var elems = document.querySelectorAll('.modal');
                var instances = M.Modal.init(elems);
            });

</script>
<script>
    // función encargada de la redirección
    function redireccion() {
        window.location = "Index.jsp";
    }

    // se llamará a la función que redirecciona después de 90 minutos (5400000 milisegundos)
    var temp = setTimeout(redireccion, 5400000);

    // cuando se pulse en cualquier parte del documento
    document.addEventListener("mousemove", function () {
        // borrar el temporizador que redireccionaba
        clearTimeout(temp);
        // y volver a iniciarlo
        temp = setTimeout(redireccion, 5400000);
    });
</script>


</body>
</html>
