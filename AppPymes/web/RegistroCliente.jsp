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
                            <span href="#" >Registro</span>
                        </div>                
                        <ul id="nav-mobile" class="right hide-on-med-and-down black-text">
                            <a class="waves-effect  red lighten-1 btn modal-trigger" href="#modal1">Iniciar Sesión</a> 
                            <a class="waves-effect blue-grey darken-2 btn" href="IndexPyme.jsp">Para tiendas</a>              
                        </ul>
                    </div>
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
                            <input class="btn waves-effect blue-grey darken-2" type="submit" id="opcion" name="opcion" value="Iniciar">
                            <p class="center"><a href="" class="enlace">¿Olvidaste tu contraseña?</a></p>
                            <p class="center"><a href="" class="enlace">¿No estás registrado?</a></p>
                            <p class="center"><a href="RegistroCliente.jsp" class="red-text">Registrarse</a></p>
                        </div>
                    </div>                
                </div>
            </form>
        </div>


        <main>
            <div class="container" style="padding: 20px" >
                <div class="row" >
                    <form action="ControladorCliente" method="POST">
                        <div class="col s6">
                        </div>

                        <div class="col s2">
                            <p>Rut:</p>                            
                        </div>
                        <div class="col s4">
                            <input name="rut" id="rut" type="text" class="validate"  required> 
                        </div>

                        <div class= "col s2">
                            <p>Nombres:</p>                            
                        </div>
                        <div class="col s4">
                            <input name="nombres" id="nombres" type="text" class="validate"  required>                            
                        </div>


                        <div class="col s2">
                            <p>Apellidos:</p>                            
                        </div>
                        <div class="col s4">
                            <input name="apellidos" id="apellidos" type="text" class="validate"  required>                            
                        </div>

                        <div class="col s2">
                            <p>Región:</p>                            
                        </div>
                        <div class="col s4">
                            <select name="region" id="region" required>
                                <option value="" disabled selected>Seleccione Region</option>
                                <%  ps = conexion.prepareStatement("SELECT ID, DESCRIPCION FROM REGION ");
                                    rs = ps.executeQuery();

                                    while (rs.next()) {
                                        out.println("<option value=" + rs.getInt("ID") + ">" + rs.getString("DESCRIPCION") + "</td>");
                                    }

                                %>
                            </select>                     
                        </div>

                        <div class="col s2">
                            <p>Comuna:</p>                            
                        </div>
                        <div class="col s4">
                            <select name="comuna" id="comuna" required>
                                <option value="" disabled selected>Seleccione Comuna:</option>
                                <% ps = conexion.prepareStatement("SELECT ID, DESCRIPCION FROM COMUNA ");
                                    rs = ps.executeQuery();

                                    while (rs.next()) {
                                        out.println("<option value=" + rs.getInt("ID") + ">" + rs.getString("DESCRIPCION") + "</td>");
                                    }

                                %>
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
                            <input name="clave" id="clave" type="password" class="validate"  required> 
                            <p></p>
                        </div>

                        <div class="center">
                            <input class="btn waves-effect red lighten-1" onclick="return validar()" type="submit" id="opcion" name="opcion" value="Registrar">
                        </div>                     
                    </form>
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
                                    var elems = document.querySelectorAll('.sidenav');
                                    var instances = M.Sidenav.init(elems, options);
                                });

                                document.addEventListener('DOMContentLoaded', function () {
                                    var elems = document.querySelectorAll('.modal');
                                    var instances = M.Modal.init(elems);
                                });

        </script>

        <script>
            string mensaje = "";
            M.toast({html: mensaje});
        </script>

        <script>
            var rut = document.getElementById('rut');
            var nombres = document.getElementById('nombres');
            var apellidos = document.getElementById('apellidos');
            var correo = document.getElementById('correo');
            var clave = document.getElementById('clave');
            var direccion = document.getElementById('direccion');
            var comuna = document.getElementById('comuna');
            var telefono = document.getElementById('telefono');


            function validar() {

                var letras = /[A-Za-zÑñÁÉÍÓÚáéíóú\s]$/;
                var email = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
                var alfanum = /^[\w\s]+$/;


                if (rut.value === '') {
                    alert('Rut es obligatorio');
                    rut.focus();
                    return false;
                }

                if (nombres.value === '') {
                    alert('Nombre es obligatorio');
                    nombres.focus();
                    return false;
                }

                if (!letras.test(nombres.value)) {
                    alert('Nombre solo admite letras y espacios');
                    nombres.focus();
                    return false;
                }

                if (apellidos.value === '') {
                    alert('Apellidos es obligatorio');
                    apellidos.focus();
                    return false;
                }

                if (!letras.test(apellidos.value)) {
                    alert('Apellidos solo admite letras y espacios');
                    apellidos.focus();
                    return false;
                }

                if (comuna.selectedIndex === 0) {
                    alert('Seleccione comuna');
                    return false;
                }

                if (direccion.value === '') {
                    alert('Dirección es obligatorio');
                    direccion.focus();
                    return false;
                }

                if (!alfanum.test(direccion.value)) {
                    alert('Dirección solo admite letras y números');
                    direccion.focus();
                    return false;
                }


                if (telefono.value === '') {
                    alert('Teléfono es obligatorio');
                    telefono.focus();
                    return false;
                }

                if (telefono.value.length < 16) {
                    alert('Ingrese un telefono válido');
                    telefono.focus();
                    return false;
                }

               // if (correo.value === '') {
                   // alert('Correo es obligatorio');
                   // correo.focus();
                  //  return false;
              //  }

                //if (!email.test(correo.value)) {
                 //   alert('Correo no es válido');
                   // correo.focus();
                    //return false;
                //}


                if (clave.value === '') {
                    alert('Clave es obligatorio');
                    clave.focus();
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
