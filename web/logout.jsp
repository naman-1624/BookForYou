<%-- 
    Document   : logout
    Created on : 2 Apr, 2025, 9:07:27 PM
    Author     : naman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Logout Page</title>
    </head>
    <body>
      <style>
        body {
            body {
    font-family: sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: auto;
    padding: auto; /* Add some padding around the body for smaller screens */
}

.logout-container {
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    width: 90%; /* Adjust width for smaller screens */
    max-width: 400px;
    margin: auto;
    margin-top: 15rem/* Limit maximum width for larger screens */
}

h1 {
    color: #333;
    margin-bottom: 20px;
    font-size: 1.8rem; /* Adjust font size */
}

p {
    color: #666;
    margin-bottom: 25px;
    font-size: 1rem; /* Adjust font size */
    line-height: 1.5;
}

.logout-button, .cancel-button {
    display: inline-block;
    padding: 12px 25px;
    border-radius: 5px;
    font-weight: bold;
    text-decoration: none;
    transition: background-color 0.3s ease;
    font-size: 1rem; /* Adjust font size */
}

.logout-button {
    background-color: #dc3545;
    color: white;
    margin-bottom: 10px; /* Add some margin between buttons on smaller screens */
}

.logout-button:hover {
    background-color: #c82333;
}

.cancel-button {
    background-color: #f0f0f0;
    color: #333;
    border: 1px solid #ccc;
    margin-left: 0; /* Remove left margin for stacking on smaller screens */
}

.cancel-button:hover {
    background-color: #e0e0e0;
}


    .logout-button, .cancel-button {
        display: block; /* Stack buttons on smaller screens */
        width: 100%;
        margin-bottom: 10px;
        text-align: center;
        padding: 10px;
        font-size: 0.9rem;
    }

    .cancel-button {
        margin-left: 0; /* Ensure no left margin when stacked */
    }
}

/* Media query for slightly larger screens (min-width: 601px and max-width: 768px) */
@media (min-width: 601px) and (max-width: 768px) {
    h1 {
        font-size: 2rem;
    }

    p {
        font-size: 1.1rem;
    }

    .logout-button, .cancel-button {
        padding: 15px 30px;
        font-size: 1.1rem;
    }
}
    </style>
</head>
<body>
    <div class="logout-container">
         <%
             String username = (String)session.getAttribute("username");
            if(username == null)
            {
                response.sendRedirect("Login.html");
            }
        %>
        <h1>Ready to Log Out?</h1>
        <p>Are you sure you want to log out of your account?</p>
        <form action="UserChecker" method="post" >
            <input type="hidden" value="<%=username%>" name="username">
            <input type="hidden" value="logout" name="action" >
            <button type="submit" class="logout-button"> Logout</button>    
        </form>
            <button class="cancel-button"><a href="index.jsp" >Cancel</a></button>
    </div>
</body>
</html>  
