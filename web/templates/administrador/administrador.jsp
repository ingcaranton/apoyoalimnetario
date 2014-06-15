<%@include file="../../WEB-INF/jspf/sesion.jspf" %>
<%  String contenido = "datos.jsp";
    String nombre = "";
    try {
        nombre = ing.getNombres() + " " + ing.getApellidos();
    } catch (Exception e) {
        System.out.println("sesion exeption: " + e);
    }
    if (request.getParameter("contenido") != null) {
        contenido = "" + request.getParameter("contenido") + ".jsp";
    }
%>

<div class="row">
    <div class="col-md-2">
        <div class="panel panel-default">
            <div class="panel-heading"><%=nombre%></div>
            <div class="panel-body">
                <a href="../ApoyoAlimentario_v2/cerrarSesion.jsp">Cerrar Sesión</a><br/>
                <a href="SrvIngAlimentos?accion=versolicitudes">Ver Solicitudes</a><br/>
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