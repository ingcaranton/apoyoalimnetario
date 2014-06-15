<%-- 
    Document   : layout
    Created on : May 27, 2014, 10:56:59 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@include file="../WEB-INF/jspf/sesion.jspf" %>
<!DOCTYPE html>
<%    
    // define el titulo a mostrar en la pagina.
    String sTitle = "Principal";
    if (request.getParameter("title") != null) {
        sTitle = request.getParameter("title").toString();
    }

    // define la pagina a desplegar de acuerdo al parametro "page" del request.
    String sUrlPage = "../index.jsp";
    if (request.getParameter("page") != null) {
        sUrlPage = "" + request.getParameter("page").toString() + ".jsp";
    }
    String contenido = request.getParameter("contenido");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=sTitle%> - UD</title>
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/static/css/estilo.css"/>
        <script src="<%=request.getContextPath()%>/static/js/jquery-1.7.1.min.js"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.css">
        <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.js"></script>
        
    </head>
    <body>
        
        <jsp:include page="header.jsp" />
        <div class="contenedor">
            <jsp:include page="<%=sUrlPage%>">
                <jsp:param name="contenido" value="<%=contenido%>"/>
            </jsp:include>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
