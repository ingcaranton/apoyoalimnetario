<%@include file="../../WEB-INF/jspf/sesion.jspf" %>
<%   // Documento doc = new Documento();

    System.out.println("entro a solicitud!!!!");
    ResultSet res = (ResultSet) request.getAttribute("res");
    Conexion conexion = new Conexion();
    ResultSet res2;

    String uno = "";
    String dos = "";
    String tres = "";
    String cuatro = "";
    String cinco = "";
    String seis = "";
    String siete = "";
    String codigo = "";
    if (res != null) {
        if (res.next()) {
            uno = res.getString("uno");
            dos = res.getString("dos");
            tres = res.getString("tres");
            cuatro = res.getString("cuatro");
            cinco = res.getString("cinco");
            seis = res.getString("seis");
            siete = res.getString("siete");
            codigo = res.getString("estudiante");
        }
    }


%>
<table class="table table-striped">
    <thead>
        <tr>
            <th>Documentos</th>
            <th>Ruta</th>

        </tr>
    </thead>
    <tbody>
        <tr> 
            <td> 1. Carta </td> 
            <td> <%= uno%> </td> 
            <td> <a class="btn btn-default" target="_blank" href="<%=uno%>"><span class="glyphicon glyphicon-arrow-right"></span></a></td> 
        </tr>
        <tr> 
            <td> 2. Formulario </td> 
            <td> <%= dos%> </td> 
            <td><a class="btn btn-default" target="_blank" href="<%=dos%>"><span class="glyphicon glyphicon-arrow-right"></span></a></td> 
        </tr>
        <tr> 
            <td> 3. Certificado de Estratificacíon </td>
            <td> <%= tres%> </td> 
            <td><a class="btn btn-default" target="_blank" href="<%=tres%>"><span class="glyphicon glyphicon-arrow-right"></span></a></td> 
        </tr>
        <tr> 
            <td> 4. Factura recibo público </td>
            <td> <%= cuatro%> </td> 
            <td><a class="btn btn-default" target="_blank" href="<%=cuatro%>"><span class="glyphicon glyphicon-arrow-right"></span></a></td> 
        </tr>
        <tr> 
            <td> 5. Recibo Matrícula </td>
            <td> <%= cinco%> </td> 
            <td><a class="btn btn-default" target="_blank" href="<%=cinco%>"><span class="glyphicon glyphicon-arrow-right"></span></a></td> 
        </tr>
        <tr> 
            <td> 6. Certificado de Ingresos </td>
            <td> <%= seis%> </td> 
            <td><a class="btn btn-default" target="_blank" href="<%=seis%>"><span class="glyphicon glyphicon-arrow-right"></span></a></td> 
        </tr>
        <tr> 
            <td> 7. Exámen médico </td>
            <td> <%= siete%> </td> 
            <td><a class="btn btn-default" target="_blank" href="<%=siete%>"><span class="glyphicon glyphicon-arrow-right"></span></a></td> 
        </tr>
    <td>  </td>
</tr>

</tbody>
</table>
<div class="panel panel-default">
    <div class="panel-body">
        Actualizar Estado:
        <br>
        <br>
        <form action="SrvEstudiante" method="POST" role="form">
            <select class="form-control col-md-3" name="apoyo" style="width: 200px; margin-right: 10px;"> 
                <option>No Aprobado</option>
                <option>Tipo A</option>
                <option>Tipo B</option>
                <option>Subsidio Total</option>
            </select>
            <input type="hidden" name="estudiante" value="<%= codigo%>"/>
            <input type="hidden" name="accion" value="actualizarEstudiante"/>
            <input type="submit" value="Guardar" class="btn btn-primary col-md-2"/>
        </form>
    </div>
</div>     
