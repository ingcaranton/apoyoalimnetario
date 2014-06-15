<%@include file="../../WEB-INF/jspf/sesion.jspf" %>
<%    String contenido = "datos.jsp";
    String nombre = "";
    try {
        nombre = est.getNombres() + " " + est.getApellidos();
    } catch (Exception e) {
        System.out.println("pestudiante: " + e);
    }
    if (request.getParameter("contenido") != null) {
        contenido = "" + request.getParameter("contenido") + ".jsp";
    }
    System.out.println(contenido);
%>

<div class="row">
    <div class="col-md-2">
        <div class="panel panel-default">
            <div class="panel-heading"><%=nombre%></div>
            <div class="panel-body">
                <a href="../ApoyoAlimentario_v2/cerrarSesion.jsp" class="btn btn-default btn-sm col-md-12">Cerrar Sesión</a><br/>
                <a href="SrvEstudiante?contenido=datos&accion=link" class="btn btn-default btn-sm col-md-12">Ver Datos</a><br>
                <a href="SrvEstudiante?contenido=contraseña&accion=link" class="btn btn-default btn-sm col-md-12">Cambiar contraseña</a><br>
                <a href="SrvEstudiante?contenido=apoyo&accion=link" class="btn btn-default btn-sm col-md-12">Solicitar Apoyo</a>    
                <br/>
            </div>
        </div>
    </div>
    <div class="col-md-10">
        <div class="panel panel-default">
            <div class="panel-body">
                <jsp:include page="<%=contenido%>"></jsp:include>
            </div>
        </div>

    </div>
</div>