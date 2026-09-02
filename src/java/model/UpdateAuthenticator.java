package model;

import dto.UpdationDataObject;
import dto.UserDisplayObject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class UpdateAuthenticator 
{
    public boolean updatedetail(UpdationDataObject ud)
    {
        Connection con = dbconnector.Dbconnector.getConnection();
        PreparedStatement pst = null;
         boolean up = true;
        boolean f = true;
        int count = 0;
//         UserDisplayDao udd = new UserDisplayDao();
//        String u= (String)session.getAttribute("username");
//         System.out.println(u);
         UserDisplayObject udo = new UserDisplayObject();       
        StringBuilder query = new StringBuilder("UPDATE user SET ");
//        System.out.println("hello111");
        HashMap<Integer,String> m1 = new HashMap<>();
       // System.out.println(ud.getFirst_name());
        if(ud.getFirst_name()!=null && !ud.getFirst_name().isEmpty())
        {
            if(!f)
            {query.append(", ");}
            query.append("first_name = ?");
            f = false;
            m1.put(++count,ud.getFirst_name());
            
            
        }
          System.out.println(ud.getFirst_name());
       if(ud.getLast_name()!=null && !ud.getLast_name().isEmpty())
        {
            if(!f){query.append(", ");}
            query.append("last_name = ?");
            f = false;
            m1.put(++count,ud.getLast_name());
            
        }
         System.out.println(ud.getLast_name());
        
        if(ud.getContact()!=null && !ud.getContact().isEmpty())
        {
            if(!f){query.append(", ");}
            query.append("contact = ?");
            f = false;
            m1.put(++count,ud.getContact());
            
            
        }
         System.out.println(ud.getContact());
         if(ud.getEmail()!=null&&!ud.getEmail().isEmpty())
        {
            if(!f){query.append(", ");}
            query.append("email = ?");
            f = false;
            m1.put(++count,ud.getEmail());
            

        }
         System.out.println(ud.getEmail());
         if(ud.getAddress()!=null && !ud.getAddress().isEmpty())
        {
            if(!f){query.append(", ");}
            query.append("address = ?");
            f = false;
            m1.put(++count,ud.getAddress());
            
         }
           System.out.println(ud.getAddress());
           System.out.println(ud.getUsername());
           if (m1.isEmpty()) {
            return false; }
         query.append(" WHERE username = ?");
         m1.put(++count,ud.getUsername());
        String sql = query.toString();
        System.out.println(sql);
         for(int key : m1.keySet())
        {
            System.out.println(key + "=" + m1.get(key));
        }
         try
        {  
        
          pst = con.prepareStatement(query.toString());
          for(int key : m1.keySet())
          {
              pst.setString(key,m1.get(key));
          }
          int i = pst.executeUpdate();
          if(i>0)
          {
              up = true;
          }
    
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return up;
    }
    
}
 