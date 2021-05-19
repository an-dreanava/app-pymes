<%-- 
    Document   : Ventana_Mensajes
    Created on : 19-05-2021, 10:00:08
    Author     : drean
--%>

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
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  />
        <link type="text/css" rel="stylesheet" href="css/estilo.css" />
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
    </head>
    <body>
        <%
        String titulo=request.getParameter("titulo");
        String mensaje=request.getParameter("mensaje");
        String boton=request.getParameter("boton");        
        String retorno=request.getParameter("retorno");    
        %>
        <div>
            <form action="#" method="POST">
                <div class="modal-content center container">
                    <br>
                    <h5 id="modal-text"><%=titulo%></h5>
                    <br>
                        <div class="row">
                         <%=mensaje%>
                        </div>
                         <div class="input-field col s6">
                            <a href="<%=retorno%>" class="waves-effect blue-grey darken-2 btn-large"><%=boton%></a>
                         </div>  
                </div>  
            </form>
        </div>
    </body>
</html>
