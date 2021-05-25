<%-- 
    Document   : CerrarSesion
    Created on : may 20, 2021, 8:54:33 p.m.
    Author     : AngieRiera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <title>One Place</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  />
        <link type="text/css" rel="stylesheet" href="css/estilo.css" />
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
    </head>
    <body bgcolor="#e0f7fa">
        <%
        HttpSession sesion = request.getSession(true);

            sesion.setAttribute("usuario", null);
            sesion.setAttribute("estadoSesion", "close");

            sesion.invalidate();    
        %>
        <div class='mensaje'>
            <form action="#" method="POST">
                <div class="modal-content center container">
                    <br>
                    <h4 id="modal-text">SESIÓN FINALIZADA</h4>
                    <br>
     
                         <div class="input-field col s6">
                            <a href="Index.jsp" class="waves-effect red lighten-1 btn-large white-text">Volver</a>
                         </div>  
                </div>  
            </form>
        </div>
    </body>
</html>
