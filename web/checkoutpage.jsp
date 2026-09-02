<%-- 
    Document   : checkoutpage
    Created on : 12 Apr, 2025, 11:55:53 AM
    Author     : naman
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.StoreData"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></link>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
        .header {
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.5rem 1rem;
        }
        .header h1 {
            font-size: 1.875rem;
            font-weight: 700;
        }
        .header nav ul {
            display: flex;
            gap: 1rem;
        }
        .header nav ul li a {
            color: #4a5568;
            transition: color 0.3s;
        }
        .header nav ul li a:hover {
            color: #2d3748;
        }
        .main {
            padding: 1.5rem 1rem;
        }
        .section {
            margin-bottom: 2rem;
        }
        .section h2 {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }
        .table {
            width: 100%;
            background-color: #ffffff;
            padding: 1rem;
            border-radius: 0.5rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            padding: 0.5rem;
        }
        .table th {
            text-align: left;
        }
        .form {
            background-color: #ffffff;
            padding: 1rem;
            border-radius: 0.5rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .form .form-group {
            margin-bottom: 1rem;
        }
        .form .form-group label {
            display: block;
            color: #4a5568;
            margin-bottom: 0.5rem;
        }
        .form .form-group input {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #e2e8f0;
            border-radius: 0.25rem;
        }
        .form .form-group input:focus {
            outline: none;
            border-color: #63b3ed;
            box-shadow: 0 0 0 3px rgba(99, 179, 237, 0.5);
        }
        .form button {
            background-color: #4299e1;
            color: #ffffff;
            padding: 0.5rem 1rem;
            border-radius: 0.25rem;
            transition: background-color 0.3s;
        }
        .form button:hover {
            background-color: #3182ce;
        }
        .footer {
            background-color: #ffffff;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
            padding: 1.5rem 1rem;
            text-align: center;
        }
        .footer p {
            color: #4a5568;
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-900">
    <header class="header">
        <div class="container mx-auto">
            <h1>Checkout Page</h1>
            <nav>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="warehouse.jsp">Warehouse</a></li>
                    <li><a href="storageadd.jsp">Add products</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <main class="main container mx-auto">
        <section class="section">
            <h2>Your Cart</h2>
            <div class="table">
                <table class="min-w-full">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Description</th>
                            <th>Quantity</th>
                            <th>Duration</th>
                            <th>Storage Type</th>
                            <th>Total</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Example data, replace with actual data from your backend
                           String [] productName = request.getParameterValues("productName[]");
                           String [] productDescription = request.getParameterValues("productDescription[]");
                           String [] quantity = request.getParameterValues("quantity[]");
                           String [] storageType = request.getParameterValues("storageType[]");
                           String [] storageDuration = request.getParameterValues("storageDuration[]");
                           System.out.println("   vjvj"+productName[0]);
                           System.out.println(productName[1]);
                           System.out.println(storageType[0]);
                            System.out.println(storageType[1]);
                           if(productName != null && productDescription != null && quantity != null &&storageDuration != null && storageType != null)
                           {
                               ArrayList<StoreData> a1 = new ArrayList<>(); 
                               for(int i = 0;i<productName.length;i++)
                               {
                                   StoreData sd = new StoreData();
                                   sd.setProductName(productName[i]);
                                   sd.setProductDescription(productDescription[i]);
                                   sd.setQuantity(quantity[i]);
                                   sd.setStorageDuration(storageDuration[i]);
                                   sd.setStorageType(storageType[i]);
                                   a1.add(sd);
                               }
                           }
                           
                             ArrayList<Integer> l1= new ArrayList<>();
                             int value = 0;
                             for(int k=0;k<storageType.length;k++)
                             {
                                 if("short-term".equals(storageType[k]))
                                 {
                                    if(Integer.parseInt(storageDuration[k])<= 3)
                                    {   value = Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*100;
                                    l1.add(value);}
                                    else if((Integer.parseInt(storageDuration[k])> 3 || (Integer.parseInt(storageDuration[k])<= 6))){
                                        value= Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*90;
                                     l1.add(value);}
                                    else if((Integer.parseInt(storageDuration[k])> 6 || (Integer.parseInt(storageDuration[k])<= 12))){
                                         value= Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*80;
                                     l1.add(value);}
                                    else
                                    {
                                         value= Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*70;
                                          l1.add(value);
                                    }
                                 }
                                 else if("long-term".equals(storageType[k]))
                                 {
                                     if(Integer.parseInt(storageDuration[k])<= 3){
                                        value = Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*80;
                                      l1.add(value);}
                                    else if((Integer.parseInt(storageDuration[k])> 3 || (Integer.parseInt(storageDuration[k])<= 6))){
                                       value= Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*70;
                                     l1.add(value);}
                                    else if((Integer.parseInt(storageDuration[k])> 6 || (Integer.parseInt(storageDuration[k])<= 12))){
                                         value= Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*60;
                                          l1.add(value);}
                                    else{
                                         value= Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*50;
                                      l1.add(value);}
                                 }
                                 else
                                 {
                                     if(Integer.parseInt(storageDuration[k])<= 3){
                                       value = Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*120;
                                        l1.add(value);}
                                    else if((Integer.parseInt(storageDuration[k])> 3 || (Integer.parseInt(storageDuration[k])<= 6))){
                                       value= Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*110;
                                        l1.add(value);}
                                    else if((Integer.parseInt(storageDuration[k])> 6 || (Integer.parseInt(storageDuration[k])<= 12)))
                                    {
                                         value= Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*100;
                                          l1.add(value);}
                                    else
                                    {
                                         value= Integer.parseInt(quantity[k])*Integer.parseInt(storageDuration[k])*90;
                                          l1.add(value);}
                                 }
                             }
                             int grandTotal = 0;
                             for(int i=0;i<l1.size();i++)
                             {
                                 grandTotal =  grandTotal + l1.get(i);
                             }
                          
                           for(int i=0;i<productName.length;i++)
                           {
                        %>
                        <tr>
                            <td><%=productName[i]%></td>
                            <td><%=productDescription[i] %></td>
                            <td><%=quantity[i] %></td>
                            <td><%=storageDuration[i] %></td>
                            <td><%= storageType[i] %></td>
                            <td><%=l1.get(i) %></td>
                            
                            <td>
                                <a href="storageadd.jsp" class="text-blue-500 hover:text-blue-700 ml-2"><i class="fas fa-edit"></i></a>
                                <form action="deleteFromCart" method="post" class="inline">
                                    <input type="hidden" name="productName" value="<%=productName[i]%>">
                                    <button type="submit" class="text-red-500 hover:text-red-700 ml-2"><i class="fas fa-trash"></i></button>
                                </form>
                            </td>
                        </tr>
                         <% } %>
                       
                    </tbody>
                </table>
                <div class="mt-4 text-right">
                    <h3 class="text-xl font-bold">Grand Total:<%=grandTotal%></h3>
                </div>
            </div>
        </section>
        <section class="section">
            <h2>Delivery Address</h2>
            <form action="submitAddress" method="post" class="form">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" required>
                </div>
                <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city" required>
                </div>
                <div class="form-group">
                    <label for="state">State</label>
                    <input type="text" id="state" name="state" required>
                </div>
                <div class="form-group">
                    <label for="zip">Zip Code</label>
                    <input type="text" id="zip" name="zip" required>
                </div>
                <button type="submit">Submit Address</button>
            </form>
        </section>
        <section class="section">
            <h2>Payment</h2>
            <form action="processPayment" method="post" class="form">
                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-700">Proceed to Payment</button>
            </form>
        </section>
    </main>
    <footer class="footer">
        <div class="container mx-auto">
            <p>© 2023 Checkout Page. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
