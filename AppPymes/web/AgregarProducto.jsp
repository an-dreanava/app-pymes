<%-- 
    Document   : EditarProducto
    Created on : may 22, 2021, 4:32:05 p.m.
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
                }
            }


        %>

        <header>
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
                    <h4 id="titulo_form_pymes">Agregar Producto</h4>
                </div>
            </div>
            <br><br>
            <form action="ControladorProductos" method="POST">
                <div class="container" id="form-producto">        
                    <div class="row">

                        <input id="id_pyme" name="id_pyme" type="hidden" value="<%=pyme.getId()%>">


                        <div class="col s1">
                            <h6>Titulo:</h6>                            
                        </div>
                        <div class="col s5">
                            <input name="titulo" id="titulo" type="text" class="validate" required> 
                        </div>

                        <div class="col s2">
                            <h6>Categoría:</h6>                            
                        </div>
                        <div class="col s4">
                            <select name="id_categoria" id="id_categoria" required>
                                <option value="" disabled selected>Seleccione Categoria:</option>
                                <%
                                    ProductoDAO ProductoDAO = new ProductoDAO();
                                    for (Categoria categoria : ProductoDAO.Categoria()) {
                                %>
                                <option value="<%=categoria.getId_categoria()%>"><%=categoria.getDescripcion()%></option>
                                <% }
                                %>
                            </select>
                        </div>
                        <br>
                        <div class="col s1">
                            <h6>Precio:</h6>
                        </div>
                        <div class="col s5">
                            <input name="precio" id="precio" type="number" class="validate" required>
                        </div>

                        <div class="col s2">
                            <h6>Stock</h6>
                        </div>
                        <div class="col s4">
                            <input name="stock" id="stock"  type="number" class='validate' required >
                        </div>

                        <div class="col s1">
                            <h6>Descripción:</h6>
                        </div>
                        <div class="col s5">
                            <textarea id="descripcion" name="descripcion" class="materialize-textarea"></textarea>
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


                        <br>                        
                    </div>
                </div>
                <div class="container row " id="form-producto">
                    <div class="col s5"></div>
                    <div class="input-field col s6">
                        <input class="btn waves-effect red lighten-1"  type="submit" id="opcion" name="opcion" value="Agregar">
                    </div>
                </div>
            </form>
        </div>


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
