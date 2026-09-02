<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sell Your Product</title>
    <style>
        
        .sell-form-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group textarea,
        .form-group input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 1em;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 100px;
        }

        .form-group input[type="file"] {
            padding-top: 5px;
        }

        .submit-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        .submit-button:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            margin-top: 5px;
            font-size: 0.9em;
        }
    </style>
</head>
<body style="font-family: sans-serif; line-height: 1.6; background-color: white; margin: 0; padding: 0;">
    <div class="sell-form-container">
        <h1>List a Product for Sale</h1>
        <form action="Seller" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="add">
            <div class="form-group">
                <label for="name">Product Name:</label>
                <input type="text" id="name" name="name" required>
                <%-- You can add error messages here if needed --%>
            </div>

            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="5" required></textarea>
            </div>

            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" min="0.01" step="0.01" required>
            </div>
             <div class="form-group">
                <label for="category">category:</label>
                <select id="category" name="category" reqiured>
                    <option value="">select a category</option>
                    <option value="electronics">Electronics</option>
                    <option value="clothing"> Clothing</option>
                    <option value="furniture"> Furniture</option>
                    <option value="books"> Books</option>
                    <option value="others"> Others</option>
                </select>
            </div>
            <div class="form-group">
                <label for="condition">condition:</label>
                <select id="category" name="condition" reqiured>
                    <option value="">select a condition</option>
                    <option value="newly">newly</option>
                    <option value="good"> good</option>
                    <option value="bad"> bad</option>
                    <option value="damage">damage</option>
                </select>
            </div>
            <div class="form-group">
                <label for="image">Product Image:</label>
                <input type="file" id="image" name="image">
                <small>Optional: Upload an image to showcase your product.</small>
            </div>
            <%
                String username = (String)session.getAttribute("username");
                if(username==null)
                {
                    response.sendRedirect("login.html");
                }
                
                %>
            <input type="hidden" name="user" value="<%=username%>">
            

            <%-- Add more fields as needed, e.g., category --%>

            <button type="submit" class="submit-button">List Product</button>
        </form>
    </div>
</body>
</html>