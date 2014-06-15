<%@page language="java" session="true" %>
<%@include file="WEB-INF/jspf/sesion.jspf" %>
<%    
    String contenido = null;
    if (request.getParameter("contenido") != null) {
        contenido = request.getParameter("contenido");
    } else if (request.getAttribute("contenido") != null) {
        contenido = request.getAttribute("contenido").toString();
    } else {
        contenido = "datos";
    }

%>

<jsp:include page="templates/base.jsp">
    <jsp:param name="title" value="Estudiantes"/>
    <jsp:param name="page" value="estudiante/pestudiante"/>
    <jsp:param name="contenido" value="<%=contenido%>"/>
</jsp:include>