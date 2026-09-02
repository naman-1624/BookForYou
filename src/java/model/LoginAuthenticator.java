package model;

import java.sql.Statement;
import dbconnector.Dbconnector;
import dto.UserDisplayObject;
import java.sql.ResultSet;
import java.sql.SQLException;



public class LoginAuthenticator 
{
    public boolean isLogin(UserDisplayObject d1) throws SQLException
    {
        Statement st = Dbconnector.getStatement();
        
       String username = d1.getUsername();
       String password = d1.getPassword();
       String tpassword = "";
       try
       {
           String query = "SELECT password FROM user WHERE username = '"+username+"'";
           System.out.println(query);
           ResultSet rs = st.executeQuery(query);
           if(rs.next())
           {System.out.println(query);
               
             tpassword = rs.getString(1);
             System.out.println(query);
           }
           else
           {
               return false;
           }
           
       }
       catch(SQLException e)
       {
           System.out.println(e);
       }
       System.out.println(username);
        System.out.println(tpassword);
       if(username!=null && password!=null && !username.trim().equals("")  && password.equals(tpassword))
    {
           System.out.println("hello");
           return true;
       }
       else
       {
        return false;
       }
}
}