<%-- 
    Document   : pricingList
    Created on : 26 Feb, 2025, 9:36:13 PM
    Author     : naman
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Warehouse Storage Pricing</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 20px;
            background-image: linear-gradient(135deg, #ABDCFF 10%, #0396FF 100%);
        }

        table {
            column-fill: balance;
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-image: linear-gradient(135deg, #ABDCFF 10%, #0396FF 100%);
        }

        tr {
            background-image: linear-gradient(135deg, #ABDCFF 10%, #0396FF 100%);
        }

        .pricing-section {
          text-align: center;
          margin-bottom: 20px;
        }

        .pricing-section h2 {
          color: #333;
        }

        .pricing-section p {
          color: #666;
        }
        .button {
            background-color: #4facfe; /* Green background */
            color: white; /* White text */
            border: none; /* Remove border */
            padding: 15px 60px; /* Add some padding */
            text-align: center; /* Center text */
            text-decoration: none; /* Remove underline */
            display: inline-block; /* Make it inline-block */
            font-size: 16px; /* Increase font size */
            margin: 20px auto; /* Add some margin */
        }

        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="pricing-section">
        <h2>Warehouse Storage Pricing</h2>
        <p>Choose the storage option that best suits your needs.</p>
    </div>

    <form action="WareHouseStorage" method="post">
        <table>
            <thead>
                <tr>
                    <th>Storage Size</th>
                    <th>Description</th>
                    <th>Price (per month)</th>
                    <th>Capacity (Approx. cm x cm)</th>
                    <th>Select</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Small Box</td>
                    <td>Ideal for small items and documents.</td>
                    <td>$10.00</td>
                    <td>30 x 30</td>
                    <td><input type="checkbox" name="storageOption" value="smallBox"></td>
                </tr>
                <tr>
                    <td>Medium Box</td>
                    <td>Suitable for medium-sized household items.</td>
                    <td>$25.00</td>
                    <td>60 x 60</td>
                    <td><input type="checkbox" name="storageOption" value="mediumBox"></td>
                </tr>
                <tr>
                    <td>Large Box</td>
                    <td>For larger items, such as furniture.</td>
                    <td>$50.00</td>
                    <td>90 x 90</td>
                    <td><input type="checkbox" name="storageOption" value="largeBox"></td>
                </tr>
                <tr>
                    <td>Small Room</td>
                    <td>A small room for storage.</td>
                    <td>$100.00</td>
                    <td>300 x 300</td>
                    <td><input type="checkbox" name="storageOption" value="smallRoom"></td>
                </tr>
                <tr>
                    <td>Large Room</td>
                    <td>A large room for storage.</td>
                    <td>$200.00</td>
                    <td>600 x 600</td>
                    <td><input type="checkbox" name="storageOption" value="largeRoom"></td>
                </tr>
            </tbody>
        </table>

        <button type="submit" class="button">proceed to storage</button>
    </form>
    <h4> <p style="color: red">${message}</p></h4>
</body>
</html>
