<%@include file="../../WEB-INF/jspf/sesion.jspf" %>
<%    java.util.Calendar a�o = java.util.Calendar.getInstance();
    java.util.Calendar date = java.util.Calendar.getInstance();
    String fecha = date.get(java.util.Calendar.DATE) + "/" + date.get(java.util.Calendar.MONTH) + "/" + date.get(java.util.Calendar.YEAR);
%>
<h2 style="text-align: center;">Formualario de Inscripci�n para el Apoyo alimentario <small><%=fecha%></small></h2>
<br>
<hr>
<%
    
    if (est.getSolicitud()==0) {
%>
<form action="uploadFile.jsp" method="POST" role="form" enctype="multipart/form-data">
    <div class="form-group">
        <label for="uno">1. Carta dirigida al Director de Bienestar Institucional (Ingeniero Jorge Federico Ram�rez Escobar) donde explique por que solicita el apoyo alimentario:</label>
        <input type="file" class="form-control " name="uno" id="uno">
    </div>
    <div class="form-group">
        <label for="dos">2. Formulario de Solicitud de Adjudicaci�n del Subsidio e ingreso al Programa Apoyo Alimentario diligenciado completamente:</label>
        <input type="file" class="form-control " name="dos"  id="dos" >
    </div>


    <div class="form-group">
        <label for="dos">3. Certificado de estratificaci�n del lugar de residencia del estudiante expedido por Catastro o Supercade o por las Alcald�as Municipales para quienes residen fuera de Bogot�:</label>
        <input type="file" class="form-control " name="dos"  id="dos" >
    </div>
    <div class="form-group">
        <label for="dos">4. Fotocopia de la factura de un recibo p�blico del domicilio donde reside el estudiante (agua, luz, gas o tel�fono):</label>
        <input type="file" class="form-control " name="dos"  id="dos" >
    </div>
    <div class="form-group">
        <label for="dos">5. Fotocopia del Recibo de Pago de la Universidad cancelado:</label>
        <input type="file" class="form-control " name="dos"  id="dos" >
    </div>
    <div class="form-group">
        <label for="dos">6. Certificado de ingresos. Tener en cuenta:</label>
        <p class="help-block">1. Si la persona de quien depende econ�micamente el estudiante es trabajador independiente o el estudiante trabaja como independiente, debe presentar una carta donde especifique la labor que desempe�a y los ingresos que recibe.</p>
        <p class="help-block">2. Si la persona de la que depende el estudiante es empleado o el estudiante es empleado debe presentar carta laboral de la empresa especificando el ingreso mensual.</p>
        <p class="help-block">3. Si presenta certificado de ingresos y retenciones debe corresponder al a�o <%=a�o.get(java.util.Calendar.YEAR)%></p>
        <input type="file" class="form-control " name="dos"  id="dos" >
    </div>
    <div class="form-group">
        <label for="dos">7. Examen M�dico: Para los estudiantes que presenten alg�n tipo de enfermedad como: Hipoglicemia, bajo peso, baja talla, gastritis, anemia o desordenes alimenticios, deben solicitar cita con el m�dico de la facultad.:</label>
        <input type="file" class="form-control " name="dos"  id="dos" >
    </div>
    <p>El formulario se puede ver <a href="http://www.udistrital.edu.co/files/dependencias/bienestar/formato_apoyo_alimentario.pdf">aqu�.</a></p>
    
    <input type="submit" value="Guardar" class="btn btn-default"/>
</form>
<%
} else {
%>
<div class="jumbotron">
    <div class="center">
        <p>Los documentos para la Solicitud del Apoyo Alimentario ya fueron enviados!</p>
        <p><small>En los proximos d�as enviaremos un correo dando respuesta o puede ver el estado en "Ver Datos."</small>
        <p><small>Si desea volver a enviar los documentos dar clic en Volver a enviar</small>
        <br><p><a class="btn btn-primary btn-lg" role="button" href="SrvEstudiante?accion=solicitud&codigo=<%=est.getCodigo()%>">Volver a enviar</a></p>
    </div>
</div>
<%
    }
%>
<div class="col-md-12"><%@include file="../../WEB-INF/jspf/mensajes.jspf" %></div>