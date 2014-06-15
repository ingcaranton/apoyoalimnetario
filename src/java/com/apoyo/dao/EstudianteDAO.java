/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apoyo.dao;

import com.apoyo.vo.EstudianteVO;
import com.apoyo.conexion.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author root
 */
public class EstudianteDAO {

    /**
     * Permite registrar un estudiante en la base de datos
     *
     * @param estudiante
     */
    public void registrar(EstudianteVO estudiante) throws SQLException {
        Conexion conexion = new Conexion();
        conexion.Insertar("INSERT INTO estudiante VALUES (null , '" + estudiante.getNombres() + "', '" + estudiante.getApellidos() + "',"
                + "'" + estudiante.getCodigo() + "', '" + estudiante.getProyecto() + "', '" + estudiante.getEstado() + "', '" + estudiante.getSede() + "',"
                + "'" + estudiante.getCorreo() + "', '" + estudiante.getPassword() + "', '" + estudiante.getDireccion() + "', '" + estudiante.getEstrato() + "', "
                + "'" + estudiante.getTelefono1() + "', '" + estudiante.getTelefono2() + "', '" + estudiante.getDocumento() + "', '" + estudiante.getApoyo() + "', "
                + "'" + estudiante.getSolicitud() + "')");
        conexion.Desconectar();
    }

    public void actualizarApoyo(EstudianteVO estudiante, String apoyo) throws SQLException {
        Conexion conexion = new Conexion();
        conexion.Actualizar("Update estudiante set apoyo='" + apoyo + "' where codigo='" + estudiante.getCodigo() + "'");
        conexion.Desconectar();
    }

    public void actualizar(EstudianteVO estudiante, String nombres, String apellidos, String direccion, String telefono1, String telefono2) throws SQLException {
        Conexion conexion = new Conexion();
        conexion.Actualizar("Update estudiante set nombres='" + nombres + "', apellidos = '" + apellidos + "', direccion='" + direccion + "', telefono1='" + telefono1 + "', telefono2='" + telefono2 + "' where codigo='" + estudiante.getCodigo() + "'");
        conexion.Desconectar();
    }

    public void actualizarSolicitud(EstudianteVO estudiante, String solicitud) throws SQLException {
        Conexion conexion = new Conexion();
        conexion.Actualizar("Update estudiante set solicitud='" + solicitud + "' where codigo='" + estudiante.getCodigo() + "'");
        conexion.Desconectar();

    }

    public ResultSet consultar_calve_codigo(String codigo, String clave) {

        Conexion conexion = new Conexion();
        ResultSet res = null;
        try {
            res = conexion.Buscar("SELECT * FROM estudiante WHERE codigo ='" + codigo + "' and password='" + clave + "'");
            //conexion.Desconectar();

        } catch (Exception e) {
            System.out.println("no se pudo consultar la solicitud\n" + e);
        }
        return res;
    }
    
    public void actualizarPassword(EstudianteVO estudiante, String password) throws SQLException {
        Conexion conexion = new Conexion();
        conexion.Actualizar("Update estudiante set password='" + password + "' where codigo='" + estudiante.getCodigo ()+ "'");
        conexion.Desconectar();

    }
    
    

    /**
     * permite consultar el estudaiante asociado al documento enviado como
     * parametro
     *
     */
    public ResultSet buscar(String documento) {
        
        Conexion conexion = new Conexion();
         ResultSet res = null;
        try {
            res = conexion.Buscar("SELECT * FROM estudiante where codigo =" + documento + "");
           return res;

        } catch (Exception e) {
            System.out.println("no se pudo consultar obtener la solicitud\n" + e);
        }
        return res;
    }
    
    public EstudianteVO consultar(String documento) {
        EstudianteVO estudiante = new EstudianteVO();
        Conexion conexion = new Conexion();
        try {
            ResultSet res = conexion.Buscar("SELECT * FROM estudiante where codigo =" + documento + "");
            if (res.next()) {
                estudiante.cargar(res);
            }
            res.close();
            conexion.Desconectar();

        } catch (Exception e) {
            System.out.println("no se pudo consultar la Persona\n" + e);
        }
        return estudiante;
    }

    /**
     * permite consultar la lista de empleados
     *
     * @return
     */
    public ArrayList< EstudianteVO> listaDePersonas() {
        ArrayList< EstudianteVO> listaEstudiante = new ArrayList< EstudianteVO>();
        Conexion conexion = new Conexion();
        try {

            ResultSet res = conexion.Buscar("SELECT * FROM estudiante");
            while (res.next()) {
                EstudianteVO estudiante = new EstudianteVO();
                estudiante.cargar(res);
                listaEstudiante.add(estudiante);
            }
            res.close();
            conexion.Desconectar();

        } catch (Exception e) {
            System.out.println("no se pudo consultar la Persona\n" + e);
        }
        return listaEstudiante;
    }

}
