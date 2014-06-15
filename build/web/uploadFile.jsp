<%@include file="WEB-INF/jspf/sesion.jspf" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %> 
<%@ page import="java.util.*" %> 
<%@ page import="org.apache.commons.fileupload.*" %> 
<%@ page import="org.apache.commons.fileupload.disk.*" %> 
<%@ page import="org.apache.commons.fileupload.servlet.*" %> 
<%@ page import="org.apache.commons.io.*" %> 
<%@ page import="java.io.*" %> 

<%    
System.out.println(est.getCodigo());
String ubicacionArchivo = "/root/NetBeansProjects/ApoyoAlimentario_v2/web/archivos/estudiantes/" + est.getCodigo() + "/";
    File folder = new File(ubicacionArchivo);
    folder.mkdirs();

    DiskFileItemFactory factory = new DiskFileItemFactory();
    factory.setSizeThreshold(5048);
    factory.setRepository(folder);

    ServletFileUpload upload = new ServletFileUpload(factory);
    String info = null;
    String err = null;
    ArrayList<String> rutas = new ArrayList<String>();
    String lista[] ={"1_Carta", "2_Formulario", "3_Certificado_Estratificacion", "4_Fotocopia_factura", "5_Fotocopia_recibo","6_Certificado_de_ingresos", "7_Examen_medico"}; 
    try {
        List<FileItem> partes = upload.parseRequest(request);
        int cont=0;
        for (FileItem item : partes) {
            int extencion = item.getName().lastIndexOf('.');
            String ruta = lista[cont]+"."+item.getName().substring(extencion + 1);
            File file = new File(ubicacionArchivo, ruta);
            item.write(file);
            rutas.add("archivos/estudiantes/" + est.getCodigo() + "/"+ruta);
            cont++;
        }
        info = "El archivo se a subido correctamente";
    } catch (FileUploadException ex) {
        err = "Error al subir archivo " + ex.getMessage();
    }
    request.setAttribute("rutas", rutas);
    request.setAttribute("accion", "apoyo");
    request.setAttribute("estudiante", est);
    request.setAttribute("contenido", "apoyo");
    request.setAttribute("info", info);
    request.setAttribute("err", err);
    request.setAttribute("codigo", est.getCodigo());
    RequestDispatcher rd = request.getRequestDispatcher("SrvEstudiante");
    rd.forward(request, response);
    
%>