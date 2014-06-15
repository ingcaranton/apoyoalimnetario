<%@include file="../../WEB-INF/jspf/sesion.jspf" %>

<p>Nombre: <%=est.getNombres()%>  <%=est.getApellidos()%> </p>
<p>Documento de identificación: <%=est.getDocumento()%></p>
<p>Código: <%=est.getCodigo()%></p>
<p>Correo: <%=est.getCorreo()%></p>
<p>Dirección: <%=est.getDireccion()%></p>
<p>Teléfono 1: <%=est.getTelefono1()%></p>
<p>Teléfono 2: <%=est.getTelefono2()%></p>
<p>Estrato: <%=est.getEstrato()%></p>
<p>Proyecto Curricular: <%=est.getProyecto()%></p>
<P>Estado: <%=est.getEstado()%></p>
<p>Sede: <%=est.getSede()%></p>
<p>Apoyo: <%=est.getApoyo()%></p><br>
<a href="SrvEstudiante?contenido=actualizar&accion=link">Actualizar Información</a>
<br>
<div class="col-md-12"><%@include file="../../WEB-INF/jspf/mensajes.jspf" %></div>