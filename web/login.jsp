<%-- 
    Document   : login
    Created on : May 27, 2014, 9:16:46 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java" import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link type="text/css" rel="stylesheet" href="static/css/estilo.css"/>   
        <script src="static/js/jquery-1.7.1.min.js"></script>
        <link rel="stylesheet" href="static/bootstrap/css/bootstrap.css">
        <script src="static/bootstrap/js/bootstrap.js"></script>
    </head>
    <body>
        <jsp:include page="templates/header.jsp" />
        <div class="contenedor">            
            <div class="center">
                <br><br><br><span>Introduce tus datos para acceder al sistema:</span><br/>
                <p>
                <div style="width: 200px; margin: 0 auto; padding-top: 20px;">
                    <form name="frmSO" action="doLogin.jsp" method="POST" class="form-horizontal" role="form" >
                        <div class="form-group">
                            <label class="sr-only" for="flogin">Código</label>
                            <input type="text" id="flogin" name="login" value="" class="form-control" placeholder="Código"/>
                        </div>
                        <div class="form-group"> 
                            <label class="sr-only" for="fpassword">Código</label>
                            <input type="password" id="fpassword" name="password" value="" class="form-control" placeholder="Contraseña"/>
                        </div>
                        <div class="form-group"> 
                            <p><input type="checkbox" name="ingeniero" value="ON" id="admin"/> Activar solo si es Administrador

                            </p>
                        </div>
                        <p>
                            <%
                                if (request.getParameter("error") != null) {
                                    out.println(request.getParameter("error"));
                                }
                            %>
                        </p>
                        <input type="submit" value="Ingresar" name="Ingresar" class="btn btn-default"/>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="templates/footer.jsp" />


    </body>
</html>
