<%@include file="../../WEB-INF/jspf/sesion.jspf" %>
<div class="center" style="width: 300px; padding-top: 30px;">
    
    <form action="SrvEstudiante" method="POST" role="form">
        <div class="form-group">
            <label for="fpassword-actual">Contrase�a actual: </label>
            <input type="password" name="passa" value="" class="form-control" id="fpassword-actual"/>
        </div>
        <div class="form-group">
            <label for="fpassword-nueva">Contrase�a nueva: </label>
            <input type="password" name="pass1" class="form-control" id="fpassword-nueva"/>
        </div>
        <div class="form-group">
            <label for="fpassword-nuevac">Confirmar contrase�a: </label>
            <input type="password" name="pass2" class="form-control" id="fpassword-nuevac"/>
        </div>
        <input type="hidden" name="codigo" value="<%=usuario%>" />
        <input type="hidden" name="accion" value="cambiarPassword" />
        <input type="submit" value="cambiar" />
    </form>
    <br>
</div>
<div class="col-md-12"><%@include file="../../WEB-INF/jspf/mensajes.jspf" %></div>