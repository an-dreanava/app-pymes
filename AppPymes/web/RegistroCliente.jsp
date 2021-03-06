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
        <title>One Place</title>
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
                            <li><a href="Index.jsp" class="logo-banner" ><img  src="Imagenes/logo.png"></a></li>
                        </ul>                 
                        <div class="brand-logo center" id="titulo-banner">
                            <span href="#" >Registro</span>
                        </div>                
                        <ul id="nav-mobile" class="right hide-on-med-and-down black-text">
                            <a class="waves-effect  red lighten-1 btn modal-trigger" href="#modal1">Iniciar Sesi??n</a> 
                            <a class="waves-effect blue-grey darken-2 btn" href="IndexPyme.jsp">Para tiendas</a>              
                        </ul>
                    </div>
                </nav>
            </div>
        </header>

        <!-- Modal Iniciar Sesi??n -->
        <div id="modal1" class="modal">
            <form action="ControladorLoginCliente" method="POST">
                <div class="modal-content center container">
                    <h5 id="modal-text">INICIAR SESI??N</h5>
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
                            <label for="claveL">Contrase??a</label>
                        </div>
                        <div class="input-field col s12">
                            <input class="btn waves-effect blue-grey darken-2" type="submit" id="opcion" name="opcion" value="Iniciar">
                            <p class="center"><a href="" class="enlace">??Olvidaste tu contrase??a?</a></p>
                            <p class="center"><a href="" class="enlace">??No est??s registrado?</a></p>
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
                            <input name="rut" id="rut" type="text" class="validate" placeholder="Si termina en K reemplace por 0" required> 
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
                            <p>Regi??n:</p>                            
                        </div>
                        <div class="col s4">
                            <select name="region" id="region" onchange="cambiar_comuna()" required>
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
                            <p>Direcci??n:</p>                            
                        </div>
                        <div class="col s4">
                            <input name="direccion" id="direccion" type="text" class="validate"  required> 
                        </div>

                        <div class="col s2">
                            <p>Tel??fono:</p>                            
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
                            <p>Contrase??a:</p>                            
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
                        <h5 class="white-text"><img  src="Imagenes/logo-footer.png"></h5>
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
                            <li><a class="grey-text text-lighten-3" href="#!">T??rminos de servicio</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    ?? 2021 Copyright 
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
            var nombres = document.getElementById('nombres');
            var apellidos = document.getElementById('apellidos');
            var correo = document.getElementById('correo');
            var clave = document.getElementById('clave');
            var direccion = document.getElementById('direccion');
            var comuna = document.getElementById('comuna');
            var telefono = document.getElementById('telefono');


            function validar() {

                var letras = /[A-Za-z????????????????????????\s]$/;
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
                    alert('Direcci??n es obligatorio');
                    direccion.focus();
                    return false;
                }

                if (!alfanum.test(direccion.value)) {
                    alert('Direcci??n solo admite letras y n??meros');
                    direccion.focus();
                    return false;
                }


                if (telefono.value === '') {
                    alert('Tel??fono es obligatorio');
                    telefono.focus();
                    return false;
                }

                if (telefono.value.length < 17) {
                    alert('Ingrese un telefono v??lido');
                    telefono.focus();
                    return false;
                }

                if (correo.value === '') {
                    alert('Correo es obligatorio');
                    correo.focus();
                    return false;
                }

                if (!email.test(correo.value)) {
                    alert('Correo no es v??lido');
                    correo.focus();
                    return false;
                }

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
