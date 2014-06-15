
<%@page import="com.apoyo.vo.IngAlimentosVO"%>
<%@page import="com.apoyo.dao.IngAlimentosDAO"%>
<%@page import="com.apoyo.conexion.Conexion"%>
<%@page import="com.apoyo.dao.EstudianteDAO"%>
<%@page import="com.apoyo.vo.EstudianteVO"%>
<%@page import="org.apache.coyote.RequestGroupInfo"%>

<%@page import="java.util.*, java.sql.*" session="true"%>
<%
    String usuario = request.getParameter("login");
    String clave = request.getParameter("password");

    Conexion conexion = new Conexion();

    EstudianteVO est = null;
    EstudianteDAO estDAO = new EstudianteDAO();

    IngAlimentosDAO ingDAO = new IngAlimentosDAO();
    IngAlimentosVO ing = null;

    ResultSet rs = null;

    if (request.getParameter("ingeniero") != null) {
        ing = new IngAlimentosVO();
        rs = ingDAO.consultar_calve_codigo(usuario, clave);

    } else {
        est = new EstudianteVO();
        rs = estDAO.consultar_calve_codigo(usuario, clave);
    }
    HttpSession sesion = null;

    if (rs.next()) {
        sesion = request.getSession();
        sesion.setAttribute("conexion", conexion);
        sesion.setAttribute("usuario", usuario);
        sesion.setAttribute("rs", rs);
        if (est != null) {
            est = estDAO.consultar(usuario);
            sesion.setAttribute("estudiante", est);
%>
<jsp:forward page="estudiante.jsp">
    <jsp:param name="contenido" value="datos" />
</jsp:forward>
<%
} else {
    ing = ingDAO.consultar(usuario);
    sesion.setAttribute("ingeniero", ing);
%>
<jsp:forward page="administrador.jsp">
    <jsp:param name="contenido" value="tablero" />
</jsp:forward>
<%
    }

} else {
%>
<jsp:forward page="login.jsp">
    <jsp:param name="error" value="Login y/o Password incorrectos.<br>Vuelve a intentarlo."/>    
</jsp:forward>
<%
    }
%>
