package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class WareHouseStorage extends HttpServlet 
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       response.sendRedirect("pricingList.jsp");
        }
     public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
     {
        String[] storageOptions = request.getParameterValues("storageOption"); // Get multiple selections

        if (storageOptions == null || storageOptions.length == 0) {
            String check = "please enter the choice";
            request.setAttribute("message",check);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pricingList.jsp"); // Forward to JSP
            dispatcher.forward(request, response);
         
     }
     
}
}
