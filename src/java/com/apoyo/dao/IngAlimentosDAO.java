/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.apoyo.dao;

import com.apoyo.conexion.Conexion;
import com.apoyo.vo.EstudianteVO;
import com.apoyo.vo.IngAlimentosVO;
import java.sql.ResultSet;

/**
 *
 * @author root
 */
public class IngAlimentosDAO {
    
    public ResultSet consultar_calve_codigo(String cedula, String clave) {

        Conexion conexion = new Conexion();
        ResultSet res = null;
        try {
            res = conexion.Buscar("SELECT * FROM trabajador WHERE cedula ='" + cedula + "' and password='" + clave + "'");
            //conexion.Desconectar();

        } catch (Exception e) {
            System.out.println("no se pudo consultar el Ingeniero de Alimentos\n" + e);
        }
        return res;
    }
     public IngAlimentosVO consultar(String cedula) {
        IngAlimentosVO ingeniero = new IngAlimentosVO();
        Conexion conexion = new Conexion();
        try {
            ResultSet res = conexion.Buscar("SELECT * FROM trabajador WHERE (cedula LIKE '" + cedula + "%')");
            if (res.next()) {
                ingeniero .cargar(res);
            }
            res.close();
            conexion.Desconectar();

        } catch (Exception e) {
            System.out.println("no se pudo consultar el ingeniero de alimentos\n" + e);
        }
        return ingeniero;
    }
}
