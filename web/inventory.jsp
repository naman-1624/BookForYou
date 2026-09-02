<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Stored Items</title>
</head>
<body>
    <h1>Stored Item Details</h1>

    <%
        String itemName = request.getParameter("itemName");
        String itemQuantity = request.getParameter("itemQuantity");
        String itemDescription = request.getParameter("itemDescription");

        // Display the item details
        out.println("<p>Item Name: " + itemName + "</p>");
        out.println("<p>Quantity: " + itemQuantity + "</p>");
        out.println("<p>Description: " + itemDescription + "</p>");

        // Here you can add logic to store the item details in a database or session
    %>

    <a href="inventory.jsp">Go Back to Inventory</a>
</body>
</html>