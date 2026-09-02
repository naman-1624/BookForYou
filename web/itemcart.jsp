
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>List Your Item</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
</head>
<body class="bg-gray-100 font-roboto flex items-center justify-center min-h-screen">
    <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
        <h2 class="text-3xl font-bold text-center mb-6">List Your Item</h2>
        <form action="submitItem.jsp" method="post" enctype="multipart/form-data" class="space-y-4">
            <div>
                <label for="itemName" class="block text-sm font-medium text-gray-700">Item Name</label>
                <input type="text" id="itemName" name="itemName" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
            </div>
            <div>
                <label for="itemSize" class="block text-sm font-medium text-gray-700">Item Size</label>
                <input type="text" id="itemSize" name="itemSize" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
            </div>
            <div>
                <label for="itemWeight" class="block text-sm font-medium text-gray-700">Item Weight</label>
                <input type="text" id="itemWeight" name="itemWeight" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
            </div>
            <div>
                <label for="purchaseYear" class="block text-sm font-medium text-gray-700">Purchase Year</label>
                <input type="number" id="purchaseYear" name="purchaseYear" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
            </div>
            <div>
                <label for="priceRange" class="block text-sm font-medium text-gray-700">Estimated Price Range</label>
                <input type="text" id="priceRange" name="priceRange" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
            </div>
            <div>
                <label for="facility" class="block text-sm font-medium text-gray-700">Facility</label>
                <select id="facility" name="facility" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
                    <option value="sell">Sell</option>
                    <option value="rent">Rent</option>
                </select>
            </div>
            <div>
                <label for="itemBillPhoto" class="block text-sm font-medium text-gray-700">Item Bill Photo</label>
                <input type="file" id="itemBillPhoto" name="itemBillPhoto" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" accept="image/*" required>
            </div>
            <div>
                <label for="currentPhoto" class="block text-sm font-medium text-gray-700">Current Situation Photo</label>
                <input type="file" id="currentPhoto" name="currentPhoto" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" accept="image/*" required>
            </div>
            <div>
                <label for="contactNumber" class="block text-sm font-medium text-gray-700">Contact Number</label>
                <input type="tel" id="contactNumber" name="contactNumber" class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
            </div>
            <button type="submit" class="w-full bg-blue-500 text-white p-2 rounded-md hover:bg-blue-600">List Item</button>
        </form>
    </div>
</body>
</html>
