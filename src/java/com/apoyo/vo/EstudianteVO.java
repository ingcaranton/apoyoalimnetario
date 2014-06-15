/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apoyo.vo;

import java.sql.*;

/**
 *
 * @author root
 */
public class EstudianteVO {

    private int id = 0;
    private String nombres=null;
    private String apellidos=null;
    private String codigo=null;
    private String proyecto=null;
    private String estado=null;
    private String sede=null;
    private String correo=null;
    private String password=null;
    private String direccion=null;
    private String estrato=null;
    private String telefono1=null;
    private String telefono2=null;
    private String documento=null;
    private String apoyo=null;
    private int solicitud = 0;

    public EstudianteVO() {
    }

   
    public void Actualizar(ResultSet resultado) throws SQLException {
        if (resultado.next()) {
            this.cargar(resultado);
        }
    }

    public void cargar(ResultSet res) throws SQLException {
        id = Integer.parseInt(res.getString("id"));
        nombres = res.getString("nombres");
        apellidos = res.getString("apellidos");
        codigo = res.getString("codigo");
        proyecto = res.getString("proyecto");
        estado = res.getString("estado");
        sede = res.getString("sede");
        correo = res.getString("correo");
        password = res.getString("password");
        direccion = res.getString("direccion");
        estrato = res.getString("estrato");
        telefono1 = res.getString("telefono1");
        telefono2 = res.getString("telefono2");
        documento = res.getString("documento");
        apoyo = res.getString("apoyo");
        if (Integer.parseInt(res.getString("solicitud")) == 0) {
            solicitud = 0;
        } else {
            solicitud = 1;
        }

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

    public String getCodigo() {
        return codigo;
    }

    public String getProyecto() {
        return proyecto;
    }

    public String getEstado() {
        return estado;
    }

    public String getSede() {
        return sede;
    }

    public String getCorreo() {
        return correo;
    }

    public String getPassword() {
        return password;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getEstrato() {
        return estrato;
    }

    public String getTelefono1() {
        return telefono1;
    }

    public String getTelefono2() {
        return telefono2;
    }

    public String getDocumento() {
        return documento;
    }

    public String getApoyo() {
        return apoyo;
    }

  
    public int getSolicitud() {
        return solicitud;
    }

    public void setSolicitud(int solicitud) {
        this.solicitud = solicitud;
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

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setProyecto(String proyecto) {
        this.proyecto = proyecto;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setEstrato(String estrato) {
        this.estrato = estrato;
    }

    public void setTelefono1(String telefono1) {
        this.telefono1 = telefono1;
    }

    public void setTelefono2(String telefono2) {
        this.telefono2 = telefono2;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public void setApoyo(String apoyo) {
        this.apoyo = apoyo;
    }
    

}
