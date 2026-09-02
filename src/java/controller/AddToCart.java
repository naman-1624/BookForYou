/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author naman
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException
    {
       String product_id = request.getParameter("product_id");
       HttpSession session = request.getSession();
       Cart cart = (Cart) session.getAttribute("cart");
       if(cart == null)
       {
           cart = new Cart();
           session.setAttribute("cart", cart);
       }
       cart.additems(product_id);
       response.sendRedirect("product.jsp");
    }

  
}
