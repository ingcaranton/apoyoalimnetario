<%@page language="java" session="true" %>
<%@include file="WEB-INF/jspf/sesion.jspf" %>
<%    
    String contenido=null;
    if (request.getParameter("contenido")!=null)
        contenido =request.getParameter("contenido");
    else if (request.getAttribute("contenido")!=null)
        contenido = request.getAttribute("contenido").toString();
    else
       contenido = "tablero";
    
    System.out.println("Contenido: "+ contenido);
    
%>

<jsp:include page="templates/base.jsp">
    <jsp:param name="title" value="Administrador"/>
    <jsp:param name="page" value="administrador/administrador"/>
    <jsp:param name="contenido" value="<%=contenido%>"/>
</jsp:include>