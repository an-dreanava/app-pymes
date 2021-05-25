<%-- 
    Document   : Index
    Created on : may 16, 2021, 7:00:15 p.m.
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


        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">

    </head>
    <body bgcolor="#e0f7fa">

        <div class="container" >
            <div class="row" id="boton-banner">
                <div class="col l12 s12 right-align block">
                    <a class="waves-effect  red lighten-1 btn modal-trigger white-text" href="#modal1">Iniciar Sesión</a> 
                    <a class="waves-effect blue-grey darken-2 btn white-text" href="IndexPyme.jsp">Para tiendas</a>
                </div>
            </div>
        </div>

        <!-- Modal Iniciar Sesión -->
        <div id="modal1" class="modal">
            <form action="ControladorLoginCliente" method="POST">
                <div class="modal-content center container">
                    <h5 id="modal-text">INICIAR SESIÓN</h5>
                    <br>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <input name="correoL" id="correoL" type="text" class="validate">
                            <label for="correoL">Correo</label>
                        </div>
                        <div class="input-field col s12">
                            <i class="material-icons prefix">https</i>
                            <input name="claveL" id="claveL" type="password" class="validate">
                            <label for="claveL">Contraseña</label>
                        </div>
                        <div class="input-field col s12">
                            <input class="btn waves-effect blue-grey darken-2" type="submit" id="opcion" name="opcion" value="Iniciar">
                            <p class="center"><a href="" class="enlace">¿Olvidaste tu contraseña?</a></p>
                            <p class="center"><a href="" class="enlace">¿No estás registrado?</a></p>
                            <p class="center"><a href="RegistroCliente.jsp" class="enlace2 red-text">Registrarse</a></p>
                        </div>
                    </div>                
                </div>
            </form>
        </div>

        <main>
            <div class="contenedor">
                <div class="container center" >
                    <h3><img  src="Imagenes/logo.png"></h3>
                    <div class="container" >
                        <h3 class="left-align" id="banner-text">TODO LO QUE NECESITES,<BR> EN UN SOLO LUGAR</h3>

                        <div class="row">
                            <div class="col s12">
                                <div class="card white" id="card">
                                    <div class="card-content black-text" id="card-index">
                                        <form action="" method="POST">

                                            <div class="input-field col s4">
                                                <select>
                                                    <option value="" disabled selected>Seleccione Región</option>
                                                    <option value="1">Option 1</option>
                                                    <option value="2">Option 2</option>
                                                    <option value="3">Option 3</option>
                                                </select>
                                            </div>

                                            <div class="input-field col s4">
                                                <select >
                                                    <option value="" disabled selected>Seleccione Comuna</option>
                                                    <option value="1">Option 1</option>
                                                    <option value="2">Option 2</option>
                                                    <option value="3">Option 3</option>
                                                </select>
                                            </div>  

                                            <div class="input-field col s4">
                                                <a class="waves-effect blue-grey darken-2 btn white-text">Ver tiendas</a>
                                            </div>                       
                                        </form>
                                    </div>                            
                                </div>
                            </div>
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
                var elems = document.querySelectorAll('.modal');
                var instances = M.Modal.init(elems);
            });

        </script>
    </body>
</html>
