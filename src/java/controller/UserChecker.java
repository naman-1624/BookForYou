package controller;

import dto.RegisterDataSaving;
import dto.UpdationDataObject;
import dto.UserDisplayObject;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginAuthenticator;
import model.RegisterAuthenticator;
import model.UpdateAuthenticator;
import model.passwordAuthenticator;
import sun.java2d.cmm.ProfileDeferralMgr;

public class UserChecker extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException , IOException
    {
        String action = request.getParameter("action");
       if ("update".equals(action)) {
            response.sendRedirect("updatedetail.jsp");
        }
        else if("register".equals(action))
        {
           response.sendRedirect("register.html");
        }
         else {
           
            response.sendRedirect("login.html");
        }  
     }
    
     protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException , IOException
     {
       String action = request.getParameter("action"); // Get the action from the request

        if ("update".equals(action)) {
            handleUpdation(request, response);
        }
        else if("register".equals(action))
        {
           handleRegister(request,response); 
        }
        else if("login".equals(action))
        {
            handleLogin(request,response);
        }
        else if("password".equals(action))
        {
            handleChange(request,response);
        }
        else if("logout".equals(action))
        {
            handleLogout(request,response);
        }
         else {
            // Handle invalid action
            response.sendRedirect("error.jsp?message=Invalid action");
        }  
     }
     private void handleUpdation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
     {
         {
        String newpassword = request.getParameter("newpassword");
        String confirmpassword = request.getParameter("confirmpassword");
        String previouspassword = request.getParameter("previouspassword");
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        UpdationDataObject ud = new UpdationDataObject();
        ud.setNewpassword(newpassword);
        ud.setConfirmpassword(confirmpassword);
        ud.setAddress(address);
        ud.setEmail(email);
        ud.setContact(contact);
        ud.setFirst_name(firstname);
        ud.setLast_name(lastname);
        ud.setPreviouspassword(previouspassword);
        ud.setUsername(username);
         System.out.println(ud.getUsername());
        UpdateAuthenticator ua = new UpdateAuthenticator();
         boolean check = ua.updatedetail(ud);
         if(check)
         {
             response.sendRedirect("profile.jsp");
         }
         else
         {
            response.sendRedirect("updatedetail.jsp"); 
            
         }
     }

     }
     private void handleRegister(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
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
            session.setAttribute("user_id",rdo.getUser_id());
            response.sendRedirect("index.jsp");
        }
        else
        {
            response.sendRedirect("login.html");  
        }
     }
     private void handleLogin(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
     {
          try {
             String username = request.getParameter("username");
             String password = request.getParameter("password");
             
             UserDisplayObject d1 = new UserDisplayObject();
             
             d1.setUsername(username);
             d1.setPassword(password);
             LoginAuthenticator l1 = new LoginAuthenticator();
             boolean check = l1.isLogin(d1);
             
             if(check)
             {
                // System.out.println(check);
                 HttpSession session = request.getSession(true);
                 session.setAttribute("username",username);
                 request.setAttribute("message", "Login successful! Welcome, " + username + ".");
            // Redirect to a welcome page or dashboard
                 response.sendRedirect("index.jsp");
             }
             else
             {
                String message = "Login failed! Please check your username and password.";
            // URL-encode the message
            String encodedMessage = URLEncoder.encode(message, "UTF-8");
            response.sendRedirect("login.html?message=" + encodedMessage);
             }} catch (SQLException ex) {
             Logger.getLogger(LoginChecker.class.getName()).log(Level.SEVERE, null, ex);
         }
         
     }
     private void handleChange(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
     {
         String currentPassword = request.getParameter("currentPassword");
         String newPassword = request.getParameter("newPassword");
         String confirmPassword = request.getParameter("confirmPassword");
         String username = request.getParameter("username");
         UpdationDataObject ud = new UpdationDataObject();
         ud.setNewpassword(newPassword);
         ud.setConfirmpassword(confirmPassword);
         ud.setPreviouspassword(currentPassword);
         ud.setUsername(username);
         System.out.println("password change start");
         passwordAuthenticator p1 = new passwordAuthenticator();
         boolean check = p1.isChange(ud);
         System.out.println("password change completed");
         System.out.println(check);
         if(check)
         {
            request.setAttribute("message", "Change successful!."); 
            response.sendRedirect("profile.jsp");
         }
         else
         {
             String message = "Change failed! Please check your previous and current password.";
            // URL-encode the message
            String encodedMessage = URLEncoder.encode(message, "UTF-8");
            response.sendRedirect("updatepassword.jsp?message=" + encodedMessage);
         }
     }
     private void handleLogout(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
     {
        HttpSession session = request.getSession(false); 
        if (session != null) {
    // Invalidate the session
    session.invalidate();
            System.out.println("Session completed");
            response.sendRedirect("login.html");
}
     }    
}