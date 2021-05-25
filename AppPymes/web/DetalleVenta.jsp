<%-- 
    Document   : DetalleVenta
    Created on : may 23, 2021, 8:14:10 p.m.
    Author     : AngieRiera
--%>

<%@page import="Modelo.Pyme"%>
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
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
        <link type="text/css" rel="stylesheet" href="css/estilo.css" />
    </head>
    <body>
        <%
            Pyme pyme = null;
            String estadoSesion = "off";
            String tipo = "";

            HttpSession sesion = request.getSession(true);

            estadoSesion = (String) sesion.getAttribute("estadoSesion");
            tipo = (String) sesion.getAttribute("tipo");
            PreparedStatement ps = null;
            ResultSet rs = null;
            Conexion con = new Conexion();
            com.mysql.jdbc.Connection conexion = con.getConnection();

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
                    int id = Integer.parseInt(request.getParameter("id"));

                    ps = conexion.prepareStatement("SELECT * FROM PEDIDOS PE INNER JOIN CLIENTE C ON PE.RUT_CLIENTE = C.RUT INNER JOIN PRODUCTOS PR ON PE.ID_PRODUCTO = PR.ID INNER JOIN ESTADO_PEDIDO E ON PE.ID_ESTADO_PEDIDO = E.ID INNER JOIN DIRECCION D ON C.ID_DIRECCION = D.ID INNER JOIN COMUNA CO ON D.ID_COMUNA = CO.ID INNER JOIN CIUDAD CI ON CO.ID_CIUDAD = CI.ID INNER JOIN REGION RE ON CI.ID_REGION = RE.ID WHERE PE.BOLETA = ?");
                    ps.setInt(1, id);
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
                    <h4 id="titulo_form_pymes">Detalle Venta</h4>
                </div>


                <div class="container center dashboard" style="padding: 20px" >
                    <% while (rs.next()) {%>
                    <div class="row">
                        <div class="col s6 ">
                            <div class="col s6  left-align">
                                <h5 style="font-weight: bold;">Boleta N°<%=rs.getString("PE.BOLETA")%> </h5>
                            </div>

                            <div class="col s12  left-align">
                                <label style="font-size: 15px;"><%=rs.getString("PE.FECHA")%> </label>
                            </div>
                            <div class="col s12 left">
                                <img src="Imagenes/<%=rs.getString("PR.FOTO")%>" style="height: 300px;" class="left">
                            </div>

                            <div class="col s12 left-align">
                                <h6 style="font-weight: bold; font-size: 20px;"><%=rs.getString("PR.TITULO")%></h6>
                            </div>
                            <div class="col s6 left-align">
                                <h6 style="font-size: 18px;">Precio $<%=rs.getString("PR.PRECIO")%></h6>
                            </div>
                            <div class="col s6 left-align">                                
                                <h6 style="font-size: 18px;"><%=rs.getString("PE.CANTIDAD")%> Unid.</h6>
                            </div>
                            <div class="col s12 left-align">
                                <h6 style="font-weight: bold; font-size: 20px;">Total: $<%=rs.getString("PE.TOTAL")%></h6>
                            </div>

                        </div>

                        <div class="col s6">                            
                            <div class="col s3 left-align">
                                <h6 style="font-size: 18px;">Estado:</h6>
                            </div>
                            <div class="col s6 left-align">
                                <h6 style="font-size: 18px; color: green;"><%=rs.getString("E.DESCRIPCION")%></h6>
                            </div>
                            <div class="col s3 left-align">
                                <a class="waves-effect  red lighten-1 btn-small white-text modal-trigger" href="#modal2">Cambiar Estado</a> 
                            </div>
                            <br><br><br>
                            <div class="col s12 left-align">
                                <h5 style="font-weight: bold;">Datos Comprador </h5>
                            </div>
                            <div class="col s5 left-align">
                                <h6>Nombre: </h6>
                            </div>
                            <div class="col s6 left-align">
                                <h6><%=rs.getString("C.NOMBRES") + " " + rs.getString("C.APELLIDOS")%></h6>
                                <br>
                            </div>

                            <div class="col s5 left-align">
                                <h6>Rut: </h6>
                            </div>
                            <div class="col s6 left-align">                                    
                                <h6><%=rs.getString("C.RUT")%> </h6>
                                <br>
                            </div>

                            <div class="col s5 left-align">
                                <h6>Correo: </h6>
                            </div>
                            <div class="col s6 left-align">
                                <h6><%=rs.getString("C.CORREO")%></h6>   
                                <br>
                            </div>

                            <div class="col s5 left-align">
                                <h6>Teléfono: </h6>
                            </div>
                            <div class="col s6 left-align">
                                <h6><%=rs.getString("C.TELEFONO")%></h6>     
                                <br>
                            </div>
                            <div class="col s12 left-align">
                                <h6>Dirección: </h6>
                            </div>
                            <div class="col s12 left-align">
                                <h6><%=rs.getString("D.DESCRIPCION") + ", " + rs.getString("CO.DESCRIPCION") + ", " + rs.getString("RE.DESCRIPCION")%></h6>
                            </div>


                            
                        </div>
                    </div>

                </div>
            </div>        
        </main>

        <!-- Modal Cambiar estado -->
        <div id="modal2" class="modal" style="width: 400px; height: 400px;">
            <form action="ControladorPedido" method="POST">
                <input id="boleta" name="boleta" type="hidden" value="<%=rs.getString("PE.BOLETA")%>">
                <% } } %>
                <div class="modal-content center container">
                    <h5 id="modal-text">CAMBIAR ESTADO</h5>
                    <br><br>
                    <div class="row">
                        <div class="input-field col s12">
                            <select name="estado" id="estado" required>
                                <option value="" disabled selected>Seleccione Estado</option>
                                <% ps = conexion.prepareStatement("SELECT * FROM ESTADO_PEDIDO");
                                    rs = ps.executeQuery();
                                    while (rs.next()) {
                                        out.println("<option value=" + rs.getInt("ID") + ">" + rs.getString("DESCRIPCION") + "</td>");
                                    }
                                %>

                            </select> 
                        </div>                                
                        <div class="input-field col s12">
                            <br><br>
                            <input class="btn waves-effect blue-grey darken-2" type="submit" id="opcion" name="opcion" value="Cambiar">
                        </div>
                    </div>                
                </div>
            </form>
        </div>
        <% }%>

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
