<%-- 
    Document   : storageadd
    Created on : 12 Apr, 2025, 12:46:23 AM
    Author     : naman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Products to Storage</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body class="font-roboto bg-gray-100">
    <!-- Navigation Bar -->
    <nav class="bg-gradient-to-r from-blue-400 to-cyan-400 shadow-md">
        <div class="container mx-auto px-4 py-2 flex justify-between items-center">
            <a href="#" class="text-2xl font-bold text-white">WarehouseCo</a>
            <div class="block lg:hidden">
                <button id="nav-toggle" class="text-white focus:outline-none">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
            <ul id="nav-menu" class="hidden lg:flex space-x-4">
                <li><a href="index.jsp" class="text-white hover:text-gray-200">Home</a></li>
                <li><a href="#" class="text-white hover:text-gray-200">Services</a></li>
                <li><a href="#" class="text-white hover:text-gray-200">About Us</a></li>
                <li><a href="#" class="text-white hover:text-gray-200">Contact</a></li>
            </ul>
        </div>
        <div id="nav-dropdown" class="lg:hidden hidden">
            <ul class="bg-gradient-to-r from-blue-400 to-cyan-400 space-y-2 py-2">
                <li><a href="index.jsp" class="block text-white hover:text-gray-200 px-4">Home</a></li>
                <li><a href="#" class="block text-white hover:text-gray-200 px-4">Services</a></li>
                <li><a href="#" class="block text-white hover:text-gray-200 px-4">About Us</a></li>
                <li><a href="#" class="block text-white hover:text-gray-200 px-4">Contact</a></li>
            </ul>
        </div>
    </nav>
    <!-- Add Products Form Section -->
    <section class="bg-white py-12">
        <div class="container mx-auto px-4">
            <h1 class="text-4xl font-bold text-gray-800 mb-4">Add Products to Storage</h1>
            <p class="text-gray-600 mb-6">Please fill out the form below to add your products to our warehouse storage.</p>
            <form action="checkoutpage.jsp" method="post" class="bg-gray-100 p-6 rounded shadow-md" id="productForm">
                <div id="productContainer">
                    <div class="product-item mb-6">
                        <div class="mb-4">
                            <label for="productName" class="block text-gray-700 font-bold mb-2">Product Name</label>
                            <input type="text" id="productName" name="productName[]" class="w-full p-2 border border-gray-300 rounded" required>
                        </div>
                        <div class="mb-4">
                            <label for="productDescription" class="block text-gray-700 font-bold mb-2">Product Description</label>
                            <textarea id="productDescription" name="productDescription[]" class="w-full p-2 border border-gray-300 rounded" required></textarea>
                        </div>
                        <div class="mb-4">
                            <label for="quantity" class="block text-gray-700 font-bold mb-2">Quantity</label>
                            <input type="number" id="quantity" name="quantity[]" class="w-full p-2 border border-gray-300 rounded" required>
                        </div>
                        <div class="mb-4">
                            <label for="storageType" class="block text-gray-700 font-bold mb-2">Storage Type</label>
                            <select id="storageType" name="storageType[]" class="w-full p-2 border border-gray-300 rounded" required>
                                <option value="short-term">Short-Term Storage</option>
                                <option value="long-term">Long-Term Storage</option>
                                <option value="climate-controlled">Climate-Controlled Storage</option>
                            </select>
                        </div>
                        <div class="mb-4">
                            <label for="storageDuration" class="block text-gray-700 font-bold mb-2">Storage Duration (in months)</label>
                            <input type="number" id="storageDuration" name="storageDuration[]" class="w-full p-2 border border-gray-300 rounded" required>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <button type="button" class="bg-gradient-to-r from-blue-400 to-cyan-400 text-white px-4 py-2 rounded mb-4" id="addProductButton">Add Another Product</button>
                    <button type="submit" class="bg-gradient-to-r from-blue-400 to-cyan-400 text-white px-4 py-2 rounded">Submit</button>
                </div>
            </form>
        </div>
    </section>
    <!-- Footer -->
    <footer class="bg-white py-12">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                <!-- About Us -->
                <div>
                    <h3 class="text-xl font-bold text-gray-800 mb-4">About Us</h3>
                    <p class="text-gray-600">WarehouseCo is dedicated to providing reliable and efficient warehousing solutions to businesses of all sizes.</p>
                </div>
                <!-- Quick Links -->
                <div>
                    <h3 class="text-xl font-bold text-gray-800 mb-4">Quick Links</h3>
                    <ul class="text-gray-600">
                        <li class="mb-2"><a href="#" class="hover:text-gray-800">Home</a></li>
                        <li class="mb-2"><a href="#" class="hover:text-gray-800">Services</a></li>
                        <li class="mb-2"><a href="#" class="hover:text-gray-800">About Us</a></li>
                        <li class="mb-2"><a href="#" class="hover:text-gray-800">Contact</a></li>
                    </ul>
                </div>
                <!-- Contact Us -->
                <div>
                    <h3 class="text-xl font-bold text-gray-800 mb-4">Contact Us</h3>
                    <p class="text-gray-600 mb-2"><i class="fas fa-map-marker-alt mr-2"></i>123 Warehouse St, City, Country</p>
                    <p class="text-gray-600 mb-2"><i class="fas fa-phone-alt mr-2"></i>+123 456 7890</p>
                    <p class="text-gray-600"><i class="fas fa-envelope mr-2"></i>info@warehouseco.com</p>
                </div>
                <!-- Newsletter -->
                <div>
                    <h3 class="text-xl font-bold text-gray-800 mb-4">Newsletter</h3>
                    <p class="text-gray-600 mb-4">Subscribe to our newsletter to get the latest updates and offers.</p>
                    <form>
                        <input type="email" placeholder="Your email address" class="w-full p-2 mb-2 border border-gray-300 rounded">
                        <button type="submit" class="w-full bg-gradient-to-r from-blue-400 to-cyan-400 text-white p-2 rounded">Subscribe</button>
                    </form>
                </div>
            </div>
            <div class="mt-8 flex justify-between items-center">
                <p class="text-gray-600">© 2023 WarehouseCo. All rights reserved.</p>
                <div class="flex space-x-4">
                    <a href="#" class="text-gray-600 hover:text-gray-800"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-gray-600 hover:text-gray-800"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-gray-600 hover:text-gray-800"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </footer>
    <script>
        document.getElementById('nav-toggle').addEventListener('click', function () {
            var dropdown = document.getElementById('nav-dropdown');
            if (dropdown.classList.contains('hidden')) {
                dropdown.classList.remove('hidden');
            } else {
                dropdown.classList.add('hidden');
            }
        });

        document.getElementById('addProductButton').addEventListener('click', function () {
            var productContainer = document.getElementById('productContainer');
            var newProductItem = document.createElement('div');
            newProductItem.classList.add('product-item', 'mb-6');
            newProductItem.innerHTML = `
                <div class="mb-4">
                    <label for="productName" class="block text-gray-700 font-bold mb-2">Product Name</label>
                    <input type="text" id="productName" name="productName[]" class="w-full p-2 border border-gray-300 rounded" required>
                </div>
                <div class="mb-4">
                    <label for="productDescription" class="block text-gray-700 font-bold mb-2">Product Description</label>
                    <textarea id="productDescription" name="productDescription[]" class="w-full p-2 border border-gray-300 rounded" required></textarea>
                </div>
                <div class="mb-4">
                    <label for="quantity" class="block text-gray-700 font-bold mb-2">Quantity</label>
                    <input type="number" id="quantity" name="quantity[]" class="w-full p-2 border border-gray-300 rounded" required>
                </div>
                <div class="mb-4">
                    <label for="storageType" class="block text-gray-700 font-bold mb-2">Storage Type</label>
                    <select id="storageType" name="storageType[]" class="w-full p-2 border border-gray-300 rounded" required>
                        <option value="short-term">Short-Term Storage</option>
                        <option value="long-term">Long-Term Storage</option>
                        <option value="climate-controlled">Climate-Controlled Storage</option>
                    </select>
                </div>
                <div class="mb-4">
                    <label for="storageDuration" class="block text-gray-700 font-bold mb-2">Storage Duration (in months)</label>
                    <input type="number" id="storageDuration" name="storageDuration[]" class="w-full p-2 border border-gray-300 rounded" required>
                </div>
            `;
            productContainer.appendChild(newProductItem);
        });
    </script>
</body>
</html>