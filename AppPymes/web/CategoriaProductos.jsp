<%-- 
    Document   : CategoriaProductos
    Created on : 17-05-2021, 16:45:37
    Author     : Paula Poblete
--%>

<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.ResultSet"%>
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
                            <li><a href="sass.html" >Nombre</a></li>
                        </ul>                
                        <div class="brand-logo center" id="titulo-banner">
                            <span href="#" >Nombre Tienda</span>
                        </div>                
                        <ul id="nav-mobile" class="right hide-on-med-and-down black-text">
                            <a class="waves-effect  red lighten-1 btn modal-trigger" href="#modal1">Iniciar Sesión</a> 
                            <a class="waves-effect blue-grey darken-2 btn" href="IndexPyme.jsp">Para tiendas</a>              
                        </ul>
                    </div>
                </nav>
            </div>
        </header>

        <div class="container" id="">
            <div class="row">

                <h6>Categoria 1</h6>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                   
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                        <br>
                    </div>
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                   
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                
                </div>
                <div class="col 12 s2 ">  
                    <div class="card sticky-action tarjeta" >
                        <div class="card-image" >

                            <img src="Imagenes/imagen.jpg" class="img-thumbnail">

                        </div>
                        <div class="card-content">
                            <h9 class="centrado">PRODUCTO</h9>         
                            <p>$12.000</p>
                        </div>            
                        <div class="card-action deep-purple boton">
                            <a href="" class="agregar white-text " data-id="1">COMPRAR</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
