/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apoyo.dao;

import com.apoyo.conexion.Conexion;
import com.apoyo.vo.EstudianteVO;
import com.apoyo.vo.SolicitudVO;
import com.apoyo.vo.SolicitudVO;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author root
 */
public class SolicitudDAO {

    public void registrar(SolicitudVO solicitud) throws SQLException {
        Conexion conexion = new Conexion();
        conexion.Insertar("INSERT INTO documento VALUES (null , '" + solicitud.getEstudiante() + "', '" + solicitud.getUno() + "',"
                + "'" + solicitud.getDos() + "', '" + solicitud.getTres() + "', '" + solicitud.getCuatro() + "', '" + solicitud.getCinco() + "',"
                + "'" + solicitud.getSeis() + "', '" + solicitud.getSiete() + "', 'Pendiente', '" + solicitud.getSede() + "')");
        conexion.Desconectar();
    }

    public void eliminar(SolicitudVO solicitud, String codigo) throws SQLException {
        Conexion conexion = new Conexion();
        conexion.Insertar("DELETE FROM documento WHERE estudiante='" + codigo + "'");
        conexion.Desconectar();
    }

    public ResultSet listar() {
        Conexion conexion = new Conexion();
        ResultSet res = null;
        try {
            res = conexion.Buscar("SELECT * FROM documento");

        } catch (Exception e) {
            System.out.println("no se pudo consultar las solicitudes\n" + e);
        }
        return res;
    }

    public ResultSet Buscar(String codigo) {

        Conexion conexion = new Conexion();
        ResultSet res = null;
        try {
            res = conexion.Buscar("SELECT * FROM documento WHERE estudiante like '" + codigo + "%'");

        } catch (Exception e) {
            System.out.println("no se pudo consultar la solicitud\n" + e);
        }
        return res;
    }

    public SolicitudVO consultar(String documento) {
        SolicitudVO solicitud = null;
        Conexion conexion = new Conexion();
        try {
            solicitud = new SolicitudVO();
            ResultSet res = conexion.Buscar("SELECT * FROM documento where estudiante =" + documento + "");
            if (res.next()) {
                solicitud.setId(Integer.parseInt(res.getString("id")));
                solicitud.setEstudiante(res.getString("id"));
                solicitud.setUno(res.getString("uno"));
                solicitud.setDos(res.getString("dos"));
                solicitud.setTres(res.getString("tres"));
                solicitud.setCuatro(res.getString("cuatro"));
                solicitud.setCinco(res.getString("cinco"));
                solicitud.setSeis(res.getString("seis"));
                solicitud.setSiete(res.getString("siete"));
                solicitud.setEstado(res.getString("estado"));
                solicitud.setSede(res.getString("sede"));
            }
            res.close();
            conexion.Desconectar();

        } catch (Exception e) {
            System.out.println("no se pudo consultar la solicitud\n" + e);
        }
        return solicitud;
    }
}
