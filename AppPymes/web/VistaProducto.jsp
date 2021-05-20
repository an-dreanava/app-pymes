<%-- 
    Document   : VistaProducto
    Created on : 18-05-2021, 19:26:19
    Author     : Paula Poblete
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
        <link href="css/jquery.nice-number.css" rel="stylesheet">


        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
        <link type="text/css" rel="stylesheet" href="css/estilo.css" />

    </head>
    <body>

        <%
            String id = "";
            id = request.getParameter("id");

            PreparedStatement ps = null;
            ResultSet rs = null;
            Conexion con = new Conexion();
            com.mysql.jdbc.Connection conexion = con.getConnection();
            ps = conexion.prepareStatement("SELECT PR.FOTO,PR.TITULO,PY.NOMBRE_PYME,PR.PRECIO, PR.DESCRIPCION FROM PRODUCTOS PR INNER JOIN PYME PY ON PR.ID_PYME = PY.ID  WHERE PR.ID =? ");
            ps.setString(1, id);
            rs = ps.executeQuery();
            
        %>
        
        
        <script>
            $(document).ready(function () {

                $('input[type="number"]').each(function () {
                    var name = $(this).attr('name');
                    value = localStorage.getItem(name);
                    var value = $(this).val(value);
                });

                setInterval(function () {
                    $('input[type="number"]').each(function () {
                        var name = $(this).attr('name');
                        var value = $(this).val();
                        localStorage.setItem(name, value);
                    });

                    
                }, 1000);
            });

            $(document).ready(function () {
                $('#confirmar').click(function () {
                    /*Obtener datos almacenados*/
                    let cant = 0;
                    cant = localStorage.getItem("cant");
                    /*Mostrar datos almacenados*/
                    document.getElementById("cantidad").innerHTML = cant + " Unid.";
                    
                    let precio = document.getElementById("precio").textContent;
                    localStorage.setItem("preciooooo", precio);
                    
                    let total = parseInt(cant) * parseInt(precio);
                    
                    document.getElementById("total").innerHTML = "Total $" + total;
                });
            });
        </script>

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
<<<<<<< HEAD
            <br>
            <div class="divider"></div>
            <div class="container">
                <div class="row">
                    <div class="col s2">
                        <a href=""><i class="material-icons">navigate_before</i></a>                        
                    </div>
                </div>

            </div>
            <div class="container">

                <div class="">
                    <fieldset>
                        <img src="Imagenes/imagen.jpg" class="imagen">
                        <div class="Info">
                            <div class="container">
                                <h5>NOMBRE PRODUCTO <a class="fav right" href=""><i class="material-icons">favorite</i></a> </h5> 
                            </div>

                            <label>NOMBRE TIENDA </label>
                            <div class="row">
                                <div class="col s2">
                                    <h5>$15.000</h5>                        
                                </div>
                                <div class="col s3 box">
                                    <input name="cant" id="cant" value="1" type="number" class="validate"  required> 
                                </div>
                                <div class="col s7">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                        consequat. </p>                      
                                </div>
                                <div class="col s7">
                                    <a class="waves-effect  red lighten-1 btn modal-trigger white-text" href="#modal1" id="modall">COMPRAR</a>
                                </div>
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

                                        </div>                
                                    </div>
                     
                        </div>
=======


            <div id="modal2" class="modal">
                <form action="" method="POST">
                    <div class="modal-content">
                        <h5 id="modal-text" class="center">CONFIRMAR COMPRA</h5>


                        <img src="Imagenes/imagen.jpg" class="imagenmodal">
                        <div class="container" id="confirmar-compra">
                            <div class=" left">
                                <h5>NOMBRE PRODUCTO </h5> 

                                <label class="left" id="nom">NOMBRE TIENDA </label><br>
                                <div class="row">
                                    <div class="col s4">
                                        <h6>$15.000</h6>                        
                                    </div>
                                    <div class="col s3">
                                        <h6 id="cantidad" type="text"></h6>
                                    </div>
                                    <div class="col s7 ">
>>>>>>> c5dcf938ca228f87e5efa386d775086e73e24098

                                        <h5 id="total"></h5>
                                    </div>

                                    <div class="col s7 center">
                                        <br>
                                        <a class="waves-effect  red lighten-1 btn modal-trigger white-text" >CONFIRMAR</a>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                </form>
            </div>

<<<<<<< HEAD





        </main>
        <footer class="page-footer blue-grey darken-2">
=======
            <br><br>
            <div class="divider"></div>
>>>>>>> c5dcf938ca228f87e5efa386d775086e73e24098
            <div class="container">
                <div class="row">
                    <div class="col s2">
                        <a href=""><i class="material-icons">navigate_before</i></a>                        
                    </div>
                </div>
            </div>
            <div class="divider"></div>
            <br><br>

            <div class="container">
                <div class="">
                    <fieldset>
                        <% while (rs.next()) {
                                out.println("<img src='Imagenes/" + rs.getString("PR.FOTO") + "' class='imagen'>");
                                out.println("<div class='Info'>");

                                out.println("<div class='container'>");
                                out.println("<h5><a class='fav right' href=''><i class='material-icons'>favorite</i></a> " + rs.getString("PR.TITULO") + " </h5> ");
                                out.println("</div>");
                                out.println("<div class='divider'></div>");
                                out.println("<h6>" + rs.getString("PY.NOMBRE_PYME") + "</h6>");
                                out.println("<div class='row'>");
                                out.println("<div class='col s2'>");
                                out.println("<h5 id='precio'>"+ rs.getInt("PR.PRECIO")+"</h5>");
                                out.println("</div>");
                                out.println("<div class='col s3 box'>");
                                out.println("<input name='cant' id='cant' value='1' type='number' class='validate'  required>");
                                out.println("</div>");
                                out.println("<div class='col s7'>");
                                out.println("<p>" + rs.getString("PR.DESCRIPCION") + "</p>");
                                out.println("</div>");
                                out.println("<div class='col s7 left'>");
                                out.println("<a class='waves-effect  red lighten-1 btn modal-trigger white-text' href='#modal2' id='confirmar'>COMPRAR</a>");
                                
                                out.println("</div>");
                            }%>
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


<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous">
</script>
<script src="js/jquery.nice-number.js"></script>

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

</script>


</body>
</html>
