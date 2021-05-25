<%-- 
    Document   : DatosPyme
    Created on : may 23, 2021, 10:49:01 p.m.
    Author     : AngieRiera
--%>
<%@page import="Modelo.Categoria"%>
<%@page import="Dao.ProductoDAO"%>
<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Modelo.Pyme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>One Place</title>
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
        <%
            Pyme pyme = null;
            String estadoSesion = "off";
            String tipo = "";

            HttpSession sesion = request.getSession(true);

            estadoSesion = (String) sesion.getAttribute("estadoSesion");
            tipo = (String) sesion.getAttribute("tipo");

            if (estadoSesion == null) {
                response.sendRedirect("Ventana_Mensajes.jsp?titulo=Acceso Denegado&mensaje=Debe iniciar sesion para acceder a esta seccion&boton=Volver&retorno=IndexPyme.jsp");
            } else {
                if (!tipo.equals("2")) {
                    response.sendRedirect("Ventana_Mensajes.jsp?titulo=Acceso Denegado&mensaje=Debe iniciar sesion como pyme para acceder a esta seccion&boton=Volver&retorno=IndexPyme.jsp");
                    sesion.setAttribute("usuario", null);
                    sesion.setAttribute("estadoSesion", "close");
                    sesion.invalidate();
                } else {
                    pyme = (Pyme) sesion.getAttribute("usuario");
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    Conexion con = new Conexion();
                    com.mysql.jdbc.Connection conexion = con.getConnection();
                    ps = conexion.prepareStatement("SELECT * FROM DIRECCION D INNER JOIN COMUNA CO ON D.ID_COMUNA = CO.ID INNER JOIN CIUDAD CI ON CO.ID_CIUDAD = CI.ID INNER JOIN REGION R ON CI.ID_REGION = R.ID INNER JOIN PYME P ON D.ID = P.ID_DIRECCION INNER JOIN CATEGORIA_PYME CA ON P.ID_CATEGORIA_PYME = CA.ID WHERE P.CORREO = ? ");
                    ps.setString(1, pyme.getCorreo());
                    rs = ps.executeQuery();


        %>

        <header>
            <div class="navbar-fixed">
                <nav class="white">
                    <div class="nav-wrapper">
                        <ul id="nav-mobile" class="left hide-on-med-and-down black-text">
                            <li><a href="MenuPyme.jsp" class="logo-banner" ><img  src="Imagenes/logo.png"></a></li>
                        </ul>               
                        <div class="brand-logo center" id="titulo-banner">
                            <span>Para Tiendas</span>
                        </div>                
                        <ul id="nav-mobile" class="right hide-on-med-and-down black-text">
                            <li>
                                <a class="" href="CerrarSesion.jsp"><i class="material-icons">exit_to_app</i></a>
                            </li>
                        </ul>
                        <ul id="slide-out" class="sidenav sidenav-fixed">
                            <li>
                                <div class="center">                                    
                                    <% out.println("<img src='Imagenes/" + pyme.getLogo() + "' class='logo-pyme circle'>"); %>
                                </div>
                            </li>
                            <li><div class="divider"></div></li>
                            <li><a href="MenuPyme.jsp"><i class="material-icons">view_module</i>Dashboard</a></li>
                            <li><div class="divider"></div></li>
                            <li><a href="DatosPyme.jsp"><i class="material-icons">settings</i>Mis datos</a></li>                            
                            <li><div class="divider"></div></li>
                            <li><a href="Catalogo.jsp"><i class="material-icons">shopping_cart</i>Catálogo</a></li> 
                            <li><div class="divider"></div></li>
                            <li><a class="waves-effect" href="#!"><i class="material-icons">description</i>Pedidos</a></li>
                                <% out.println("<li><a style='color:#9e9e9e;' class='' href='VistaPedidos.jsp?estado=1&titulo=Pedidos Nuevos&id=" + pyme.getId() + "'>Pedidos Nuevos</a></li>"); %>
                                <% out.println("<li><a style='color:#9e9e9e;' class='' href='VistaPedidos.jsp?estado=2&titulo=Pedidos Pendientes&id=" + pyme.getId() + "'>Pedidos Pendientes</a></li>"); %>
                                <% out.println("<li><a style='color:#9e9e9e;' class='' href='VistaPedidos.jsp?estado=3&titulo=Pedidos Finalizados&id=" + pyme.getId() + "'>Pedidos Finalizados</a></li>"); %>
                                <% out.println("<li><a style='color:#9e9e9e;' class='' href='VistaPedidos.jsp?estado=4&titulo=Pedidos Cancelados&id=" + pyme.getId() + "'>Pedidos Cancelados</a></li>");%>                          
                        </ul>

                        <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    </div>
                </nav>
            </div>
        </header>


        <main>

            <div id="menu-pymes" class="center">
                <br><br>
                <div class="container cyan lighten-5 banner-menu center">
                    <h4 id="titulo_form_pymes"><%=pyme.getNombrePyme()%></h4>
                </div>
            </div>
            <br><br>
            <form action="ControladorProductos" method="POST">
                <div class="container" id="form-producto">        
                    <div class="row">

                        <% while (rs.next()) {%>
                        <div class="col s5">
                            <img src="Imagenes/<%=pyme.getLogo()%>" class="imagen circle">
                        </div>
                        <br>
                        <div class="col s2 left-align">
                            <h6 style="font-size: 18px;">Titular:</h6>
                        </div>
                        <div class="col s5 left-align">
                            <h6 style="font-size: 18px;"><%=pyme.getNombre()+ " "+ pyme.getApellido() %></h6><br>
                        </div>
                        
                        <div class="col s2 left-align">
                            <h6 style="font-size: 18px;">Rut:</h6>
                        </div>
                        <div class="col s5 left-align">
                            <h6 style="font-size: 18px;"><%=pyme.getRut() %></h6><br>
                        </div>
                        
                        <div class="col s2 left-align">
                            <h6 style="font-size: 18px;">Correo:</h6>
                        </div>
                        <div class="col s5 left-align">
                            <h6 style="font-size: 18px;"><%=pyme.getCorreo() %></h6><br>
                        </div>
                        
                        <div class="col s2 left-align">
                            <h6 style="font-size: 18px;">Teléfono:</h6>
                        </div>
                        <div class="col s5 left-align">
                            <h6 style="font-size: 18px;"><%=pyme.getTelefono() %></h6><br>
                        </div>
                        
                        <div class="col s2 left-align">
                            <h6 style="font-size: 18px;">Categoría:</h6>
                        </div>
                        <div class="col s5 left-align">
                            <h6 style="font-size: 18px;"><%=rs.getString("CA.DESCRIPCION")%></h6><br>
                        </div>
                        <br>
                        <div class="col s2 left-align">
                            <h6 style="font-size: 18px;">Dirección:</h6>
                        </div>
                        <div class="col s5 left-align">
                            <h6 style="font-size: 18px;"><%=rs.getString("D.DESCRIPCION") + ", " + rs.getString("CO.DESCRIPCION") + ", " + rs.getString("R.DESCRIPCION")%></h6>
                        </div>


                        
                        <% }
                                }
                            }%>
                    </div>
                </div>
            </form>

    </main>


    <!--JavaScript at end of body for optimized loading-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });

        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.fixed-action-btn');
            var instances = M.FloatingActionButton.init(elems, options);
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

        $(document).ready(function () {
            $('.sidenav').sidenav({
            });
        });


    </script>
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
