<%@page import="dto.UserDisplayObject"%>
<%@page import="dao.UserDisplayDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
 <head>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <title>
   User Profile
  </title>
  <script src="https://cdn.tailwindcss.com">
  </script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&amp;display=swap" rel="stylesheet"/>
  <style>
        .link-button {
            background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%); /* Gradient background */
            color: white; /* White text */
            border: none; /* Remove border */
            padding: 15px 32px; /* Add some padding */
            text-align: center; /* Center text */
            text-decoration: none; /* Remove underline */
            display: inline-block; /* Make it inline-block */
            font-size: 16px; /* Increase font size */
            margin: 4px 2px; /* Add some margin */
            cursor: pointer; /* Add a pointer cursor on hover */
        }
    </style>
 </head>
  <%
        UserDisplayDao udd = new UserDisplayDao();
        String u= (String)session.getAttribute("username");
         System.out.println(u);
        UserDisplayObject udo = udd.userDetail(u);
       
        if(udo==null)
        {
         out.println("user not found register first ");  
        }
        else
        {
        %>

 <body class="bg-gray-100 font-roboto">
  <div class="container mx-auto p-4">
   <div class="max-w-2xl mx-auto bg-white shadow-lg rounded-lg overflow-hidden">
    <div class="bg-gradient-to-r from-blue-400 to-cyan-400 p-6">
     <div class="flex items-center space-x-4">
      <img alt="Profile picture of the user" class="w-24 h-24 rounded-full border-4 border-white" height="100" src="" width="100"/>
      <div>
       <h2 class="text-3xl text-white font-bold">
         <%=udo.getUsername()%>
       </h2>
       <p class="text-gray-200">
        <%=udo.getEmail()%>
       </p>
      </div>
     </div>
    </div>
    <div class="p-6">
     <div class="mb-4">
      <h4 class="text-lg font-semibold text-gray-700">
       User ID
      </h4>
      <p class="text-gray-600">
       <%=udo.getUser_id()%>
      </p>
     </div>
     <div class="mb-4">
      <h4 class="text-lg font-semibold text-gray-700">
       Username
      </h4>
      <p class="text-gray-600">
       <%=udo.getUsername()%>
      </p>
     </div>
     <div class="mb-4">
      <h4 class="text-lg font-semibold text-gray-700">
       First Name
      </h4>
      <p class="text-gray-600">
       <%=udo.getFirst_name()%>
      </p>
     </div>
     <div class="mb-4">
      <h4 class="text-lg font-semibold text-gray-700">
       Last Name
      </h4>
      <p class="text-gray-600">
       <%=udo.getLast_name()%>
      </p>
     </div>
     <div class="mb-4">
      <h4 class="text-lg font-semibold text-gray-700">
       Contact
      </h4>
      <p class="text-gray-600">
        <%=udo.getContact()%>
      </p>
     </div>
     <div class="mb-4">
      <h4 class="text-lg font-semibold text-gray-700">
       Address
      </h4>
      <p class="text-gray-600">
        <%=udo.getAddress()%>
      </p>
     </div>
        <%
      }   
    %>  
     <div class="flex justify-end mb-6">
         <form action="updatedetail.jsp" method="post">
         <input type="hidden" value="<%=udo.getUsername()%>" name="username"> 
         <button type="submit" class="link-button">Update profile</button>
         </form>
     </div>
     <div class="flex justify-end mb-6">
         <form action="updatepassword.jsp" method="post">
             <input type="hidden" value="<%=udo.getUsername()%>" name="username" >
             <button type="submit" class="link-button">Update password</button>
     </div>
     <div class="bg-gradient-to-r from-blue-400 to-cyan-400 p-6 rounded-lg">
      <h2 class="text-2xl text-white font-bold mb-4">
       User Options
      </h2>
      <div class="mb-4">
       <a class="block bg-blue-400 text-white px-4 py-2 rounded hover:bg-blue-500 text-center" href="#">
        List a Product
       </a>
      </div>
      <div class="mb-4">
       <a class="block bg-cyan-400 text-white px-4 py-2 rounded hover:bg-cyan-500 text-center" href="#">
        Your Orders
       </a>
      </div>
      <div class="mb-4">
       <a class="block bg-blue-400 text-white px-4 py-2 rounded hover:bg-blue-500 text-center" href="#">
        Stored Products
       </a>
      </div>
     </div>
    </div>
   </div>
  </div>
 </body>
</html>                  