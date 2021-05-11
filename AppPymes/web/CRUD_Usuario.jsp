<%-- 
    Document   : CRUD_Usuario
    Created on : may 23, 2020, 12:17:36 a.m.
    Author     : angie_yuixay4
--%>

<%@page import="Modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Somos Mejores</title>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">

    </head>
    <body bgcolor="#f9fbe7" >
 
       
        
        <nav class="nav-extended">
            <div class="nav-wrapper">
                <a href="#" class="brand-logo center">REGISTRO DE USUARIO</a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>               
            </div>
        </nav>
        <br>
        <div class="container white" style="padding: 20px" >
            <div class="row" >
                <form action="ControladorUsuario" method="POST">
                    <div class="input-field col s6">
                        <input name="rut" id="rut" type="text"  class="validate" >
                        <label for="rut">Rut</label>
                    </div>

                    <div class="input-field col s6">
                        <input name="nombre" id="nombre" type="text" class="validate" required>
                        <label for="nombre">Nombre</label>
                    </div>

                    <div class="input-field col s6">
                        <input name="apellido1" id="apellido1" type="text" class="validate" required>
                        <label for="apellido1">Apellido Paterno</label>
                    </div>

                    <div class="input-field col s6">
                        <input name="apellido2" id="apellido2" type="text" class="validate">
                        <label for="apellido2">Apellido Materno</label>
                    </div>

                                     
                    <div class="input-field col s6">
                        <input name="telefono" id="telefono" type="text" class="validate" required>
                        <label for="telefono">Telefono</label>
                    </div>

                    <div class="input-field col s6">
                        <input name="correo" id="correo" type="text" class="validate" required>
                        <label for="correo">Correo</label>
                    </div>

                    <div class="input-field col s6">
                        <input name="clave" id="clave" type="password" class="validate" required minlength="6" >
                        <label for="clave">Clave</label>
                    </div>

                    <div class="input-field col s6">
                        <input name="clave2" id="clave2" type="password" class="validate" required  minlength="6" >
                        <label for="clave2">Confirme Clave</label>
                    </div>

                    <div class="clearfix"></div>

                    <div class="input-field col s6 center-align">
                        <input class="waves-effect waves-light btn" type="submit" name="opcion" value="Registrar"> 
                    </div>

                    <div class="input-field col s6 center-align">
                        <a class="waves-effect waves-light btn" href="editar.jsp">Editar</a>
                    </div>
                </form>
                <span id="error"></span>
            </div>

        </div>
        <p class="z-depth-3"></p>
        <br>



        




        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>

        <script>
            $(document).ready(function () {
                $('input#input_text, textarea#textarea2').characterCounter();
            });
            
            $(document).ready(function () {
                $('select').formSelect();
            });
            
            $("#rut").mask("99999999-9", {reverse: true});
            
            $('#clave2').keyup(function(){
                var clave = $('#clave').val();
                var clave2 = $('#clave2').val();
                
                if (clave == clave2){
                    $('#error').text("Coinciden!").css("color", "green");
                }else{
                    $('#error').text("Las claves no coinciden").css("color", "red");
                }
            });



        </script>
    </body>
</html>
