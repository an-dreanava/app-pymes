<%-- 
    Document   : DetallePedido
    Created on : may 23, 2021, 11:15:43 p.m.
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
                    String rut = cliente.getRut();
                }
            }

            String id = "";
            id = request.getParameter("id");

            PreparedStatement ps = null;
            ResultSet rs = null;
            Conexion con = new Conexion();
            com.mysql.jdbc.Connection conexion = con.getConnection();
            ps = conexion.prepareStatement("SELECT * FROM PEDIDOS PE INNER JOIN CLIENTE C ON PE.RUT_CLIENTE = C.RUT INNER JOIN PRODUCTOS PR ON PE.ID_PRODUCTO = PR.ID INNER JOIN ESTADO_PEDIDO E ON PE.ID_ESTADO_PEDIDO = E.ID INNER JOIN DIRECCION D ON C.ID_DIRECCION = D.ID INNER JOIN COMUNA CO ON D.ID_COMUNA = CO.ID INNER JOIN CIUDAD CI ON CO.ID_CIUDAD = CI.ID INNER JOIN REGION RE ON CI.ID_REGION = RE.ID INNER JOIN PYME PY ON PR.ID_PYME = PY.ID WHERE PE.BOLETA = ? ");
            ps.setString(1, id);
            rs = ps.executeQuery();

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
            
            <br><br>
            <div class="divider"></div>
            <div class="container">
                <div class="row">
                    <div class="col s4 ">
                        <a href="DetallesCuenta.jsp">
                            <i class="material-icons left" >navigate_before</i>
                            <label class="label-volver">VOLVER</label>  
                        </a>
                    </div>
                </div>
            </div>
            <div class="divider separador"></div>
            
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
                        <div class="col s12 left-align">
                            <label style="font-size: 20px;"><%=rs.getString("PY.NOMBRE_PYME")%></label>
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
                        <br><br>
                        <div class="col s3 left-align">
                            <h6 style="font-size: 18px;">Estado:</h6>
                        </div>
                        <div class="col s6 left-align">
                            <h6 style="font-size: 18px; color: green;"><%=rs.getString("E.DESCRIPCION")%></h6>
                        </div>
                        <br><br>
                        <div class="col s12 left-align">
                            <h5 style="font-weight: bold;">Tus Datos </h5>
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

                        <% } %>

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




        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"
                integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
                crossorigin="anonymous">
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
