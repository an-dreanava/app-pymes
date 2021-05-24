<%-- 
    Document   : RegistroPyme
    Created on : 15-05-2021, 13:42:43
    Author     : drean
--%>

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
                </div>
            </nav>
        </div>

        <div class="container">
            <h5 id="titulo_form_pymes">Formulario de Inscripción</h5>           
        </div>


        <!-- Modal Iniciar Sesión -->
        <div id="modal1" class="modal">
            <form action="ControladorLoginPyme" name="login" method="POST">
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
                        </div>
                    </div>                
                </div>
            </form>
        </div>

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
                        <input name="nombre" id="nombre" type="text" class="validate"  required>                            
                    </div>


                    <div class="col s2">
                        <p>Apellidos Titular:</p>                            
                    </div>
                    <div class="col s4">
                        <input name="apellido" id="apellido" type="text" class="validate"  required>                            
                    </div>

                    <div class="col s2">
                        <p>Región:</p>                            
                    </div>
                    <div class="col s4">
                        <select name="id_region" id="id_region" required>
                            <option value="" disabled selected>Seleccione Región</option>
                            <%
                                DireccionDAO DireccionDAO = new DireccionDAO();
                                for (Region region : DireccionDAO.Regiones()) {
                            %>
                            <option value="<%=region.getId()%>"><%=region.getName()%></option>
                            <% }
                            %>
                        </select>                     
                    </div>

                    <div class="col s2">
                        <p>Comuna:</p>                            
                    </div>
                    <div class="col s4">
                        <select name="id_comuna" id="id_comuna" required>
                            <option value="" disabled selected>Seleccione Comuna:</option>
                            <%
                                for (Comuna comuna : DireccionDAO.Comunas()) {
                            %>
                            <option value="<%=comuna.getId()%>"><%=comuna.getName()%></option>
                            <% }
                            %>
                        </select>                     
                    </div>

                    <div class="col s2">
                        <p>Dirección:</p>                            
                    </div>
                    <div class="col s4">
                        <input name="des_direccion" id="des_direccion" type="text" class="validate"  required> 
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
                        <input name="contrasena" id="contrasena" type="password" class="validate"  required> 
                        <p></p>
                    </div>

                    <div class="col s2">
                        <p>Categoria:</p>                            
                    </div>
                    <div class="col s4">
                        <select name="id_categoria" id="id_categoria" required>
                            <option value="" disabled selected>Seleccione Categoria:</option>
                            <%
                                PymeDAO PymeDAO = new PymeDAO();
                                for (Categoria categoria : PymeDAO.Categoria()) {
                            %>
                            <option value="<%=categoria.getId_categoria()%>"><%=categoria.getDescripcion()%></option>
                            <% }
                            %>
                        </select>                     
                    </div>
                    <div class="col s6 file-field input-field">
                        <div class="btn">
                            <span>Subir</span>
                            <input type="file">
                        </div>
                        <div class="file-path-wrapper">
                            <input name="foto" id="foto" class="file-path validate" type="text">
                        </div>
                    </div>

                    <div class="center">
                        <button class="btn waves-effect red lighten-1" type="submit" onclick="return validar()" id="opcion" name="opcion" value="Agregar">Registrarse</button>
                    </div>   

                </form>
            </div>
        </div>

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
               <script src="https://unpkg.com/imask"></script>
        <script>
            var phoneMask = IMask(
                    document.getElementById('telefono'), {
                mask: '(+56) 9 0000 0000'
            });
            var dynamicMask = IMask(
              document.getElementById('rut'),
              {
                mask: [
                  {
                    mask: '0.000.000-0'
                  },
                  {
                    mask: '00.000.000-0'
                  }
                ]
              });
        </script>


        <script>
            var rut = document.getElementById('rut');
            var nombre_pyme = document.getElementById('nombre_pyme');
            var nombre = document.getElementById('nombre');
            var apellido = document.getElementById('apellido');
            var correo = document.getElementById('correo');
            var contrasena = document.getElementById('contrasena');
            var des_direccion = document.getElementById('des_direccion');
            var id_comuna = document.getElementById('id_comuna');
            var id_categoria = document.getElementById('id_categoria');
            var telefono = document.getElementById('telefono');
            var foto = document.getElementById('foto');


            function validar() {

                var letras = /[A-Za-zÑñÁÉÍÓÚáéíóú\s]$/;
                var email = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
                var alfanum = /^[\w\s]+$/;


                if (rut.value === '') {
                    alert('Rut es obligatorio');
                    rut.focus();
                    return false;
                }
                
                if (rut.value.length < 11) {
                    alert('Ingrese un rut válido');
                    rut.focus();
                    return false;
                }

                
                if (nombre_pyme.value === '') {
                    alert('Nombre de tienda es obligatorio');
                    nombre_pyme.focus();
                    return false;
                }

                if (nombre.value === '') {
                    alert('Nombre titular es obligatorio');
                    nombre.focus();
                    return false;
                }

                if (!letras.test(nombre.value)) {
                    alert('Nombre solo admite letras y espacios');
                    nombre.focus();
                    return false;
                }

                if (apellido.value === '') {
                    alert('Apellido titular es obligatorio');
                    apellido.focus();
                    return false;
                }               

                if (!letras.test(apellido.value)) {
                    alert('Apellidos solo admite letras y espacios');
                    apellido.focus();
                    return false;
                }

                if (id_comuna.selectedIndex === 0) {
                    alert('Seleccione comuna');
                    return false;
                }

                if (des_direccion.value === '') {
                    alert('Dirección es obligatorio');
                    des_direccion.focus();
                    return false;
                }

                if (!alfanum.test(des_direccion.value)) {
                    alert('Dirección solo admite letras y números');
                    des_direccion.focus();
                    return false;
                }


                if (telefono.value === '') {
                    alert('Teléfono es obligatorio');
                    telefono.focus();
                    return false;
                }

                if (telefono.value.length < 17) {
                    alert('Ingrese un telefono válido');
                    telefono.focus();
                    return false;
                }

                if (correo.value === '') {
                    alert('Correo es obligatorio');
                    correo.focus();
                    return false;
                }

                if (!email.test(correo.value)) {
                    alert('Correo no es válido');
                    correo.focus();
                    return false;
                }

                if (contrasena.value === '') {
                    alert('Clave es obligatorio');
                    contrasena.focus();
                    return false;
                }
                
                if (id_categoria.selectedIndex === 0) {
                    alert('Seleccione categoria');
                    return false;
                }
                
                if (foto.value === '') {
                    alert('Foto es obligatorio');
                    foto.focus();
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
