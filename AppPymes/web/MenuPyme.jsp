<%-- 
    Document   : RegistroPyme
    Created on : 15-05-2021, 13:42:43
    Author     : drean
--%>

<%@page import="Modelo.Pyme"%>
<%@page import="Dao.PymeDAO"%>
<%@page import="Modelo.Categoria"%>
<%@page import="Modelo.Comuna"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Region"%>
<%@page import="Dao.DireccionDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Modelo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" href="js/modal.js"></script>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  />

        <link type="text/css" rel="stylesheet" href="css/estilo.css" />
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
    </head>
    <body>
        <%
            Pyme pyme = null;
            String estadoSesion = "off";

            HttpSession sesion = request.getSession(true);

            pyme = (Pyme) sesion.getAttribute("pyme");
            estadoSesion = (String) sesion.getAttribute("estadoSesion");

            if (estadoSesion == null) {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Acceso Denegado&mensaje=Debe iniciar sesion para acceder a esta seccion&boton=Volver&retorno=IndexPyme.jsp");
            } 

            PreparedStatement ps = null;
            ResultSet rs = null;
            Conexion con = new Conexion();
            com.mysql.jdbc.Connection conexion = con.getConnection();
            //ps = conexion.prepareStatement("SELECT * FROM PYME P INNER JOIN CATEGORIA_PYME C ON P.ID_CATEGORIA_PYME = C.ID WHERE P.ID_ESTADO=2 ORDER BY RAND() LIMIT 4");
            //rs = ps.executeQuery();
        %>
        <header>
            <div class="navbar-fixed">
                <nav class="white">
                    <div class="nav-wrapper">
                        <ul id="nav-mobile" class="left hide-on-med-and-down black-text">
                            <li><a href="sass.html" >Sass</a></li>
                        </ul>                
                        <div class="brand-logo center" id="titulo-banner">
                            <span>Para Tiendas</span>
                        </div>                
                        <ul id="nav-mobile" class="right hide-on-med-and-down black-text">
                            <a class="waves-effect  red lighten-1 btn modal-trigger" href="#modal1">Ingresa a tu Cuenta</a> 
                        </ul>
                        <ul id="slide-out" class="sidenav sidenav-fixed">
                            <li><a href="#!">First Sidebar Link</a></li>
                            <li><a href="#!">Second Sidebar Link</a></li>
                        </ul>
                        <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    </div>
                </nav>
            </div>
        </header>

        <main>


            <!-- Modal Iniciar Sesión -->
            <div id="modal1" class="modal">
                <form action="" method="POST">
                    <div class="modal-content center container">
                        <h5 id="modal-text">INICIAR SESIÓN</h5>
                        <br>
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">account_circle</i>
                                <input name="correo" id="correo" type="text" class="validate">
                                <label for="correo">Correo</label>
                            </div>
                            <div class="input-field col s12">
                                <i class="material-icons prefix">https</i>
                                <input name="contraseña" id="cotraseña" type="password" class="validate">
                                <label for="contraseña">Contraseña</label>
                            </div>
                            <div class="input-field col s12">
                                <button class="btn waves-effect blue-grey darken-2" type="submit" name="action">Iniciar Sesión</button>
                                <p class="center"><a href="" class="enlace">¿Olvidaste tu contraseña?</a></p>
                                <p class="center"><a href="" class="enlace">¿No estás registrado?</a></p>
                                <p class="center"><a href="" class="enlace2">Registrarse</a></p>
                            </div>
                        </div>                
                    </div>
                </form>
            </div>

            <div id="menu-pymes">

                <div class="container">
                    <h5 id="titulo_form_pymes">NOMBRE TIENDA</h5>           
                </div>


                <div class="container" style="padding: 20px" >
                    <div class="row" >

                    </div>
                </div>
            </div>
        </main>

    </div>

    <!--JavaScript at end of body for optimized loading-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });

        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init(elems, options);
        });

        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.sidenav');
            var instances = M.Sidenav.init(elems, options);
        });

        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.modal');
            var instances = M.Modal.init(elems);
        });

        $(document).ready(function () {
            $('.sidenav').sidenav({
            });
        });


    </script>
</body>
</html>
