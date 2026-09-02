package dbconnector;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Dbconnector 
{ 
    static Connection con = null;
    static Statement st = null;
    static
    {
        try
        {
          Class.forName("com.mysql.jdbc.Driver");
          con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project1","root","root");
          st = (Statement) con.createStatement();
          
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Dbconnector.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Dbconnector.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public static Connection getConnection()
    {
       return con;   
    
    }
    public  static Statement getStatement()
    {
       return st;   
    
    }
}
