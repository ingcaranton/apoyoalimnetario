/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apoyo.conexion;

import java.sql.*;

/**
 *
 * @author root
 */
public class Conexion {

    protected Connection con;
    protected Statement stmt;
    private String serverName = "localhost";
    private String porNumber = "3306";
    private String databaseName = "bdApoyo";
    private String url = "jdbc:mysql://localhost:3306/" + databaseName;
    private String userName = "root";
    private String password = "admin";
    private String errString;
    private ResultSet resultado;

    public Conexion() {
        Conectar();
    }

    private String getConnectionUrl() {
        return url;
    }

    public Connection Conectar() {
        con = null;
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            con = DriverManager.getConnection(getConnectionUrl(), userName, password);
            //Class.forName("org.sqlite.JDBC");
            //con = DriverManager.getConnection("jdbc:sqlite:/root/NetBeansProjects/ApoyoAlimentario_v2/bdApoyo.sqlite");
            stmt = con.createStatement();
            System.out.println("Conectado!");

        } catch (Exception e) {
            errString = "Error Mientras se conectaba a la Base de Datos";
            System.out.println(errString);
            return null;
        }
        return con;
    }

    public void Desconectar() {
        try {
            stmt.close();
            con.close();
        } catch (SQLException e) {
            errString = "Error minetras se Cerraba la conexión a la Base de Datos";
        }
    }

    public void setStmt(Statement stmt) {
        this.stmt = stmt;
    }

    public Statement getStmt() {
        return stmt;
    }

    public ResultSet Buscar(String sql) throws SQLException {
        try {
            getStmt();
            resultado = stmt.executeQuery(sql);
            System.out.println("Se ejecuto la consulta: " + sql);
            return resultado;
        } catch (Exception ex) {
            System.out.println("Error - SQLException" + ex.getMessage());
            return null;
        }
    }
    
    public void Insertar(String sql) throws SQLException {
        try {
            getStmt();
            stmt.executeUpdate(sql);
            System.out.println("Se ejecuto la consulta: " + sql);
        } catch (Exception ex) {
            System.out.println("Error - SQLException" + ex.getMessage());
            
        }
    }
    public void Actualizar(String sql) throws SQLException {
        try {
            getStmt();
           stmt.executeUpdate(sql);
            System.out.println("Se ejecuto la consulta: " + sql);
        } catch (Exception ex) {
            System.out.println("Error - SQLException" + ex.getMessage());
            
        }
    }
    public void eliminar(String sql) throws SQLException {
        try {
            getStmt();
            stmt.executeUpdate(sql);
            System.out.println("Se ejecuto la consulta: " + sql);
        } catch (Exception ex) {
            System.out.println("Error - SQLException" + ex.getMessage());
            
        }
    }
    
    

}
