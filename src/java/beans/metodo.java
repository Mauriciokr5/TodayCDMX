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
    
    
    
    public static String MostrarDatos(){
        String producto="";
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            Statement st= cn.createStatement();
            //producto="estate men";
            ResultSet rs= st.executeQuery("Select * from usuarios");
            while(rs.next())
                    {
                        producto += rs.getString("Usuario");
                    }
            //producto = ""+String.valueOf(rs.getObject("idUsuario"));
            cn.close();
            return producto;
            
            
        }catch(Exception e){
           // producto=String.valueOf(e);
            
        }
        return producto;
        
    }
    
    public static ArrayList Platillos(String fecha){
        ArrayList plat = new ArrayList();
        
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            Statement st= cn.createStatement();
            
            ResultSet rs= st.executeQuery("select platillo from menu_platillo inner join platillos on menu_platillo.idPltillo=platillos.idPlatillo inner join random on menu_platillo.idMenu = random.idMenu where random.fecha='"+fecha+"';");
            
            while(rs.next()){
                plat.add(rs.getString("platillos.platillo"));
            }
            cn.close();
            return plat;
            
        }catch(Exception e){
           // producto=String.valueOf(e);
            
        }
        return null;
    }
    
    
    
    public static ArrayList PlatillosPorMenu(int id){
        ArrayList plat = new ArrayList();
        
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            Statement st= cn.createStatement();
            
            ResultSet rs= st.executeQuery("select distinct platillo from menu_platillo inner join platillos on menu_platillo.idPltillo=platillos.idPlatillo  where menu_platillo.idMenu='"+id+"';");
            
            while(rs.next()){
                plat.add(rs.getString("platillos.platillo"));
            }
            cn.close();
            return plat;
            
        }catch(Exception e){
           // producto=String.valueOf(e);
            
        }
        return null;
    }
    
    
    
    
    
    
    
    
    
    
    public static ArrayList<beansIngredientes> Ingredientes(String platillo){
        ArrayList ingre = new ArrayList();
        
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            Statement st= cn.createStatement();
            
            //ResultSet rs= st.executeQuery("select distinct ingrediente,porcion,unidad from menu_platillo inner join platillos on menu_platillo.idPlatillo=platillos.idPlatillo inner join random on menu_platillo.idMenu = random.idMenu inner join ingredientes on platillos.idPlatillo=ingredientes.idPlatillo where platillo='"+platillo+"';");
            ResultSet rs = st.executeQuery("select distinct idIngrediente, ingrediente,porcion,unidad from menu_platillo inner join platillos on menu_platillo.idPltillo=platillos.idPlatillo inner join ingredientes on platillos.idPlatillo=ingredientes.idPlatillo where platillo='"+platillo+"';");
            while(rs.next()){
                beansIngredientes base = new beansIngredientes();
                base.setIngrediente(rs.getString("ingredientes.ingrediente"));
                base.setPorcion(rs.getFloat("ingredientes.porcion"));
                base.setUnidad(rs.getString("ingredientes.unidad"));
                base.setIdIngre(rs.getInt("ingredientes.idIngrediente"));
                
                ingre.add(base);
            }
            cn.close();
            return ingre;
            
        }catch(Exception e){
           // producto=String.valueOf(e);
            
        }
        return ingre;
    }
    
    /*public static ArrayList Porcion(String platillo){
        ArrayList por = new ArrayList();
        String pr;
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            Statement st= cn.createStatement();
            
            ResultSet rs= st.executeQuery("select distinct ingrediente,porcion,unidad from menu_platillo inner join platillos on menu_platillo.idPltillo=platillos.idPlatillo inner join random on menu_platillo.idMenu = random.idMenu inner join ingredientes on platillos.idPlatillo=ingredientes.idPlatillo where platillo='"+platillo+"';");
            
            while(rs.next()){
                pr=rs.getString("ingredientes.porcion")+" "+rs.getString("ingredientes.unidad");
                por.add(pr);
            }
            cn.close();
            return por;
            
        }catch(Exception e){
           // producto=String.valueOf(e);
            
        }
        return null;
    }*/
    
    public static ArrayList<Emp> getAllEmpleados(){
        ArrayList<Emp> lista=new ArrayList<Emp>();
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
                        String q;
            q="Select * from Usuarios";

            PreparedStatement ps=cn.prepareStatement(q);
                        
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                Emp e=new Emp();
                
                e.setIdUsuarios(rs.getInt(1));
                e.setUsuario(rs.getString(2));
                e.setPassword(rs.getString(3));
                e.setRol(rs.getInt(4));
                lista.add(e);
            }            
            cn.close();        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo)getAll");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return lista;
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
    
    
    
    public static int GuardarPlatillo(beansIngredientes e, int idPlat){
        int estatus=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="insert into ingredientes (idPlatillo, ingrediente, porcion , unidad) values (?,?,?,?)";//?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            
            
            
            ps.setInt(1, idPlat );
            ps.setString(2, e.getIngrediente());
            ps.setFloat(3, e.getPorcion());
            ps.setString(4, e.getUnidad());
            
                
            
            
            estatus=ps.executeUpdate();
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) guardar");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    
    
    public static beansIngredientes getIngrediente(int idIngre){
        beansIngredientes e = new beansIngredientes();
        
                
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            String q;
            q="Select * from ingredientes where idIngrediente="+idIngre+";"; //?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            
            
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                e.setIdIngre(rs.getInt("idIngrediente"));
                e.setIngrediente(rs.getString("ingrediente"));
                e.setPorcion(rs.getFloat("porcion"));
                e.setUnidad(rs.getString("unidad"));
                
            }            
            cn.close();        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo)verificarUsu");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return e;
    }
    
    
    
    
    
    
    public static int Actualizar(Emp e){
        int estatus=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="update usuarios set Usuario = ?, Password = ?, Rol = ? where idUsuario = ?";//?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            ps.setString(1, e.getUsuario());
            ps.setString(2, e.getPassword());
            ps.setInt(3, e.getRol());
            ps.setInt(4, e.getIdUsuarios());
            
            estatus=ps.executeUpdate();
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) Actualizar");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    
    
    
    
    public static int idMenu(String fecha){
        int idMEnu=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="select idMenu from random where fecha='"+fecha+"';";//?= echale lo que quieras
            PreparedStatement ps=cn.prepareStatement(q);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                 idMEnu=rs.getInt(1);
            }
            
            
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) Actualizar");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return idMEnu;
    }
    
    
    
    
    public static int valMenu(int emu){
        int idMEnu=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="select idMenu from menus where idMenu='"+emu+"';";//?= echale lo que quieras
            PreparedStatement ps=cn.prepareStatement(q);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                 idMEnu=rs.getInt(1);
            }
            
            
            
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) Actualizar");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return idMEnu;
    }
    
     public static int valPlat(int emu){
        int idMEnu=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="select idPlatillo from platillos where idPlatillo='"+emu+"';";//?= echale lo que quieras
            PreparedStatement ps=cn.prepareStatement(q);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                 idMEnu=rs.getInt(1);
            }
            
            
            
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) Actualizar");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return idMEnu;
    }
    
    
    
    
    
    
    public static String platPorId(int emu){
        String idMEnu="";//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="select platillo from platillos where idPlatillo='"+emu+"';";//?= echale lo que quieras
            PreparedStatement ps=cn.prepareStatement(q);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                 idMEnu=rs.getString(1);
            }
            
            
            
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) Actualizar");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return idMEnu;
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
    
    
    public static Emp getEmpleadoById(int id){
        Emp e = new Emp();
                
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="Select * from Usuarios where idUsuario = ?";//?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement(q);
            ps.setInt(1, id);
            
            ResultSet rs=ps.executeQuery();
            if (rs.next()) {
                e.setIdUsuarios(rs.getInt(1));
                e.setUsuario(rs.getString(2));
                e.setPassword(rs.getString(3));
                e.setRol(rs.getInt(4));
                
            }            
            cn.close();        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) getEmpleado");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return e;
    }
    
    
    public static ArrayList<platillo> PlatillosConId(int id){
        ArrayList plat = new ArrayList();
        
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            Statement st= cn.createStatement();
            
            ResultSet rs= st.executeQuery("select  * from menu_platillo inner join platillos on menu_platillo.idPltillo=platillos.idPlatillo  where menu_platillo.idMenu='"+id+"';");
            
            while(rs.next()){
                platillo pl = new platillo();
                
                pl.setIdPlatillo(rs.getInt("platillos.idPlatillo"));
                pl.setNomPlatillo(rs.getString("platillos.platillo"));
                plat.add(pl);
            }
            cn.close();
            return plat;
            
        }catch(Exception e){
           // producto=String.valueOf(e);
            
        }
        return null;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    public static ArrayList getAllMenus(){
        ArrayList lista=new ArrayList();
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
                        String q;
            q="Select * from menus order by 1;";

            PreparedStatement ps=cn.prepareStatement(q);
                        
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                
                
                
                lista.add(Integer.parseInt(String.valueOf(rs.getInt("idMenu"))));
            }            
            cn.close();        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo)getAll");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return lista;
    }
    
    public static int nuevoMenu(int numMen){
        int estatus=0;
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            q="insert into menus values("+numMen+");";

            PreparedStatement ps=cn.prepareStatement(q);
                        
            
            
            estatus=ps.executeUpdate();          
            cn.close();        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo)getAll");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    public static int eliminarMenu(int id){
        int estatus=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            //?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement("delete from menus where idMenu="+id+";");
            PreparedStatement ps2=cn.prepareStatement("delete from menu_platillo where idMenu='"+id+"';");
            
            
            estatus=ps.executeUpdate();
            if (estatus>0) {
                estatus=ps2.executeUpdate();
                
            }else{
                
            }
            
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) Eliminar");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    
    public static int eliminarPlatillo(int id){
        int estatus=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            String q;
            //?= echale lo que quieras

            PreparedStatement ps=cn.prepareStatement("delete from ingredientes where idIngrediente="+id+";");
            
            
            estatus=ps.executeUpdate();
            
            
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) Eliminar");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    
    
    
    
    
    
    
    
    
    
    public static int Asistencia(String fecha, int alumnos){
        int estatus=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            

            PreparedStatement ps, ps2 , ps3;
            
            
            ps=cn.prepareStatement("select count(*) from asistencia where fecha='"+fecha+"';");
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                estatus=rs.getInt(1);
            }   
            
            if (estatus!=0) {
                ps3=cn.prepareStatement("update asistencia set alumnos = "+alumnos+" where fecha ='"+fecha+"' ;");
                ps3.executeUpdate();
                estatus=3;
                
            }else{
                if (estatus==0) {
                    ps2=cn.prepareStatement("insert into asistencia values('"+fecha+"','"+alumnos+"');");
                    if (ps2.executeUpdate()!=0) {
                    estatus=2;
                    }else{
                        estatus=0;
                    }
                }
                
                
                
            
            }
            //estatus=rs.getInt(1);
            
                
            
            
            
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) asistencia");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    
    public static int random(String fecha, int idmenus){
        int estatus=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            

            PreparedStatement ps, ps2 , ps3;
            
            
            ps=cn.prepareStatement("select count(*) from random where fecha='"+fecha+"';");
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                estatus=rs.getInt(1);
            }   
            
            if (estatus!=0) {
                ps3=cn.prepareStatement("update random set idMenu = "+idmenus+" where fecha ='"+fecha+"' ;");
                ps3.executeUpdate();
                estatus=3;
                
            }else{
                if (estatus==0) {
                    ps2=cn.prepareStatement("insert into random values("+idmenus+",'"+fecha+"');");
                    if (ps2.executeUpdate()!=0) {
                    estatus=2;
                    }else{
                        estatus=0;
                    }
                }
            }
            //estatus=rs.getInt(1);
            
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) asistencia");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    
    
    public static int addPlat(String platillo, int idmenus){
        int estatus=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            int idPlat=0;
            

            PreparedStatement ps, ps2 , ps3;
            
            
            
            
            
            ps2=cn.prepareStatement("insert into platillos(platillo) values('"+platillo+"');");
            if (ps2.executeUpdate()!=0) {
                    ps=cn.prepareStatement("select max(idPlatillo)  from platillos where platillo='"+platillo+"';");
            
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {

                        idPlat=rs.getInt(1);
                    } 
                    ps3=cn.prepareStatement("insert into menu_platillo values("+idPlat+","+idmenus+");");
                    estatus=ps3.executeUpdate();
            }else{
                estatus=0;
            }
            
            
            
            //estatus=rs.getInt(1);
            
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) asistencia");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return estatus;
    }
    
    
    
    
    
    public static int gatAsistencia(String fecha){
        int asistencia=0;//A fuerza inicializado en 0
        /*
        Es necesario contar con el estado de la tabla de la BD para saber
        si el empleado que voy a registrar es nuevo o no
        */
        
        try{
            dbmanager db= new dbmanager();
            
            Connection cn = db.Conectar();
            
            

            PreparedStatement ps;
            
            
            ps=cn.prepareStatement("select alumnos from asistencia where fecha='"+fecha+"';");
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                asistencia=rs.getInt(1);
            }   
            
            
            //estatus=rs.getInt(1);
            
                
            
            
            
            
            cn.close();
        
        }catch(Exception d){
            System.out.println("No hay conexion... (Solo jugo contigo) asistencia");
            System.out.println(d.getMessage());
            System.out.println(d.getStackTrace());
        }
        return asistencia;
    }
    
    
}
