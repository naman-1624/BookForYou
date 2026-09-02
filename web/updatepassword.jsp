<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px; /* Set a max width for better alignment */
            box-sizing: border-box; /* Include padding in width calculation */
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px; /* Add margin for spacing */
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s;
            box-sizing: border-box; /* Include padding in width calculation */
        }
        input[type="password"]:focus {
            border-color: #007BFF;
            outline: none; /* Remove default outline */
        }
        input[type="submit"] {
             background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
            margin-top: 15px; /* Add margin for spacing */
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
            min-height: 20px; /* Ensure space for error message */
        }
    </style>
<!--    <script>
        function validateForm() {
            const newPassword = document.getElementById("newPassword").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const errorMessage = document.getElementById("errorMessage");

            if (newPassword !== confirmPassword) {
                errorMessage.textContent = "New passwords do not match.";
                return false;
            }
            errorMessage.textContent = ""; // Clear any previous error messages
            return true;
        }
    </script>-->
</head>
<body>
    <div class="container">
        <h2>Update Password</h2>
        <form action="UserChecker" method="post">
            <%
                       String username = request.getParameter("username");
                       System.out.println(username);
                %>
                <input type="hidden" value =<%= username %> name="username">
            <input type="hidden" name="action" value="password">
            <div>
                <label for="currentPassword">Current Password:</label>
                <input type="password" id="currentPassword" name="currentPassword" required>
            </div>
            <div>
                <label for="newPassword">New Password:</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>
            <div>
                <label for="confirmPassword">Confirm New Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <div>
                <input type="submit" value="Update Password">
            </div>
            <div class="error" id="errorMessage">
                <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
            </div>
        </form>
    </div>
</body>
</html>