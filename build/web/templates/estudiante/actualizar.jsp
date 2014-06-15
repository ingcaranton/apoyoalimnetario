<%@page language="java" session="true" %>
<%@include file="../../WEB-INF/jspf/sesion.jspf" %>
<%
%>
<div class="col-md-12">
    <form action="SrvEstudiante" method="POST" class="form-horizontal" role="form">
        <div class="form-group">
            <label for="Nombres" class="col-sm-2 control-label">Nombre(s):</label>
            <div class="col-sm-3">
                <input type="text" class="form-control " name="nombres" id="Nombres" placeholder="<%=est.getNombres()%>" value="<%=est.getNombres()%>">
            </div>  
            <label for="Apellidos" class="col-sm-2 control-label">Apellidos:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control " name="apellidos"  id="Apellidos" placeholder="<%=est.getApellidos()%>" value="<%=est.getApellidos()%>">
            </div> 
        </div>
        <div class="form-group">
            <label for="Cedula" class="col-sm-2 control-label">Documento de identificación:</label>
            <div class="col-sm-3">
                <input disabled type="text"  class="form-control " id="Cedula" placeholder="<%=est.getDocumento()%>">
            </div>  
            <label for="Codigo" class="col-sm-2 control-label">Código:</label>
            <div class="col-sm-3">
                <input disabled type="text" class="form-control " name="codigo" id="Codigo" placeholder="<%=est.getCodigo()%>" value="<%=est.getCodigo()%>">
            </div> 
        </div>
        <div class="form-group">
            <label for="Proyecto" class="col-sm-2 control-label">Proyecto Curricular:</label>
            <div class="col-sm-3">
                <input disabled type="text" class="form-control " id="Proyecto" placeholder="<%=est.getProyecto()%>">
            </div>  
            <label for="Estado" class="col-sm-2 control-label">Estado:</label>
            <div class="col-sm-3">
                <input disabled type="text" class="form-control " id="Estado" placeholder="<%=est.getEstado()%>">
            </div> 
        </div>
        <div class="form-group">
            <label for="Direccion" class="col-sm-2 control-label">Dirección:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control " name="direccion"  id="Direccion" placeholder="<%=est.getDireccion()%>" value="<%=est.getDireccion()%>">
            </div>  
            <label for="Estrato" class="col-sm-2 control-label">Estrato:</label>
            <div class="col-sm-3">
                <input disabled type="text" class="form-control " id="Estrato" placeholder="<%=est.getEstrato()%>">
            </div>        
        </div>
        <div class="form-group">
            <label for="Telefono1" class="col-sm-2 control-label">Teléfono 1:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control " name="tel1"  id="Telefono1" placeholder="<%=est.getTelefono1()%>" value="<%=est.getTelefono1()%>">
            </div>
            <label for="Telefono2" class="col-sm-2 control-label">Teléfono 2:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control " name="tel2"  id="Telefono2" placeholder="<%=est.getTelefono2()%>" value="<%=est.getTelefono2()%>">
            </div> 
        </div>  
        <div class="form-group">
            <label for="Sede" class="col-sm-2 control-label">Sede:</label>
            <div class="col-sm-3">
                <input disabled type="text" class="form-control " id="Sede" placeholder="<%=est.getSede()%>">
            </div>
            <label for="Apoyo" class="col-sm-2 control-label">Apoyo alimentatio:</label>
            <div class="col-sm-3">
                <input disabled type="text" class="form-control " id="Apoyo" placeholder="<%=est.getApoyo()%>">
            </div> 
        </div>     
        <input  type="hidden" name="estudiante" value="<%=est.getCodigo()%>">
        <input type="hidden" name="accion" value="actualizar" />
        <input type="submit" value="Actualizar" class="col-sm-2 btn btn-default"/>

    </form>
</div>
<div class="col-md-12"><%@include file="../../WEB-INF/jspf/mensajes.jspf" %></div>
