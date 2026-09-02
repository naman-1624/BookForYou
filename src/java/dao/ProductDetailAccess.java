/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.FilterData;
import dto.ProductDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author naman
 */
public class ProductDetailAccess {
    public ArrayList<ProductDetail> allproductdetails()
    {
        ArrayList<ProductDetail> l1 = new ArrayList<ProductDetail>();
        
        Statement st = dbconnector.Dbconnector.getStatement();
        try
        {
            String Query = "SELECT product_name,product_category,product_price,description,product_condition,product_id FROM product_table WHERE is_sold = 0";
            ResultSet rs = st.executeQuery(Query);
            if(rs.next())
            {
                ProductDetail pd = new ProductDetail();
                pd.setProduct_name(rs.getString(1));
                pd.setProduct_category(rs.getString(2));
                pd.setProduct_price(rs.getString(3));
                pd.setDescription(rs.getString(4));
                pd.setCondition(rs.getString(5));
                pd.setProduct_id(Integer.parseInt(rs.getString(6)));
                l1.add(pd);   
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        System.out.println(l1.size());
        return l1;
    }
    public ArrayList<ProductDetail> allproductfilter(FilterData fd) 
    {
        ArrayList<ProductDetail> l1 = new ArrayList<ProductDetail>();
        PreparedStatement pst = null;
        
        try
        {
            String query = "SELECT product_name,product_category,product_price,description,product_condition FROM product_table WHERE is_sold = 0 AND ";
            if(fd.getCategory()!=null && !fd.getCategory().isEmpty())
            {
                query +="AND product_category = ?";
            }
            if(fd.getCondition() != null && !fd.getCategory().isEmpty())
            {
                query += "AND condition = ?";
            }
             if(fd.getMin_price() != null && !fd.getMin_price().isEmpty())
            {
                query += "AND  product_price>= ?";
            }
              if(fd.getMax_price() != null && !fd.getMax_price().isEmpty())
            {
                query += "AND product_price  <= ?";
            }
              else
              {
                  query += "ORDER BY product_name ASC";
              }
              int index = 1;
              if(fd.getCondition() != null)
              {
                  pst.setString(index++,fd.getCondition());
              }
              if(fd.getCategory() != null)
              {
                  pst.setString(index++,fd.getCategory());
              }
              if(fd.getMin_price()!= null)
              {
                  pst.setString(index++,fd.getMin_price());
              }
              if(fd.getMax_price() != null)
              {
                  pst.setString(index++,fd.getMax_price());
              }
              
            
            ResultSet rs = pst.executeQuery(query);
            while(rs.next())
            {
                ProductDetail pd = new ProductDetail();
                pd.setProduct_name(rs.getString(1));
                pd.setProduct_category(rs.getString(2));
                pd.setProduct_price(rs.getString(3));
                pd.setDescription(rs.getString(4));
                pd.setCondition(rs.getString(5));
                l1.add(pd);
                
            }
            
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return l1;
    }
//     public int getProduct_Id(String username)
//    {
//        int product_id = 0;
//        Statement st = dbconnector.Dbconnector.getStatement();
//        try
//        {
//            String query = "SELECT product_id from user WHERE product_table ='"+username+"'";
//            System.out.println(query);
//            ResultSet rs = st.executeQuery(query);
//            if(rs.next())
//            {
//              product_id = Integer.parseInt(rs.getString(1));
//            }
//        }  
//        catch (SQLException e) {
//            System.out.println(e);
//        }
//        return product_id;
//    
//}
     public ArrayList<ProductDetail> cartProducts(Map<String,Integer> cart)
    {
        ArrayList<ProductDetail> l1 = new ArrayList<ProductDetail>();
        
        Statement st = dbconnector.Dbconnector.getStatement();
        Set<String> keySet = cart.keySet();
        String[] key = (String[]) keySet.toArray();
        
        for(int i=0;i<key.length;i++)
            
        try
        {
            String Query = "SELECT product_name,product_category,product_price,description,product_condition,product_id FROM product_table WHERE '"+key[i]+"'";
            ResultSet rs = st.executeQuery(Query);
            if(rs.next())
            {
                ProductDetail pd = new ProductDetail();
                pd.setProduct_name(rs.getString(1));
                pd.setProduct_category(rs.getString(2));
                pd.setProduct_price(rs.getString(3));
                pd.setDescription(rs.getString(4));
                pd.setCondition(rs.getString(5));
                pd.setProduct_id(Integer.parseInt(rs.getString(6)));
                l1.add(pd);   
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        System.out.println(l1.size());
        return l1;
    }
}
