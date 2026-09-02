/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dbconnector.Dbconnector;
import dto.ProductDetail;
import dto.UserDisplayObject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author naman
 */
public class AddProduct {
    public boolean addProduct(ProductDetail pd)
    {
      Timestamp currentTimeStamp = new Timestamp(System.currentTimeMillis()); 
      Connection con = Dbconnector.getConnection();
       UserDisplayObject udo = new UserDisplayObject();
     PreparedStatement pst = null;
      try
      {
         pst = con.prepareStatement("INSERT INTO product_table (product_name,product_category,product_price,description,time_stamp,image_url,seller_id,product_condition) values (?,?,?,?,?,?,?,?)");
         pst.setString(1,pd.getProduct_name());
         pst.setString(2, pd.getProduct_category());
         pst.setString(3, pd.getProduct_price());
         pst.setString(4,pd.getDescription());
         pst.setTimestamp(5,currentTimeStamp);
         pst.setBlob(6,pd.getImage_url());
         pst.setString(7,String.valueOf(pd.getSeller_id()));
         pst.setString(8,pd.getCondition());
         int i = pst.executeUpdate();
          System.out.println(i);
          if(i>0)
          { 
              return true;
          }
      }
      catch(SQLException e)
              {
                  System.out.println(e);
                  return false;
              }
      return false;
    }
    
    
}
