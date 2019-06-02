/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author HP
 */
public class dbmanager {
    private String driver="com.mysql.jdbc.Driver";
    private String url= "jdbc:mysql://localhost:3306/proaula";
    private String user="root";
    private String pass="n0m3l0";
    
    public dbmanager(){
        
    }
    
    public Connection Conectar(){
        try{
            Class.forName(driver).newInstance();
            return (DriverManager.getConnection(url,user,pass));
            
        }catch(Exception e){
            
        }
        return null;
    }
    
    public void Desconectar(Connection cn){
        try{
            cn.close();
        }catch(Exception e){
            
        }
    }
    
    
}
