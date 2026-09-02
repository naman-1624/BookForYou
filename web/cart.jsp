<%@page import="dao.ProductDetailAccess"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Shopping Cart </title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>
  <style>
    body {
      font-family: 'Inter', sans-serif;
    }
  </style>
</head>
<body class="bg-gray-50 text-gray-800 min-h-screen flex flex-col">

  <!-- Header -->
  <header class="bg-white shadow-md sticky top-0 z-50">
    <div class="container mx-auto px-4 py-4 flex items-center justify-between">
      <a href="#" class="flex items-center text-2xl font-bold text-indigo-600">
        <img src="" alt="Logo" class="w-10 h-10 mr-2 rounded-full"/>
        safe
      </a>
      <nav class="hidden md:flex space-x-6 font-semibold text-gray-700">
        <a href="#" class="hover:text-indigo-600 transition">Home</a>
        <a href="#" class="hover:text-indigo-600 transition">Shop</a>
        <a href="#" class="hover:text-indigo-600 transition">About</a>
        <a href="#" class="hover:text-indigo-600 transition">Contact</a>
        <a href="#" class="relative hover:text-indigo-600 transition">
          <i class="fas fa-shopping-cart text-xl"></i>
          <span class="absolute -top-2 -right-3 bg-red-600 text-white text-xs w-5 h-5 rounded-full flex items-center justify-center">3</span>
        </a>
      </nav>
      <!-- Mobile menu button -->
      <button id="mobile-menu-button" class="md:hidden text-gray-700 focus:outline-none">
        <i class="fas fa-bars text-2xl"></i>
      </button>
    </div>
    <!-- Mobile Menu -->
    <nav id="mobile-menu" class="hidden md:hidden bg-white border-t border-gray-200">
      <a href="#" class="block px-4 py-3 hover:bg-indigo-50">Home</a>
      <a href="#" class="block px-4 py-3 hover:bg-indigo-50">Shop</a>
      <a href="#" class="block px-4 py-3 hover:bg-indigo-50">About</a>
      <a href="#" class="block px-4 py-3 hover:bg-indigo-50">Contact</a>
      <a href="#" class="block px-4 py-3 hover:bg-indigo-50 flex items-center">
        <i class="fas fa-shopping-cart text-lg mr-2"></i> Cart
        <span class="ml-auto bg-red-600 text-white text-xs w-5 h-5 rounded-full flex items-center justify-center">3</span>
      </a>
    </nav>
  </header>

  <!-- Main content -->
  <main class="flex-grow container mx-auto px-4 py-10">
    <h1 class="text-3xl font-bold text-center text-gray-900 mb-10">🛒 Your Shopping Cart</h1>

    <!-- Cart -->
    <%
        Cart cart = (Cart)session.getAttribute("cart");
        if(cart == null || cart.getTotalItems() == 0){
    %>
    <h1>Your Cart is empty.</h1>
    <%}
else
{
       ProductDetailAccess pda = new ProductDetailAccess();
       pda.cartProducts(cart);
       
}
    %>
    
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
      <!-- Items List -->
      <div class="lg:col-span-2 bg-white shadow rounded-lg p-6 space-y-6">

        <!-- Cart Item -->
        <div class="flex flex-col md:flex-row items-center md:space-x-6 border-b pb-4">
          <img src="" class="w-24 h-24 rounded object-cover" alt=""/>
          <div class="flex-1 w-full mt-4 md:mt-0">
            <div class="flex justify-between">
              <div>
                <p class="text-lg font-semibold"></p>
                <p class="text-sm text-gray-500"></p>
              </div>
              <p class="text-indigo-600 font-semibold"></p>
            </div>
            <div class="mt-3 flex justify-between items-center">
              <div class="flex items-center border rounded overflow-hidden">
                <button class="px-3 py-1 bg-indigo-100 hover:bg-indigo-200"><i class="fas fa-minus"></i></button>
                <input type="number" value="2" class="w-12 text-center outline-none" min="1" />
                <button class="px-3 py-1 bg-indigo-100 hover:bg-indigo-200"><i class="fas fa-plus"></i></button>
              </div>
              <button class="text-red-500 hover:text-red-700"><i class="fas fa-trash-alt text-lg"></i></button>
            </div>
          </div>
        </div>

        <!-- Repeat for other products (Smart Watch, Running Shoes) as needed -->

      </div>

      <!-- Order Summary -->
      <div class="bg-white shadow rounded-lg p-6 sticky top-28 h-fit">
        <h2 class="text-xl font-semibold mb-4 text-gray-900">Order Summary</h2>
        <div class="flex justify-between text-gray-700 mb-2">
          <span>Subtotal</span><span>$589.94</span>
        </div>
        <div class="flex justify-between text-gray-700 mb-2">
          <span>Shipping</span><span>$15.00</span>
        </div>
        <hr class="my-2">
        <div class="flex justify-between text-lg font-bold text-gray-900">
          <span>Total</span><span>$604.94</span>
        </div>
        <button class="mt-6 w-full bg-indigo-600 text-white font-semibold py-3 rounded hover:bg-indigo-700 transition">
          Proceed to Checkout
        </button>
      </div>
    </div>
  </main>

  <!-- Footer -->
  <footer class="bg-white border-t py-6 text-center text-sm text-gray-500">
    © 2024 ShopEase. All rights reserved.
  </footer>

  <script>
    // Mobile menu toggle
    const menuBtn = document.getElementById("mobile-menu-button");
    const mobileMenu = document.getElementById("mobile-menu");
    menuBtn.addEventListener("click", () => {
      mobileMenu.classList.toggle("hidden");
    });
  </script>
</body>
</html>
