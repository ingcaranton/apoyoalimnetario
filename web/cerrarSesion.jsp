<%@page import="com.apoyo.modelo.*"%>
<%@page session="true" %>
<%  

    HttpSession sesionOk = request.getSession();
    System.out.println("usuario: "+sesionOk.getAttribute("usuario"));  
    sesionOk.invalidate();
    %>
    <jsp:forward page="login.jsp"/>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
