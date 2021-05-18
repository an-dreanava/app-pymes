<%-- 
    Document   : InicioCliente
    Created on : may 17, 2021, 5:27:53 p.m.
    Author     : AngieRiera
--%>

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

                        </ul>
                    </div>
                </nav>
            </div>
        </header>

        <main>
            <br>
            <div class="divider"></div>
            <div class="container">
                <div class="row">
                    <div class="col s10">
                        <h6 color="#fafafa">PYMES DESTACADAS</h6>
                    </div>
                    <div class="col s2">
                        <a href=""><h6>VER TODAS <i class="material-icons">navigate_next</i></h6></a>                        
                    </div>
                </div>

            </div>
            <div class="divider"></div><br>

            <div class="container">
                <div class="row">
                    <!-- Tienda 1 -->
                    <div class="col 12 m3 s10">  
                        <div class="card-pyme">
                            <div class="card-image">
                                <a href="imagenes/productos/1.jpg" class="card-logo">
                                    <img src="Imagenes/imagen.jpg" class="responsive-img">
                                </a>
                            </div>
                            <div class="card-content center">
                                <h5 class="centrado bold">MONSTERA</h5>         
                                <span class="card-title">Ropa y Accesorios</span>
                            </div>            
                        </div>
                    </div>

                    <!-- Tienda 2 -->
                    <div class="col 12 m3 s10">  
                        <div class="card-pyme">
                            <div class="card-image">
                                <a href="imagenes/productos/1.jpg" class="card-logo">
                                    <img src="Imagenes/imagen.jpg" class="responsive-img">
                                </a>
                            </div>
                            <div class="card-content center">
                                <h5 class="centrado bold">MONSTERA</h5>         
                                <span class="card-title">Ropa y Accesorios</span>
                            </div>            
                        </div>
                    </div>

                    <!-- Tienda 3 -->
                    <div class="col 12 m3 s10">  
                        <div class="card-pyme">
                            <div class="card-image">
                                <a href="imagenes/productos/1.jpg" class="card-logo">
                                    <img src="Imagenes/imagen.jpg" class="responsive-img">
                                </a>
                            </div>
                            <div class="card-content center">
                                <h5 class="centrado bold">MONSTERA</h5>         
                                <span class="card-title">Ropa y Accesorios</span>
                            </div>            
                        </div>
                    </div>

                    <!-- Tienda 4 -->
                    <div class="col 12 m3 s10">  
                        <div class="card-pyme">
                            <div class="card-image">
                                <a href="imagenes/productos/1.jpg" class="card-logo">
                                    <img src="Imagenes/imagen.jpg" class="responsive-img">
                                </a>
                            </div>
                            <div class="card-content center">
                                <h5 class="centrado bold">MONSTERA</h5>         
                                <span class="card-title">Ropa y Accesorios</span>
                            </div>            
                        </div>
                    </div>
                </div>
            </div>

            <div class="divider"></div>
            <div class="container">
                <h6 color="#fafafa">CATEGORÍAS</h6>
            </div>
            <div class="divider"></div><br>

            <div class="container">
                <div class="row grid">
                    <a href="ProductosCategoria.jsp?id=1"><div class="col s4   cyan lighten-5 center"><span class="flow-text"><br><br>HOMBRE<br><br><br></span></div></a>
                    <a href=""><div class="col s4  teal lighten-5 center"><span class="flow-text"><br>TECNOLOGÍA<br><br></span></div></a>
                    <a href=""><div class="col s4 cyan lighten-5 center"><span class="flow-text"><br>HOGAR<br><br></span></div></a>

                    <a href=""><div class="col s4  light-blue lighten-5 center"><span class="flow-text"><br>PAPELERÍA<br></span></div></a>
                    <a href=""><div class="col s4  teal lighten-5 center"><span class="flow-text"><br><br></span></div></a>
                    <a href=""><div class="col s8   blue lighten-5 center"><span class="flow-text"><br><br>MUJER<br><br><br></span></div></a>
                    <a href=""><div class="col s4  teal lighten-5 center"><span class="flow-text"><br>INFANTIL<br><br><br><br></span></div></a>


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
    </body>
</html>
