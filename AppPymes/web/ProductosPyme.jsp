<%-- 
    Document   : ProductosPyme
    Created on : may 18, 2021, 9:26:22 p.m.
    Author     : AngieRiera
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
            String id = "";
            id = request.getParameter("id");

            PreparedStatement ps = null;
            ResultSet rs = null;
            Conexion con = new Conexion();
            com.mysql.jdbc.Connection conexion = con.getConnection();
            ps = conexion.prepareStatement("SELECT * FROM PRODUCTOS PR INNER JOIN PYME PY ON PR.ID_PYME = PY.ID  WHERE PY.ID =? ");
            ps.setString(1, id);
            rs = ps.executeQuery();
        %>
        <header>

            <div class="navbar-fixed">
                <nav class="white">
                    <div class="nav-wrapper">
                        <ul id="nav-mobile" class="left hide-on-med-and-down black-text">
                            <li><a href="sass.html" >Nombre</a></li>
                        </ul>                
                        <div class="brand-logo center" id="titulo-banner">
                            <% if (rs.next()) {
                                    out.println("<span href=''>" + rs.getString("PY.NOMBRE_PYME") + "</span>");
                                }%>
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
            <div class="banner">
                <img src="Imagenes/oferta1.png" class="responsive-img">

            </div>
            <br>

            <div class="divider"></div>
            <div class="container">
                <div class="row">
                    <div class="col s4 ">
                        <a href="InicioCliente.jsp">
                            <i class="material-icons left" >navigate_before</i>
                            <h6 color="#fafafa">VOLVER</h6>  
                        </a>
                    </div>
                </div>
            </div>
            
            <br>
            <div class="divider"></div>
            <div class="container">
                <h6 color="#fafafa">CATÁLOGO</h6>
            </div>
            <div class="divider"></div>
            <br>

            <div class="container" id="">        

                <div class="row">
                    <% while (rs.next()) { 
                            out.println("<div class='col 12 m3 s10'>");
                            out.println("<div class='card sticky-action tarjeta'>");
                            out.println("<div class='card-image tarjeta-imagen'>");
                            out.println("<a href='VistaProducto.jsp?id="+ rs.getString("PR.ID") +"' >");
                            out.println("<img src='Imagenes/" + rs.getString("PR.FOTO") + "' height='200' class='responsive-img' >");
                            out.println("</a>");
                            out.println("</div>");
                            out.println("<div class='card-content tarjeta-contenido'>");
                            out.println("<label class='left'>" + rs.getString("PY.NOMBRE_PYME") + "</label> <br>");
                            out.println("<a class='right' href=''><i class='material-icons'>favorite_border</i></a>");
                            out.println("<p class='center'>" + rs.getString("PR.TITULO") + "</p>");
                            out.println("<p class='center' style='font-size: large;'>" + rs.getString("PR.PRECIO") + "</p>");

                            out.println("</div>");

                            out.println("</div>");
                            out.println("</div>");
                        }%>
                </div>
            </div>

        </main>


        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>



    </body>
</html>