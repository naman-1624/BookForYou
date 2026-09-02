/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dbconnector.Dbconnector;
import dto.RegisterDataSaving;
import dto.UserDisplayObject;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javafx.util.converter.LocalDateTimeStringConverter;

/**
 *
 * @author naman
 */
public class RegisterAuthenticator {
    public boolean isRegister (RegisterDataSaving save){
           Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

    {
        Connection con = Dbconnector.getConnection();
       PreparedStatement  pst = null;
       try
       {
           pst = con.prepareStatement("INSERT INTO user (username, password, email, first_name, last_name,contact, address, registration_date) VALUES(?,?,?,?,?,?,?,?)");
           pst.setString(1,save.getUsername());
           pst.setString(2,save.getPassword());
           pst.setString(3,save.getEmail());
           pst.setString(4,save.getFirst_name());
           pst.setString(5,save.getLast_name());
           pst.setString(6,save.getContact());
           pst.setString(7,save.getAddress());
                // Set the timestamp parameter
                pst.setTimestamp(8, currentTimestamp);
           int i = pst.executeUpdate();
           System.out.println(i);
           if(i>0)
               return true;
           
       }
       
       catch(SQLException e)
       {
           System.out.println(e);
           return false;
           
       
       } 
        return false;
       
    
    } 
    }
}
