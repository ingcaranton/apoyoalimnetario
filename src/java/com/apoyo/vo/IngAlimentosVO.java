/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apoyo.vo;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author root
 */
public class IngAlimentosVO {

    private int id = 0;
    private String nombres;
    private String apellidos;
    private String telefono;
    private String cedula;
    private String correo;
    private String password;

    public IngAlimentosVO() {
    }
    
    public void cargar(ResultSet res) throws SQLException {
        id = Integer.parseInt(res.getString("id"));
        nombres = res.getString("nombres");
        apellidos = res.getString("apellidos");
        correo = res.getString("correo");
        password = res.getString("password");
        cedula = res.getString("cedula");
        telefono = res.getString("telefono");

    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getNombres() {
        return nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getCedula() {
        return cedula;
    }

    public String getCorreo() {
        return correo;
    }

    public String getPassword() {
        return password;
    }

}
