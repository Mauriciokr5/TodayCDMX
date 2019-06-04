/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

/**
 *
 * @author HP
 */
public class metodo {
    
    public metodo(){
        
    }
    
    
    
    public static USU verificarUsuario(String correo, String pass){
        USU e = new USU();
        System.out.println("Verificando");
        
                
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            String q;
            q="Select * from usuario where correo = ? and contrasena = ?;";//?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            ps.setString(1, correo);
            ps.setString(2, pass);
            
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                e.setNombre(rs.getString(2));
                e.setCorreo(rs.getString(3));
                e.setContrasena(rs.getString(4));
                e.setTipo(rs.getInt(5));
            }            
            cn.close();        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo)verificarUsu");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return e;
    }
    
    
    public static int Guardar(USU e){
        int estatus=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="INSERT INTO usuario (nombre,correo,contrasena,idtipo) values (?,?,?,?);";//?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            
            
            
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getCorreo());
            ps.setString(3, e.getContrasena());
            ps.setInt(4, e.getTipo());
            
                
            
            
            estatus=ps.executeUpdate();
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) guardar");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    
    
    
    
    
    
    
    public static int Eliminar(int id){
        int estatus=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="delete from usuarios where idUsuario = ?";//?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            ps.setInt(1, id);
            
            estatus=ps.executeUpdate();
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) Eliminar");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
}
