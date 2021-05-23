<%-- 
    Document   : CategoriaProductos
    Created on : 17-05-2021, 16:45:37
    Author     : Paula Poblete
--%>

<%@page import="Modelo.Cliente"%>
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
            Cliente cliente = null;
            String estadoSesion = "off";
            String tipo = "";

            HttpSession sesion = request.getSession(true);

            estadoSesion = (String) sesion.getAttribute("estadoSesion");
            tipo = (String) sesion.getAttribute("tipo");

            if (estadoSesion == null) {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Acceso Denegado&mensaje=Debe iniciar sesion para acceder a esta seccion&boton=Volver&retorno=Index.jsp");
            } else {
                if (!tipo.equals("1")) {
                    response.sendRedirect("Ventana_Mensajes.jsp?titulo=Acceso Denegado&mensaje=Debe iniciar sesion como cliente para acceder a esta seccion&boton=Volver&retorno=Index.jsp");
                    sesion.setAttribute("usuario", null);
                    sesion.setAttribute("estadoSesion", "close");
                    sesion.invalidate();
                } else {
                    cliente = (Cliente) sesion.getAttribute("usuario");
                }
            }

            String id = "";
            id = request.getParameter("id");

            PreparedStatement ps = null;
            ResultSet rs = null;
            Conexion con = new Conexion();
            com.mysql.jdbc.Connection conexion = con.getConnection();
            ps = conexion.prepareStatement("SELECT * FROM PRODUCTOS PR INNER JOIN PYME PY ON PR.ID_PYME = PY.ID INNER JOIN CATEGORIA_PRODUCTO CA ON PR.ID_CATEGORIA_PRODUCTO = CA.ID WHERE PR.ID_CATEGORIA_PRODUCTO =? ");
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
                                    out.println("<span href=''>" + rs.getString("CA.DESCRIPCION") + "</span>");
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
                            <li>
                                <a class="" href="CerrarSesion.jsp"><i class="material-icons">exit_to_app</i></a> 
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
                        <a href="IndexCliente.jsp">
                            <i class="material-icons left" >navigate_before</i>
                            <label class="label-volver">VOLVER</label>  
                        </a>
                    </div>
                </div>
            </div>
            <div class="divider separador"></div>

            <div class="container" id="">        

                <div class="row">
                    <% while (rs.next()) {
                            out.println("<div class='col 12 m3 s10'>");
                            out.println("<div class='card sticky-action tarjeta'>");
                            out.println("<div class='card-image tarjeta-imagen'>");
                            out.println("<a href='VistaProducto.jsp?id=" + rs.getString("PR.ID") + "' >");
                            out.println("<img src='Imagenes/" + rs.getString("PR.FOTO") + "' height='200' class='responsive-img' >");
                            out.println("</a>");
                            out.println("</div>");
                            out.println("<div class='card-content tarjeta-contenido'>");
                            out.println("<label class='left'>" + rs.getString("PY.NOMBRE_PYME") + "</label> <br>");
                            out.println("<a class='right' href=''><i class='material-icons'>favorite_border</i></a>");
                            out.println("<p class='center'>" + rs.getString("PR.TITULO") + "</p>");
                            out.println("<label class='label-precio2'>$</label>");
                            out.println("<label class='center label-precio2'>" + rs.getString("PR.PRECIO") + "</label>");

                            out.println("</div>");

                            out.println("</div>");
                            out.println("</div>");
                        }%>
                </div>
            </div>

        </main>


        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>

        <script>
            // función encargada de la redirección
            function redireccion() {
                window.location = "Index.jsp";
            }

            // se llamará a la función que redirecciona después de 90 minutos (5400000 milisegundos)
            var temp = setTimeout(redireccion, 5400000);

            // cuando se pulse en cualquier parte del documento
            document.addEventListener("mousemove", function () {
                // borrar el temporizador que redireccionaba
                clearTimeout(temp);
                // y volver a iniciarlo
                temp = setTimeout(redireccion, 5400000);
            });
        </script>

    </body>
</html>
