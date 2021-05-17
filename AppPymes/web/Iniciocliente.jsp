<%-- 
    Document   : Iniciocliente
    Created on : 15-05-2021, 18:26:21
    Author     : Paula Poblete
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />

        <link type="text/css" rel="stylesheet" href="css/estilo.css" />

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
   

    </head>

    <body>
        <%
            PreparedStatement ps = null;
            ResultSet rs = null;
            Conexion con = new Conexion();
            com.mysql.jdbc.Connection conexion = con.getConnection();
        %>
        <header>
            <div class="navbar-fixed">
                <nav class="white">
                    <div class="nav-wrapper">
                        <ul id="nav-mobile" class="left hide-on-med-and-down black-text">
                            <li><a href="sass.html" >Sass</a></li>
                        </ul>                
                        <div class="brand-logo center" id="titulo-banner">
                            <span href="#" >TIENDAS</span>
                        </div>                
                        <ul id="nav-mobile" class="right hide-on-med-and-down black-text">
                            <a>   <i class="material-icons waves-effect blue-grey darken-2" >person</i></a> 
                            <a>   <i class="material-icons waves-effect blue-grey darken-2" >favorite</i></a>              
                        </ul>
                    </div>
                </nav>
            </div>

        </header>
        <main>

            <form action="" method="POST">

                <nav class="nav-extended white ">
                    <div class="nav-wrapper ">

                        <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="black-text material-icons">menu</i></a>
                        <ul id="nav-mobile" class="right hide-on-med-and-down black-text">
                            <li>
                                <div class="center row ">
                                    <div class="col s12 ">
                                        <div class="row center-align" id="topbarsearch"  >
                                            <div class="input-field col s12 black-text">
                                                <i class="black-text material-icons prefix ">search</i>
                                                <input type="text" placeholder="search" id="autocomplete-input"
                                                       class="autocomplete black-text">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>  
                    <div class="container">
                        <div class="carousel">
                            <div>
                                <div class="card carousel-item">
                                    <div class="card-content  black-text">
                                        <span class="card-title">TITULO TIENDA</span>
                                        <img src="Imagenes/imagen.jpg">
                                        <p>hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola .</p>
                                    </div>
                                    <div class="card-action">
                                        <a href="#">Ir a tienda</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="card carousel-item ">
                                    <div class="card-content black-text ">
                                        <span class="card-title">TITULO TIENDA</span>
                                        <img src="Imagenes/imagen.jpg">
                                        <p class="">hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola hola .</p>
                                    </div>
                                    <div class="card-action">
                                        <a href="#">Ir a tienda</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                        <!--script-link----------->
                        <script type="text/javascript" src="js/script.js"></script>
                        </body>


                </nav>
            </form>
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

        </div>
    </footer>




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
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.carousel');
            var instances = M.Carousel.init(elems, options);
        });

        // Or with jQuery

        $(document).ready(function () {
            $('.carousel').carousel();
        });
    </script>
</body>

</html>
