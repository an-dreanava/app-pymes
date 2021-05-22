<%-- 
    Document   : ListadoPymes
    Created on : may 18, 2021, 8:19:57 p.m.
    Author     : AngieRiera
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

        <link type="text/css" rel="stylesheet" href="css/estilo.css" />

        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">

    </head>
    <body>
        <%
            Cliente cliente = null;
            String estadoSesion = "off";
            String tipo = "";

            HttpSession sesion = request.getSession(true);

            
            estadoSesion = (String) sesion.getAttribute("estadoSesion");
            tipo = (String) sesion.getAttribute("tipo");

            if (estadoSesion == null) {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Acceso Denegado&mensaje=Debe iniciar sesion para acceder a esta seccion&boton=Volver&retorno=Index.jsp");
            }else{
                if(!tipo.equals("1")){
                    response.sendRedirect("Ventana_Mensajes.jsp?titulo=Acceso Denegado&mensaje=Debe iniciar sesion como cliente para acceder a esta seccion&boton=Volver&retorno=Index.jsp");
                    sesion.setAttribute("usuario", null);
                    sesion.setAttribute("estadoSesion", "close");
                    sesion.invalidate();
                }else{
                    cliente = (Cliente) sesion.getAttribute("usuario");
                }
            }
            
            
            PreparedStatement ps = null;
            ResultSet rs = null;
            Conexion con = new Conexion();
            com.mysql.jdbc.Connection conexion = con.getConnection();
            ps = conexion.prepareStatement("SELECT * FROM PYME P INNER JOIN CATEGORIA_PYME C ON P.ID_CATEGORIA_PYME = C.ID WHERE P.ID_ESTADO=2");
            rs = ps.executeQuery();
        %>
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
                                <a class="" href=""><i class="material-icons">account_circle</i></a>                                 
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

            <div class="slider">
                <ul class="slides">
                    <li>
                        <img src="Imagenes/oferta1.png">
                    </li>
                    <li>
                        <img src="Imagenes/oferta2.png"> 
                    </li>
                    <li>
                        <img src="Imagenes/oferta3.png"> 
                    </li>
                    <li>
                        <img src="Imagenes/oferta4.png"> 
                    </li>
                    <li>
                        <img src="Imagenes/oferta5.png"> 
                    </li>
                </ul>
            </div>

            <br>
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
            <br>

            <div class="container">
                <div class="row">
                    <% while (rs.next()) {
                            out.println("<div class='col 12 m3 s10'>");
                            out.println("<div class='card-pyme'>");
                            out.println("<div class='card-image'>");
                            out.println("<a href='ProductosPyme.jsp?id="+ rs.getString("P.ID") +"' class='card-logo'>");
                            out.println("<img src='Imagenes/" + rs.getString("P.LOGO") + "' class='responsive-img circle'>");
                            out.println("</a>");
                            out.println("</div>");
                            out.println("<div class='card-content center'>");
                            out.println("<h5 class='centrado bold'>" + rs.getString("P.NOMBRE_PYME") + "</h5>");
                            out.println("<span class='card-title'>" + rs.getString("C.DESCRIPCION") + "</span>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                        }%>

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


        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script >
            var options = {};
            document.addEventListener('DOMContentLoaded', function () {
                var elems = document.querySelectorAll('.slider');
                var instances = M.Slider.init(elems, options);
            });
        </script>
    </body>
</html>

