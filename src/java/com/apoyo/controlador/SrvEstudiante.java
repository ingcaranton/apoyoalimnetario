package com.apoyo.controlador;

import com.apoyo.dao.EstudianteDAO;
import com.apoyo.dao.SolicitudDAO;
import com.apoyo.vo.EstudianteVO;
import com.apoyo.vo.SolicitudVO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.err;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SrvEstudiante", urlPatterns = {"/SrvEstudiante"})
public class SrvEstudiante extends HttpServlet {

    private EstudianteDAO estudianteDAO;
    private EstudianteVO estudiante;
    private SolicitudDAO solicitudDAO;
    private SolicitudVO solicitud;
    private String accion = "";
    private String info = "";
    private String warning = "";
    private String usuario;
    private String success = "";
    private String danger = "";
    private String err = "";
    private ResultSet res;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        try {
            if (request.getParameter("estudiante") != null) {
                cargarEstudiante(request.getParameter("estudiante"));
            }
            accion = request.getParameter("accion");
            if (request.getAttribute("accion") != null) {
                accion = request.getAttribute("accion").toString();
            }
            resetear();
            switch (accion) {
                case "solicitud":
                    solicitudDAO = new SolicitudDAO();
                    solicitud = new SolicitudVO();
                    cargarEstudiante(request.getParameter("codigo"));
                    solicitud = solicitudDAO.consultar(request.getParameter("codigo"));
                    System.out.println("Codigo estudiante solicitud: " + request.getParameter("codigo"));
                    solicitudDAO.eliminar(solicitud, request.getParameter("codigo"));

                    estudianteDAO.actualizarSolicitud(estudiante, "0");
                    cargarEstudiante(estudiante.getCodigo());
                    System.out.println("Cambio la solicitud");
                    info = "";
                    warning = "Debe volver a enviar todos los documentos, para que la solicitud sea aceptada!";
                    accion = "apoyo";
                    usuario = "estudiante";
                    break;
                case "link":
                    resetear();
                    accion = request.getParameter("contenido");
                    usuario = "estudiante";
                    break;

            }
            direcionar(request, response, usuario);
        } catch (SQLException ex) {
            Logger.getLogger(SrvEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SrvEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        accion = request.getParameter("accion");
        if (request.getAttribute("accion") != null) {
            accion = request.getAttribute("accion").toString();
        }
        resetear();
        switch (accion) {
            case "actualizar":
                cargarEstudiante(request.getParameter("estudiante"));
                try {
                    estudianteDAO.actualizar(estudiante, request.getParameter("nombres"), request.getParameter("apellidos"), request.getParameter("direccion"), request.getParameter("tel1"), request.getParameter("tel2"));
                } catch (SQLException ex) {
                    Logger.getLogger(SrvEstudiante.class.getName()).log(Level.SEVERE, null, ex);
                }

                success = "Se han actualizado los datos correctamente.";
                usuario = "estudiante";
                break;
            case "registrar":
                ArrayList<String> lista = new ArrayList<String>();
                lista.add(request.getParameter("nombres"));
                lista.add(request.getParameter("apellidos"));
                lista.add(request.getParameter("codigo"));
                lista.add(request.getParameter("proyecto"));
                lista.add(request.getParameter("estado"));
                lista.add(request.getParameter("sede"));
                lista.add(request.getParameter("correo"));
                lista.add(request.getParameter("password"));
                lista.add(request.getParameter("direccion"));
                lista.add(request.getParameter("estrato"));
                lista.add(request.getParameter("tel1"));
                lista.add(request.getParameter("tel2"));
                lista.add(request.getParameter("documento"));
                lista.add(request.getParameter("apoyo"));
                System.out.println("Vamos a llamar a registrar");
                try {
                    registrar(lista);
                } catch (SQLException ex) {
                    Logger.getLogger(SrvEstudiante.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "apoyo":
                cargarEstudiante(request.getAttribute("codigo").toString());
                ArrayList<String> rutas = (ArrayList<String>) request.getAttribute("rutas");
                System.out.println("Ruta 1" + rutas.get(0));
                solicitud = new SolicitudVO();
                solicitud.setUno(rutas.get(0));

                solicitud.setDos(rutas.get(1));
                solicitud.setTres(rutas.get(2));
                solicitud.setCuatro(rutas.get(3));
                solicitud.setCinco(rutas.get(4));
                solicitud.setSeis(rutas.get(5));
                solicitud.setSiete(rutas.get(6));
                solicitud.setEstudiante(estudiante.getCodigo());
                solicitud.setSede(estudiante.getSede());
                try {
                    solicitudDAO = new SolicitudDAO();
                    solicitudDAO.registrar(solicitud);
                    estudianteDAO.actualizarSolicitud(estudiante, " 1");
                } catch (SQLException ex) {
                    Logger.getLogger(SrvEstudiante.class.getName()).log(Level.SEVERE, null, ex);
                }
                cargarEstudiante(estudiante.getCodigo());
                success = "Se ha enviado el formulario correctamente.";
                usuario = "estudiante";
                break;
            case "cambiarPassword":
                ResultSet res;  
                String codigo2 =request.getAttribute("codigo").toString();
                System.out.println("codigo: "+request.getAttribute("codigo").toString() );
                cargarEstudiante(codigo2);
                String passa = request.getParameter("passa");
                String pass1 = request.getParameter("pass1");
                String pass2 = request.getParameter("pass2");               

                
                String info = null;
                String err = null;
                
                if (pass1 == pass2){
                   if ( passa == estudianteDAO.consultar(codigo2).getPassword()){
                       try {
                           estudianteDAO.actualizarPassword(estudiante, pass2);
                       } catch (SQLException ex) {
                           Logger.getLogger(SrvEstudiante.class.getName()).log(Level.SEVERE, null, ex);
                       }
                   }else{
                       err = "La contraseña ingresada no coincide con la atual. Intenta nuevamente";
                   }
                }else {
                    err = "Las contraseñas no coinciden. Intenta nuevamente";
                }
                usuario = "estudiante";
                accion = "contraseña";
                
                break;

        }
        direcionar(request, response, usuario);
    }

    public void registrar(ArrayList<String> lista) throws SQLException {
        System.out.println("Estamos en el metodo registrar");
        estudianteDAO = new EstudianteDAO();
        EstudianteVO estudianteVO = new EstudianteVO();
        estudianteVO.setNombres(lista.get(0));
        estudianteVO.setApellidos(lista.get(1));
        estudianteVO.setCodigo(lista.get(2));
        estudianteVO.setProyecto(lista.get(3));
        estudianteVO.setEstado(lista.get(4));
        estudianteVO.setSede(lista.get(5));
        estudianteVO.setCorreo(lista.get(6));
        estudianteVO.setPassword(lista.get(7));
        estudianteVO.setDireccion(lista.get(8));
        estudianteVO.setEstrato(lista.get(9));
        estudianteVO.setTelefono1(lista.get(10));
        estudianteVO.setTelefono2(lista.get(11));
        estudianteVO.setDocumento(lista.get(12));
        estudianteVO.setApoyo(lista.get(13));

        estudianteDAO.registrar(estudianteVO);

    }

    public void cargarEstudiante(String codigo) {
        estudianteDAO = new EstudianteDAO();
        estudiante = new EstudianteVO();
        estudiante = estudianteDAO.consultar(codigo);

    }

    public void resetear() {
        info = "";
        warning = "";
        success = "";
        danger = "";
    }

    public void direcionar(HttpServletRequest request, HttpServletResponse response, String usuario) throws ServletException, IOException {
        request.setAttribute("estudiante", estudiante);
        request.setAttribute("contenido", accion);
        request.setAttribute("info", info);
        request.setAttribute("warning", warning);
        request.setAttribute("success", success);
        request.setAttribute("err", err);
        request.setAttribute("res", res);
        RequestDispatcher rd = request.getRequestDispatcher(usuario + ".jsp");
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
