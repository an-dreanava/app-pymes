<%-- 
    Document   : SolicitudCompra
    Created on : 19-05-2021, 19:16:20
    Author     : Paula Poblete
--%>

<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Modelo.Cliente"%>
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
                }
            }

            String producto = request.getParameter("id");
            String total = request.getParameter("total");
            String cant = request.getParameter("cant");

            PreparedStatement ps = null;
            ResultSet rs = null;
            Conexion con = new Conexion();
            com.mysql.jdbc.Connection conexion = con.getConnection();
            ps = conexion.prepareStatement("SELECT PR.FOTO, PR.TITULO, PY.NOMBRE_PYME, PR.DESCRIPCION FROM PRODUCTOS PR INNER JOIN PYME PY ON PR.ID_PYME = PY.ID WHERE PR.ID = ?");
            ps.setString(1, producto);
            rs = ps.executeQuery();
        %>
        <header>
            <div class="navbar-fixed">
                <nav class="white nav-extended">
                    <div class="nav-wrapper">
                        <ul id="nav-mobile" class="left hide-on-med-and-down black-text">
                            <li><a href="IndexCliente.jsp" class="logo-banner" ><img  src="Imagenes/logo.png"></a></li>
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
            <div class="container" style="" >
                <div class="row " >
                    <br><br>
                    <div >
                        <label class="col s9" style="font-weight: bold; font-size: 20px; color: black;">TU SOLICITUD DE COMPRA SE HA RECIBIDO CON EXITO</label>
                    </div>
                    <div class="col s3">
                        <a class="waves-effect  red lighten-1 btn modal-trigger white-text">IR AL CHAT</a>
                    </div>
                    <div class="col s7">
                        <h5 >Detalles de tu compra</h5>
                    </div>
                    <div class="col s5 ">
                        <div class="container left ">
                            <h5>Tus datos</h5>                           
                        </div>                        
                    </div>                    
                </div>



                <div class="imagen-solicitud"> 
                    <% while (rs.next()) {%>
                    <img src="Imagenes/<%=rs.getString("PR.FOTO")%>" >
                </div>

                <div class="detalle-solicitud row"> 
                    <div class="detalle-pedido col s6">
                        <div class="row">
                            <div class="col s12">

                                <h5><%=rs.getString("PR.TITULO")%> </h5> 
                            </div>
                            <div class="col s12">
                                <label style="font-size: 20px;"><%=rs.getString("PY.NOMBRE_PYME")%></label>
                            </div>
                            <div class="col s5">
                                <h5>$ <%=total%></h5>                        
                            </div>
                            <div class="col s6">
                                <h5><%=cant%> Unid.</h5>                        
                            </div>
                            <div class="col s12">
                                <p><%=rs.getString("PR.DESCRIPCION")%></p> 
                            </div>
                        </div>
                    </div>

                    <div class="detalle-datos col s6">
                        <div class="row">
                            <div class="col s6">
                                <h6>Nombre: </h6>
                            </div>
                            <div class="col s6">
                                <h6><%=cliente.getNombre() + " " + cliente.getApellido()%></h6>                      
                            </div>
                            <br>
                            <div class="col s6">
                                <h6>Documento: </h6>
                            </div>
                            <div class="col s6">
                                <h6><%=cliente.getRut()%> </h6>                      
                            </div>
                            <br>
                            <div class="col s6">
                                <h6>Correo: </h6>
                            </div>
                            <div class="col s6">
                                <h6><%=cliente.getCorreo()%></h6>                      
                            </div>
                            <br>
                            <div class="col s6">
                                <h6>Teléfono: </h6>
                            </div>
                            <div class="col s6">
                                <h6><%=cliente.getTelefono()%></h6>                      
                            </div>
                            <br>
                            <div class="col s6">
                                <%
                                    ps = conexion.prepareStatement("SELECT CONCAT(D.DESCRIPCION, ', ', C.DESCRIPCION, ', ', R.DESCRIPCION) AS DIRECCION FROM CLIENTE CL INNER JOIN DIRECCION D ON CL.ID_DIRECCION = D.ID INNER JOIN COMUNA C ON D.ID_COMUNA = C.ID INNER JOIN CIUDAD CI ON C.ID_CIUDAD = CI.ID INNER JOIN REGION R ON CI.ID_REGION = R.ID WHERE CL.RUT = ?");
                                    ps.setString(1, cliente.getRut());
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                <h6>Dirección: </h6>
                            </div>
                            <div class="col s6">
                                <h6><%=rs.getString("DIRECCION")%></h6>                      
                            </div>
                            <% }
                                }%>

                        </div>
                    </div>
                </div>

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
                temp = setTimeout(redireccion, 5400000 );
            });
        </script>
    </body>
</body>
</html>
