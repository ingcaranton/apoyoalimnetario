package com.apoyo.controlador;

import com.apoyo.dao.EstudianteDAO;
import com.apoyo.dao.SolicitudDAO;
import com.apoyo.vo.EstudianteVO;
import com.apoyo.vo.SolicitudVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SrvIngAlimentos", urlPatterns = {"/SrvIngAlimentos"})
public class SrvIngAlimentos extends HttpServlet {

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

        resetear();
        accion = request.getParameter("accion");
            if (request.getAttribute("accion") != null) {
                accion = request.getAttribute("accion").toString();
            }
        switch (accion) {

            case "versolicitudes":
                solicitudDAO = new SolicitudDAO();
                res = solicitudDAO.listar();
                usuario = "administrador";//es el parametro de la pagina que quiere que cargue
                accion = "solicitudes";
                break;
            case "solicitudEs":
                System.out.println("SrvIngeniero solicitudES");
                solicitudDAO = new SolicitudDAO();
                res = solicitudDAO.Buscar(request.getParameter("sestudiante"));
                accion = "solicitud";
                usuario = "administrador";
                break;

        }
        direcionar(request, response, usuario);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
