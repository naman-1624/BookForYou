<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDetail"%>
<%@page import="dao.ProductDetailAccess"%>
<%@page import="dto.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

     <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="font-sans bg-gray-100">
    <header class="bg-white shadow-md">
        <nav class="container mx-auto flex justify-between items-center py-4 px-6 stick">
            <div class="text-2xl font-bold text-gray-800">
                <h1>PRODUCT</h1>
            </div>
            <ul class="hidden md:flex space-x-6 text-gray-600">
                <li><a href="index.html" class="hover:text-gray-800">Home</a></li>
                <li><a href="find-matches.html" class="hover:text-gray-800">Sell products</a></li>
                <li><a href="coach-contact.html" class="hover:text-gray-800">Store products</a></li>
                <li class="relative group">
                        <img src="images/user.png" alt="User" class="w-6 h-6 rounded-full mr-2 " onclick="toggleMenu()">
                        <i class="fas fa-caret-down"></i>
                    </a>
                    <div class="absolute hidden group-hover:block bg-white shadow-md rounded-md mt-2 w-40">
                        <a href="profile.jsp" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">My profile</a>
                        <a href="#" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">Edit details</a>
                        <a href="logout.jsp" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">Logout</a>
                    </div>
                </li>
                <li><a href="login.html" class="bg-blue-600 text-white px-4 py-2 rounded-full hover:bg-blue-700">Login</a></li>
            </ul>
            <div class="md:hidden flex items-center">
                <button class="text-gray-600 focus:outline-none" id="mobile-menu-button">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
        </nav>
        <div class="md:hidden" id="mobile-menu">
            <ul class="flex flex-col space-y-4 text-gray-600 px-6 py-4">
                <li><a href="index.html" class="hover:text-gray-800">Home</a></li>
                <li><a href="find-matches.html" class="hover:text-gray-800">Sell products</a></li>
                <li><a href="coach-contact.html" class="hover:text-gray-800">Store products</a></li>
                <li class="relative group">
                    <a href="profile.jsp" class="flex items-center hover:text-gray-800">
                        <img src="images/user.png" alt="User" class="w-6 h-6 rounded-full mr-2">
                        <i class="fas fa-caret-down"></i>
                    </a>
                    <div class="absolute hidden group-hover:block bg-white shadow-md rounded-md mt-2 w-40">
                        <a href="profile.jsp" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">My profile</a>
                        <a href="#" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">Edit details</a>
                        <a href="logout.jsp" class="block px-4 py-2 text-gray-600 hover:bg-gray-100">Logout</a>
                    </div>
                </li>
                <li><a href="login.html" class="bg-blue-600 text-white px-4 py-2 rounded-full hover:bg-blue-700">Login</a></li>
            </ul>
        </div>
    </header>

    <main class="container mx-auto py-8 px-4">
        <section class="flex flex-col md:flex-row gap-8">
            <div class="bg-white p-6 rounded-lg shadow-md w-full md:w-1/4">
                <h3 class="text-xl font-semibold mb-4">Filters</h3>
                <form id="filter-form" action="Seller" method="post">
                    <input type="hidden" name="action" value="filter">
                    <div class="mb-4">
                        <label for="category" class="block text-gray-700 font-medium mb-2">Category</label>
                        <select id="category" name="category" class="w-full p-2 border border-gray-300 rounded-md">
                            <option value="">All Categories</option>
                            <option value="electronics">electronics</option>
                            <option value="clothing">clothing</option>
                            <option value="furniture">furniture</option>
                            <option value="books">books</option>
                            <option value="others">others</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="price-range" class="block text-gray-700 font-medium mb-2">Price Range</label>
                        <div class="flex gap-2">
                            <input type="number" id="min-price" name="min-price" placeholder="Min" class="w-1/2 p-2 border border-gray-300 rounded-md">
                            <span class="self-center">to</span>
                            <input type="number" id="max-price" name="max-price" placeholder="Max" class="w-1/2 p-2 border border-gray-300 rounded-md">
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="price" class="block text-gray-700 font-medium mb-2">Condition</label>
                        <select id="price" name="condition" class="w-full p-2 border border-gray-300 rounded-md">
                            <option value="">condition</option>
                            <option value="newly">newly</option>
                            <option value="good">good</option>
                            <option value="bad">bad</option>
                            <option value="damage">damage</option>
                        </select>
                    </div>
                    <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700">Apply Filters</button>
                </form>
            </div>

            <div class="flex-1">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-semibold">Sports Products</h2>
                    <div class="flex items-center gap-2">
                        <label for="sort-by" class="text-gray-700">Sort by:</label>
                        <select id="sort-by" name="sort-by" class="p-2 border border-gray-300 rounded-md">
                            <option value="price-asc">Price: Low to High</option>
                            <option value="price-desc">Price: High to Low</option>
                            <option value="name-asc">Name: A to Z</option>
                            <option value="name-desc">Name: Z to A</option>
                        </select>
                    </div>
                </div>
                <%
          ProductDetailAccess pda = new ProductDetailAccess();
          ArrayList<ProductDetail> a1 = pda.allproductdetails();
          Iterator<ProductDetail> i = a1.iterator();%>
        <%  while(i.hasNext())
          {
              ProductDetail pd = i.next();
        %>

                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                    <%=pd.getProduct_name()%>
                        <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300">
                            <div class="h-48 overflow-hidden">
                                <img src="#" alt="<%=pd.getProduct_name()%>" class="w-full h-full object-cover">
                            </div>
                            <div class="p-4">
                                <h3 class="text-lg font-semibold text-gray-800"><%=pd.getProduct_name()%></h3>
                                <p class="text-gray-600"><%=pd.getProduct_category()%></p>
                                <p class="text-gray-700 mb-4"><%=pd.getDescription()%></p>
                                <div class="flex justify-between items-center mb-4">
                                    <span class="text-xl font-bold text-gray-800"><%=pd.getProduct_price()%></span>
                                    <span class="bg-green-100 text-green-700 px-2 py-1 rounded-full text-sm"><%=pd.getProduct_name()%></span>
                                </div>
                                <div class="flex gap-2">
                                    <button class="flex-1 bg-gray-200 text-gray-800 py-2 rounded-md hover:bg-gray-300" onclick="">View Details</button>
                                    <form action="AddToCart" method="post">
                                        <input type="hidden" name="product_Id" value="<%= pd.getProduct_id()%>">
                                    <button class="flex-1 bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700" onclick="">Add to Cart</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                </div>
                                <%
             }
       %>

                <div class="mt-8 flex justify-center gap-2">
                    <c:if test="${currentPage > 1}">
                        <a href="?page=${currentPage - 1}" class="px-4 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-200">Previous</a>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="pageNum">
                        <a href="?page=${pageNum}" class="px-4 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-200 ${pageNum == currentPage ? 'bg-gray-300' : ''}">${pageNum}</a>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="?page=${currentPage + 1}" class="px-4 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-200">Next</a>
                    </c:if>
                </div>
            </div>
                    <div>View Cart(<%=(session.getAttribute("cart") == null) ? 0 : ((Cart) session.getAttribute("cart")).getTotalItems()%>) items</div>
        </section>
    </main>
       

    <footer class="bg-gradient-to-r from-blue-800 to-teal-600 text-white py-4">
        <div class="container mx-auto text-center px-4">
            <p>? 2023 Online Marketplace. All rights reserved.</p>
            <div class="flex justify-center space-x-4 mt-2">
                <a href="#" class="hover:text-gray-300"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="hover:text-gray-300"><i class="fab fa-twitter"></i></a>
                <a href="#" class="hover:text-gray-300"><i class="fab fa-instagram"></i></a>
                <a href="#" class="hover:text-gray-300"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </footer>
 
    <script>
        document.getElementById('mobile-menu-button').addEventListener('click', function() {
            var mobileMenu = document.getElementById('mobile-menu');
            if (mobileMenu.classList.contains('hidden')) {
                mobileMenu.classList.remove('hidden');
            } else {
                mobileMenu.classList.add('hidden');
            }
        });
        function toggleMenu() {
            document.getElementById("submenu").style.display = document.getElementById("submenu").style.display === "none" ? "block" : "none";
        }
    </script>
</body>
</html>