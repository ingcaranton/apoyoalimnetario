<%@include file="../../WEB-INF/jspf/sesion.jspf" %>
<%
  //  Documento doc = new Documento();
    System.out.println("Entro a solicitudes");
    ResultSet res= (ResultSet)request.getAttribute("res");
    Conexion conexion = new Conexion();
    ResultSet res2 ;
    String codigo="";
    String nombres="";
    String sede="";
    String estado2="";
    
%>
<table class="table table-striped">
    <thead>
        <tr>
            <th>Codigo</th>
            <th>Estudiante</th>
            <th>Sede</th>
            <th>Estado</th>
            <th>Accion</th>
        </tr>
    </thead>
    <tbody>
        <%
        while (res.next()){      
        codigo=res.getString("estudiante");        
        res2= conexion.Buscar("SELECT * FROM estudiante WHERE (codigo = '" + codigo + "')");
        if (res2.next())
            nombres=res2.getString("nombres")+" "+res2.getString("apellidos");
        sede = res.getString("sede");
        estado2 = res.getString("estado");
            %>
        <tr>
            <td> <%=codigo%> </td>
            <td> <%= nombres%> </td>
            <td> <%= sede%> </td>
            <td> <%= estado2 %> </td>
            <td> <a class="btn btn-default" href="SrvIngAlimentos?accion=solicitudEs&sestudiante=<%=codigo%>">Ver</a> </td>
        </tr>
        <%
        }
            %>
    </tbody>
</table>
