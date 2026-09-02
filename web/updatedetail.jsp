<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html>
     <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
    body {
            font-family: sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }

        .update_container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px; /* Increased width for more fields */
        }

        .update_container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .update_form {
            margin-bottom: 15px;
        }

        .update_form label {
            display: block;
            margin-bottom: 5px;
        }

        .update_form input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .update-button {
            background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        .update-button:hover {
            background-color: #00f2fe;
        }

      </style>
    <title>Update</title>
     </head>
     <body>
         <div class="update_container">
             <h2>
                 update details
             </h2>
                 <form id="updateform" action="UserChecker" method="post">
                     <div class="update_form">
                <%
                       String username = request.getParameter("username");
                      // System.out.println(username);
                %>
                <input type="hidden" value =<%= username %> name="username">
                <input type="hidden" value="update" name="action">
                         <label for="firstname">First Name</label>
                         <input type="text" id="firstname" name="firstname">
                     </div>
                     <div class="update_form">
                         <label for="lastname">Last Name</label>
                         <input type="text" id="lastname" name="lastname">
                     </div>
                     <div class="update_form">
                         <label for="contact">Contact</label>
                         <input type="tel" id="contact" name="contact">
                         <small><br>IN THIS FORMAT:1234-567-7890</br></small>
                     </div>
                     <div class="update_form">
                         <label for="address">Address</label>
                         <textarea name="address"></textarea>
                     </div>
                     <div class="update_form">
                         <label for="email">Email</label>
                         <input type="text" id="email" name="email">
                     </div>
                     <div class="update_form">
                         <label for="previouspassword">previous password</label>
                         <input type="text" id="previouspassword" name="previouspassword">
                     </div>
                     <div class="update_form">
                         <label for="newpassword">New password</label>
                         <input type="text" id="newpassword" name="newpassword">
                     </div>
                     <div class="update_form">
                         <label for="confirmpassword">Confirm password</label>
                         <input type="text" id="confirmPassword" name="confirmpassword">
                     </div>
                     <button type="submit" class="update-button">Update</button>
                 </form>
             <input type="hidden" 
     </body>
 
 </html>
