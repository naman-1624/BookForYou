package dao;

import dto.UserDisplayObject;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
public class UserDisplayDao 
{
    UserDisplayObject udo = new UserDisplayObject();
    public UserDisplayObject userDetail(String user_id)
    {
        Statement st = dbconnector.Dbconnector.getStatement();
        try
        {
            String query = "SELECT user_id,username,email,first_name,last_name,contact,address FROM user WHERE username ='"+user_id+"'";
            ResultSet rs = st.executeQuery(query);
            System.out.println(query);
            if(rs.next())
            {
                udo.setUser_id(rs.getString(1));
                udo.setUsername(rs.getString(2));
                udo.setEmail(rs.getString(3));
                udo.setFirst_name(rs.getString(4));
                udo.setLast_name(rs.getString(5));
                udo.setContact(rs.getString(6));
                udo.setAddress(rs.getString(7));
            }
            
        } catch (SQLException e) {
            System.out.println(e); 
        }
        return udo;
    }
    public int getUserid(String username)
    {
        int user_id = 0;
        Statement st = dbconnector.Dbconnector.getStatement();
        try
        {
            String query = "SELECT user_id from user WHERE username ='"+username+"'";
            System.out.println(query);
            ResultSet rs = st.executeQuery(query);
            if(rs.next())
            {
              user_id = Integer.parseInt(rs.getString(1));
            }
        }  
        catch (SQLException e) {
            System.out.println(e);
        }
        return user_id;
    
}
}
