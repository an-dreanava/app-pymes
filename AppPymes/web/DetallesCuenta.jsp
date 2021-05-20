<%-- 
    Document   : DetallesCuenta
    Created on : 20-05-2021, 17:55:18
    Author     : Paula Poblete
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
        <link href="css/jquery.nice-number.css" rel="stylesheet">


        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
        <link type="text/css" rel="stylesheet" href="css/estilo.css" />

    </head>
    <body>
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
                </nav>
            </div>
        </header>

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
                            <input class="btn waves-effect blue-grey darken-2" type="submit" id="opcion" name="opcion" value="Iniciar Sesion">
                            <p class="center"><a href="" class="enlace">¿Olvidaste tu contraseña?</a></p>
                            <p class="center"><a href="" class="enlace">¿No estás registrado?</a></p>
                            <p class="center"><a href="RegistroCliente.jsp" class="enlace2">Registrarse</a></p>
                        </div>
                    </div>                
                </div>
            </form>
        </div>


        <main>
            <div class="container" style="" >
                <div class="Info"> 

                    <div class="row">
                        <div class="col s12">
                            <ul class="tabs">
                                <li class="tab col s6"><a href="#test1">Informacion Personal</a></li>
                                <li class="tab col s6"><a class="active" href="Pedidos.jsp">Pedidos</a></li>

                            </ul>
                        </div> 
                       
                    </div>
                    <div class="divider"></div>
                   

                    <fieldset class="fieldsetD">

                        <div class="row">
                            <div class="col s6">
                                <div class= "">
                                    <p>Nombres: lorem ipsum dolor.</p>
                                </div>
                                <div class=" ">
                                    <p>Documento: 99.999.999.K</p>                            
                                </div>    
                                <div class=" ">
                                    <p>Correo: Fpoblete018@gmail.com</p>                            
                                </div>    
                                <div class="">
                                    <p>Telefono: +5699999999</p>                            
                                </div>   

                            </div>

                            <div class=" col s6 ">
                                <div class=" ">
                                    <p>Direccion 1:</p>
                                    <p>lorem imsdpdmosf sdfjsdkfsdnf gmfkdkgdfngj </p>
                                    <p>Direccion 2 :</p> 
                                    <p>lorem imsdpdmosf sdfjsdkfsdnf gmfkdkgdfngj </p>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>


            <div id="modal1" class="modal">
                <form action="ControladorLoginCliente" method="POST">
                    <div class="modal-content center container">
                        <h5 id="modal-text">CONFIRMAR COMPRA</h5>
                        <br>
                        <div class="row">
                            <div class="input-field col s12">
                                <img src="Imagenes/imagen.jpg" class="imagenmodal">

                                <h5>NOMBRE </h5> 
                                <h6>NOMBRE TIENDA </h6>
                                <br><br>



                            </div>                
                        </div>

                    </div>

                    </fieldset>


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
        
        var instance = M.Tabs.init(el, options);

    </script>
</body>
</body>
</html>

