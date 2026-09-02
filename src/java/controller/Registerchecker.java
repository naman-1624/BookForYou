
package controller;

import dto.RegisterDataSaving;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.RegisterAuthenticator;




public class Registerchecker extends HttpServlet
{
    public void doGet(HttpServletRequest request , HttpServletResponse response)throws ServletException ,IOException
     {
         response.sendRedirect("login.html");
     }
    public void doPost(HttpServletRequest request , HttpServletResponse response)throws ServletException ,IOException
    {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstName");
        String lastname = request.getParameter("lastName");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        RegisterDataSaving rdo = new RegisterDataSaving();
        rdo.setUsername(username);
        rdo.setPassword(password);
        rdo.setConfirm_password(confirmpassword);
        rdo.setAddress(address);
        rdo.setEmail(email);
        rdo.setContact(contact);
        rdo.setFirst_name(firstname);
        rdo.setLast_name(lastname);
        RegisterAuthenticator rs = new RegisterAuthenticator();
        boolean check = false;
        //System.out.println("hello");
            check = rs.isRegister(rdo);
            System.out.println(check);
       // System.out.println("hello");
        //System.out.println(check);
        if(check)
        {
            HttpSession session = request.getSession(true);
            session.setAttribute("username",username);
            response.sendRedirect("index.jsp");
        }
        else
        {
            response.sendRedirect("login.html");  
        }
    
}
}
