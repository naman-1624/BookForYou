/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDetailAccess;
import dao.UserDisplayDao;
import dto.FilterData;
import dto.ProductDetail;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.AddProduct;


@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
    maxFileSize = 1024 * 1024 * 10,    // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class Seller extends HttpServlet {
    private static final long serialVersionUID = 1l;
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException , IOException
    {
      response.sendRedirect("sell.jsp");
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException , IOException
    {
        String action = request.getParameter("action");
        if("filter".equals(action))
        {
            handleFilter(request,response);
        }
        else if("add".equals(action))
        {
            handleAddProduct(request,response);
        }
        
        
     }

 private void handleFilter(HttpServletRequest request,HttpServletResponse response)throws ServletException
{
    String category = request.getParameter("category");
    String min_price = request.getParameter("min-price");
    String max_price = request.getParameter("max-price");
    String condition = request.getParameter("condition");
    FilterData fd = new FilterData();
    fd.setCategory(category);
    
    fd.setCondition(condition);
   
    fd.setMax_price(max_price);
   
    fd.setMin_price(min_price);
    ProductDetailAccess pda = new ProductDetailAccess();
            pda.allproductfilter(fd);
    
    
    
    
}
 
 private void handleAddProduct(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
{
    InputStream inputStream = null;
    System.out.println("hellooooooooooooooo");
    String username = request.getParameter("user");
        String product_name = request.getParameter("name");
        String product_price = request.getParameter("price");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        Part filePart = request.getPart("image");
        System.out.println("1112222121212");
        System.out.println(filePart);
        if(filePart != null)
        {
            System.out.println("file part");
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            inputStream = filePart.getInputStream();
        }
        String condition = request.getParameter("condition");
        ProductDetail pd = new ProductDetail();
        UserDisplayDao udo = new UserDisplayDao();
        int seller_id = udo.getUserid(username);
        System.out.println("hello");
        System.out.println(username);
        System.out.println(seller_id);
        pd.setSeller_id(seller_id);
        pd.setDescription(description);
        pd.setImage_url(inputStream);
        pd.setProduct_name(product_name);
        pd.setProduct_category(category);
        pd.setProduct_price(product_price);
        pd.setCondition(condition);
        AddProduct ad = new AddProduct();
        boolean ischeck = ad.addProduct(pd);
        if(ischeck)
        {
            System.out.println("product added sucessfully");
            response.sendRedirect("product.jsp");
        }
        else
        {
            System.out.println("not added");
        }
        
        
     }
}
