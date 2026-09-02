/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dto.UpdationDataObject;
import dto.UserDisplayObject;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author naman
 */
public class passwordAuthenticator {
    public boolean isChange(UpdationDataObject ud){
     Connection con = dbconnector.Dbconnector.getConnection();
        Statement st = dbconnector.Dbconnector.getStatement();
         String username = ud.getUsername();
         if(ud.getNewpassword().equals(ud.getConfirmpassword()))
         {
            try
         {
        String query = "SELECT password FROM user WHERE username ='"+username+"'";
        String tablepassword ="";
             System.out.println(query);
             System.out.println("process");
        ResultSet rs = st.executeQuery(query);
        if(rs.next())
        {
            tablepassword = rs.getString(1);
        }
        if(ud.getPreviouspassword().equals(tablepassword))
        {
          String update = "UPDATE user SET password = '"+ud.getNewpassword()+"' WHERE username ='"+username+"'";
            System.out.println(update);
          int i = st.executeUpdate(update);
          if(i>0)
          {
             return true; 
          }
        }
        }
         catch(SQLException e)
         {
             System.out.println(e);
         }
    } 
        return false;
}}
