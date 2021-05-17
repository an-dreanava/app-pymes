<%-- 
    Document   : RegistroCliente
    Created on : may 15, 2021, 12:57:18 p.m.
    Author     : AngieRiera
--%>

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
                            <span href="#" >Para Tiendas</span>
                        </div>                
                        <ul id="nav-mobile" class="right hide-on-med-and-down black-text">
                            <a class="waves-effect  red lighten-1 btn modal-trigger" href="#modal1">Ingresa a tu Cuenta</a>           
                        </ul>
                    </div>
                </nav>
            </div>
        </header>

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


        <main>
            <div class="container" style="padding: 20px" >
                <div class="row" >
                    <form action="ControladorPyme" method="POST">

                        <div class="col s2">
                        <p>Rut:</p>                            
                    </div>
                    <div class="col s4">
                        <input name="rut" id="rut" type="text" class="validate"  required> 
                    </div>

                    <div class="col s2">
                        <p>Nombre Tienda:</p>                            
                    </div>
                    <div class="col s4">
                        <input name="nombre_pyme" id="nombre_pyme" type="text" class="validate"  required> 
                    </div>

                    <div class= "col s2">
                        <p>Nombres Titular:</p>                            
                    </div>
                    <div class="col s4">
                        <input name="nombre" id="nombres" type="text" class="validate"  required>                            
                    </div>


                    <div class="col s2">
                        <p>Apellidos Titular:</p>                            
                    </div>
                    <div class="col s4">
                        <input name="apellido" id="apellidos" type="text" class="validate"  required>                            
                    </div>

                    <div class="col s2">
                        <p>Región:</p>                            
                    </div>
                    <div class="col s4">
                        <select name="region" id="region" required>
                            <option>Seleccione Región</option>   
                            
                        </select>                     
                    </div>

                    <div class="col s2">
                        <p>Comuna:</p>                            
                    </div>
                    <div class="col s4">
                        <select name="comuna" id="comuna" required>
                            <option>Seleccione Comuna</option>
                        </select>                     
                    </div>

                    <div class="col s2">
                        <p>Dirección:</p>                            
                    </div>
                    <div class="col s4">
                        <input name="direccion" id="direccion" type="text" class="validate"  required> 
                    </div>

                    <div class="col s2">
                        <p>Teléfono:</p>                            
                    </div>
                    <div class="col s4">
                        <input name="telefono" id="telefono" type="text" class="validate"  required> 
                    </div>

                    <div class="col s2">
                        <p>Correo:</p>                            
                    </div>
                    <div class="col s4">
                        <input name="correo" id="correo" type="text" class="validate"  required> 
                    </div>

                    <div class="col s2">
                        <p>Contraseña:</p>                            
                    </div>
                    <div class="col s4">
                        <input name="contraseña" id="contraseña" type="password" class="validate"  required> 
                        <p></p>
                    </div>

                        <div class="center">
                            <button class="btn waves-effect red lighten-1" type="submit" name="action">Registrarse</button>
                        </div>                     
                    </form>
                </div>
            </div>
        </main>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $.ajax({
                    url: "ControladorPyme",
                    method: "GET",
                    data: {operation: 'region'},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        let obj = $.parseJSON(data);
                        $.each(obj, function (key, value) {
                            $('#region').append('<option value="' + value.id + '">' + value.nombre + '</option>')
                        });
                        $('select').formSelect();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#region').append('<option>Region Invalida</option>');
                    },
                    cache: false
                });


                $('#region').change(function () {
                    $('#comuna').find('option').remove();
                    $('#comuna').append('<option>Selecciona una Comuna</option>'); 

                    let cid = $('#comuna').val();
                    let data = {
                        operation: "comuna",
                        id: cid
                    };

                    $.ajax({
                        url: "ControladorPyme",
                        method: "GET",
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            let obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $('#comuna').append('<option value="' + value.id + '">' + value.name + '</option>')
                            });
                            $('select').formSelect();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#state').append('<option>Comuna Invalida</option>');
                        },
                        cache: false
                    });
                });
                
//                $('#state').change(function () {
//                    $('#city').find('option').remove();
//                    $('#city').append('<option>Select City</option>');
//
//                    let sid = $('#state').val();
//                    let data = {
//                        operation: "city",
//                        id: sid
//                    };
//
//                    $.ajax({
//                        url: "GetCountryStateservlet",
//                        method: "GET",
//                        data: data,
//                        success: function (data, textStatus, jqXHR) {
//                            console.log(data);
//                            let obj = $.parseJSON(data);
//                            $.each(obj, function (key, value) {
//                                $('#city').append('<option value="' + value.id + '">' + value.name + '</option>')
//                            });
//                            $('select').formSelect();
//                        },
//                        error: function (jqXHR, textStatus, errorThrown) {
//                            $('#city').append('<option>City Unavailable</option>');
//                        },
//                        cache: false
//                    });
                });
        </script>


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
                var elems = document.querySelectorAll('.sidenav');
                var instances = M.Sidenav.init(elems, options);
            });

            document.addEventListener('DOMContentLoaded', function () {
                var elems = document.querySelectorAll('.modal');
                var instances = M.Modal.init(elems);
            });

        </script>


    </body>
</html>
