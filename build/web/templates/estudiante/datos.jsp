<%@include file="../../WEB-INF/jspf/sesion.jspf" %>

<p>Nombre: <%=est.getNombres()%>  <%=est.getApellidos()%> </p>
<p>Documento de identificaci�n: <%=est.getDocumento()%></p>
<p>C�digo: <%=est.getCodigo()%></p>
<p>Correo: <%=est.getCorreo()%></p>
<p>Direcci�n: <%=est.getDireccion()%></p>
<p>Tel�fono 1: <%=est.getTelefono1()%></p>
<p>Tel�fono 2: <%=est.getTelefono2()%></p>
<p>Estrato: <%=est.getEstrato()%></p>
<p>Proyecto Curricular: <%=est.getProyecto()%></p>
<P>Estado: <%=est.getEstado()%></p>
<p>Sede: <%=est.getSede()%></p>
<p>Apoyo: <%=est.getApoyo()%></p><br>
<a href="SrvEstudiante?contenido=actualizar&accion=link">Actualizar Informaci�n</a>
<br>
<div class="col-md-12"><%@include file="../../WEB-INF/jspf/mensajes.jspf" %></div>