package paquet;

import java.sql.Connection;
import paquet.Usuario;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBManager {
    
    private String url = "jdbc:mysql://localhost:3306/practicaJSP?allowMultiQueries=true";
    private Connection con = null;
    
    public void connect(){
        try {
            Class.forName(("com.mysql.jdbc.Driver"));
            con = (Connection) DriverManager.getConnection(url,"root","");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void close(){
        try {
            if(con!=null){
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Usuario> getUsuarios(){
        PreparedStatement st = null;
        List<Usuario> usuarios = new ArrayList<Usuario>();
        try{
            
            st = con.prepareStatement("select id, correu, contrasenya from usuaris;");
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                //u.setNombre(rs.getString("nombre"));
                u.setEmail(rs.getString("correu"));
                u.setPassword(rs.getString("contrasenya"));
                usuarios.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuarios;
    }
    
    public Usuario getUsuario(String userId){
        PreparedStatement st = null;
        Usuario usuario = null;
        try{
            
            st = con.prepareStatement("select id, correu, contrasenya from usuaris where correu=?;");
            st.setString(1, userId);
            
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                //usuario.setNombre(rs.getString("nombre"));
                usuario.setEmail(rs.getString("correu"));
                usuario.setPassword(rs.getString("contrasenya"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuario;
    }
    
    public boolean insertUsuario(Usuario u){
        try {
            //String id = "0";
            String query = "insert into usuaris (id, correu, contrasenya) values (?,?,?)";
            PreparedStatement preparedStmt;
            preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, null);
            preparedStmt.setString(2, u.getEmail());
            preparedStmt.setString(3, u.getPassword());
            preparedStmt.execute();
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean updateUsuario(Usuario u){
        try {
            
            String query = "update usuario set nombre=?, email=?, password=? where id=?";
            PreparedStatement preparedStmt;
            preparedStmt = con.prepareStatement(query);
            
            preparedStmt.setString(1, u.getNombre());
            preparedStmt.setString(2, u.getEmail());
            preparedStmt.setString(3, u.getPassword());
            
            preparedStmt.setInt(4, u.getId());
            
            preparedStmt.execute();
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean deleteUsuario(int userId){
        try {
            String query = "delete from usuario where id=?";
            PreparedStatement preparedStmt;
            preparedStmt = con.prepareStatement(query);
            preparedStmt.setInt(1, userId);
            preparedStmt.execute();
            return true;
        } catch (SQLException ex) {
            return false;
        }        
    }
    
    
    
    
    
}