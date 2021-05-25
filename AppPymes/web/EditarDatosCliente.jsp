<%-- 
    Document   : EditarDatosCliente
    Created on : may 23, 2021, 5:36:21 p.m.
    Author     : AngieRiera
--%>

<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Modelo.Cliente"%>
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


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <link type="text/css" rel="stylesheet" href="css/estilo.css" />
    </head>
    <body>
        <%
            Cliente cliente = null;
            String estadoSesion = "off";

            HttpSession sesion = request.getSession(true);

            estadoSesion = (String) sesion.getAttribute("estadoSesion");
            String tipo = (String) sesion.getAttribute("tipo");

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

            PreparedStatement ps = null;
            ResultSet rs = null;
            Conexion con = new Conexion();
            com.mysql.jdbc.Connection conexion = con.getConnection();
        %>
        <header>
            <div class="navbar-fixed">
                <nav class="white nav-extended">
                    <div class="nav-wrapper">
                        <ul id="nav-mobile" class="left hide-on-med-and-down black-text">
                            <li><a href="IndexCliente.jsp" class="logo-banner" ><img  src="Imagenes/logo.png"></a></li>
                        </ul>                 
                        <div class="brand-logo center" id="titulo-banner">
                            <span href="#" >Tiendas</span>
                        </div>                
                        <ul id="nav-mobile" class="right hide-on-med-and-down black-text">
                            <li>
                                <a class="" href="DetallesCuenta.jsp"><i class="material-icons">account_circle</i></a>                                 
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
            <br><br><br>
            <div class="container">
                <div class="row">
                    <div class="col s12">
                        <ul class="tabs">
                            <li class="tab col s6"><a class="active" href="#tab1">Información Personal</a></li>
                            <li class="tab col s6 disabled"><a href="#tab2" style="color: gray;">Pedidos</a></li>
                        </ul>
                    </div>
                    <div id="tab1" class="col s12">
                        <div class="row">
                            <form action="ControladorCliente" method="POST">
                                <div class="col s6">
                                    <div class="col s12">
                                        <input hidden  name="rut" id="rut" type="text" class="validate"  required value="<%=cliente.getRut()%> ">                                                          
                                    </div>


                                    <div class="col s5">
                                        <h6>Nombres: </h6>
                                    </div>
                                    <div class="col s6">
                                        <input name="nombres" id="nombres" type="text" class="validate"  required value="<%=cliente.getNombre()%>">                      
                                    </div>

                                    <br><br>

                                    <div class="col s5">
                                        <h6>Apellidos: </h6>
                                    </div>
                                    <div class="col s6">
                                        <input name="apellidos" id="apellidos" type="text" class="validate"  required value="<%=cliente.getApellido()%>">
                                    </div>
                                    <br><br>                                    

                                    <div class="col s5">
                                        <h6>Correo: </h6>
                                    </div>
                                    <div class="col s6">
                                        <input name="correo" id="correo" type="text" class="validate"  required value="<%=cliente.getCorreo()%>">                      
                                    </div>

                                    <br><br>

                                    <div class="col s5">
                                        <h6>Teléfono: </h6>
                                    </div>
                                    <div class="col s6">
                                        <input name="telefono" id="telefono" type="text" class="validate"  required value="<%=cliente.getTelefono()%>"> 
                                    </div>                                
                                    <br>
                                </div>
                                    
                                    <%-- OBTENER COMUNA Y REGION DEL CLIENTE --%>
                                    <%      int id_comuna,id_region=0;
                                            String des_comuna,des_region="";
                                            ps = conexion.prepareStatement("SELECT d.id_comuna, co.descripcion, ci.id, r.id, r.descripcion "
                                            + "FROM direccion d INNER JOIN comuna co ON d.id_comuna = co.id INNER JOIN ciudad ci ON co.id_ciudad = ci.id "
                                            + "INNER JOIN region r ON r.id = ci.id_region WHERE d.id =(SELECT id_direccion FROM cliente WHERE rut=?)");
                                            ps.setString(1, cliente.getRut());
                                            rs = ps.executeQuery();
                                            while (rs.next()) {
                                            id_comuna=rs.getInt("d.id_comuna");
                                            des_comuna=rs.getString("co.descripcion");
                                            id_region=rs.getInt("r.id");
                                            des_region=rs.getString("r.descripcion");
                                    %>

                                <div class="col s6">
                                    <div class="col s5">
                                        <h6>Región:</h6>         
                                    </div>
                                    <div class="col s6">
                                        <select name="region" id="region" required>
                                            <option value="<%=id_region%>"><%=des_region%></option>
                                            <%  ps = conexion.prepareStatement("SELECT ID, DESCRIPCION FROM REGION ");
                                                rs = ps.executeQuery();

                                                while (rs.next()) {
                                                    out.println("<option value=" + rs.getInt("ID") + ">" + rs.getString("DESCRIPCION") + "</td>");
                                                }

                                            %>
                                        </select>    
                                    </div>

                                    <br><br>

                                    <div class="col s5">
                                        <h6>Comuna:</h6>         
                                    </div>
                                    <div class="col s6">
                                        <select name="comuna" id="comuna" required>
                                            <option value="<%=id_comuna%>"><%=des_comuna%></option>
                                            <% ps = conexion.prepareStatement("SELECT ID, DESCRIPCION FROM COMUNA ");
                                                rs = ps.executeQuery();

                                                while (rs.next()) {
                                                    out.println("<option value=" + rs.getInt("ID") + ">" + rs.getString("DESCRIPCION") + "</td>");
                                                }

                                            %>
                                        </select>     
                                    </div>
                                    <%                                        
                                        ps = conexion.prepareStatement("SELECT D.DESCRIPCION FROM CLIENTE CL INNER JOIN DIRECCION D ON CL.ID_DIRECCION = D.ID WHERE CL.RUT = ?");
                                        ps.setString(1, cliente.getRut());
                                        rs = ps.executeQuery();
                                        while (rs.next()) {
                                    %>
                                    <div class="col s5">
                                        <h6>Dirección </h6>
                                    </div>
                                    <div class="col s6">
                                        <input name="direccion" id="direccion" type="text" class="validate"  required value="<%= rs.getString("D.DESCRIPCION")%>"> 
                                    </div>

                                    <div class="col s12 center">
                                        <br><br><br>
                                        <div class="center">
                                            <a class="waves-effect blue-grey darken-2 btn white-text" href="DetallesCuenta.jsp">Cancelar</a>
                                            <input class="btn waves-effect red lighten-1" type="submit" id="opcion" name="opcion" value="Actualizar">
                                        </div> 
                                    </div>
                                    <% }}%>
                                </div>
                            </form>
                        </div>

                    </div>

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

            var el = document.querySelector('.tabs');
            var instance = M.Tabs.init(el, {});

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
</body>
</html>

