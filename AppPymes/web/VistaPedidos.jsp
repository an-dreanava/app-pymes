<%-- 
    Document   : VistaPedidos
    Created on : may 20, 2021, 11:09:40 p.m.
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

        <link type="text/css" rel="stylesheet" href="css/estilo.css" />
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
    </head>
    <body>
        <%

            String titulo = request.getParameter("titulo");
            int estado = Integer.parseInt(request.getParameter("estado"));

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
                    int id = Integer.parseInt(request.getParameter("id"));
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    Conexion con = new Conexion();
                    com.mysql.jdbc.Connection conexion = con.getConnection();
                    ps = conexion.prepareStatement("SELECT * FROM PEDIDOS PE INNER JOIN CLIENTE CL ON PE.RUT_CLIENTE = CL.RUT INNER JOIN PYME PY ON PE.ID_PYME = PY.ID WHERE PE.ID_PYME = ? AND PE.ID_ESTADO_PEDIDO = ?");
                    ps.setInt(1, id);
                    ps.setInt(2, estado);
                    rs = ps.executeQuery();


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
                            <li><a href="#!">First Sidebar Link</a></li>
                            <li><a href="#!">Second Sidebar Link</a></li>
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
                    <h4 id="titulo_form_pymes"><%=titulo%></h4>
                </div>


                <div class="container center dashboard" style="padding: 20px" >
                    <table  class="striped centered" id="resultados" >
                        <thead>
                            <tr>
                                <th>Número de Solicitud</th>
                                <th>Cliente</th>
                                <th>Fecha Pedido</th>
                                <th>Total</th>
                                <th></th>
                                <th></th>

                            </tr>
                        </thead>

                        <tbody id="miTabla">
                            <%while (rs.next()) {
                                            out.println("<tr>");
                                            out.println("<td>" + rs.getInt("PE.BOLETA") + "</td>");
                                            out.println("<td>" + rs.getString("CL.NOMBRES") + " " + rs.getString("CL.APELLIDOS") + "</td>");
                                            out.println("<td>" + rs.getString("PE.FECHA") + "</td>");
                                            out.println("<td>$" + " " + rs.getString("PE.TOTAL") + "</td>");
                                            out.println("<td>CHAT</td>");
                                            out.println("<td>DOCUMENTO</td>");

                                        }
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>



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
</body>
</html>

