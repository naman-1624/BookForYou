package controller;

import dto.UserDisplayObject;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginAuthenticator;

/**
 *
 * @author naman
 */
public class LoginChecker extends HttpServlet {

     public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       response.sendRedirect("Login.html");
        }

   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
                 response.sendRedirect("index.jsp");
             }
             else
             {
                 response.sendRedirect("login.html");
             }} catch (SQLException ex) {
             Logger.getLogger(LoginChecker.class.getName()).log(Level.SEVERE, null, ex);
         }
         
}
}