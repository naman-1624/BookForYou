<%-- 
    Document   : index.jsp
    Created on : 26 Feb, 2025, 4:27:13 PM
    Author     : naman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Marketplace</title>
    <link rel="stylesheet" href="styleindex.css">
</head>
<body>
    <header bgcolor="#fff">
        <nav>
            <div class="logo">Your Marketplace</div>
            <ul>
               
                 <%
             String username = (String)session.getAttribute("username");
            if(username == null)
            {
                response.sendRedirect("Login.html");
            }
        %>
                <li><a href="#">Home</a></li>
                <li><a href="#">Products</a></li>
                <li><a href="#">Sell</a></li>
                <li><a href="warehouse.jsp">Warehouse</a></li>
                <li><a href="login.html" alternate="register.html">Login/Register</a></li>       
            </ul>
                <img src="images/user.png" class="user_pic" onclick="toggleMenu()>
                            </nav>
                <div class="submenu-wrap">
                    <div class="sub-menu">
                        <div class="user-info">
                            <img src="images/user.png" alt="user image">
                            <h2><%=username%></h2>
                        </div>
                            <hr>
                            <a href="profile.jsp" class="sub-menu-links" id="submenu">
                                <img src="images/profile.png">
                                <p>profile</p>
                                <span>></span>
                            </a>
                            <a href="updatedetail.jsp" class="sub-menu-links">
                                <img src="images/setting.png">
                                <p>change profile</p>
                                <span>></span>
                            </a>
                            <a href="logout.jsp" class="sub-menu-links">
                                <img src="images/logout.png">
                                <p>logout</p>
                                <span>></span>
                            </a>
                        
                    </div>
                    
                </div>
        
    </header>

    <section class="hero">
        <div class="hero-content">
            <h1>Find and Sell Everything You Need</h1>
            <p>Discover a wide range of products and sell your unwanted items with ease.</p>
            <a href="#" class="cta-button">Browse Products</a>
        </div>
    </section>

    <section class="featured-products">
        <h2>Featured Products</h2>
        <div class="product-grid">
            <div class="product-item">
                <img src="placeholder-product.jpg" alt="Product 1">
                <h3>Product 1</h3>
                <p>$99.99</p>
            </div>
            <div class="product-item">
                <img src="placeholder-product.jpg" alt="Product 2">
                <h3>Product 2</h3>
                <p>$49.99</p>
            </div>
            <div class="product-item">
                <img src="placeholder-product.jpg" alt="Product 3">
                <h3>Product 3</h3>
                <p>$149.99</p>
            </div>
            <div class="product-item">
                <img src="placeholder-product.jpg" alt="Product 4">
                <h3>Product 4</h3>
                <p>$79.99</p>
            </div>
        </div>
    </section>

    <section class="warehouse-section">
        <div class="warehouse-content">
            <h2>Need Storage?</h2>
            <p>Store your items safely in our warehouse until you need them.</p>
            <a href="#" class="cta-button">Learn More</a>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Your Marketplace. All rights reserved.</p>
    </footer>
                            <script>
                                 function toggleMenu() {
            document.getElementById("submenu").style.display = document.getElementById("submenu").style.display === "none" ? "block" : "none";
        }
                                </script>
</body>
</html>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Your Marketplace</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
</head>
<body style="font-family: sans-serif; line-height: 1.6; background-color: white; margin: 0; padding: 0;">
    <header style="background: linear-gradient(to right, blue, teal); color: white; padding: 1rem 0; position: sticky; top: 0; z-index: 50;">
        <nav style="display: flex; justify-content: space-between; align-items: center; max-width: 1200px; margin: 0 auto; padding: 0 1rem;">
            <div style="font-size: 1.5rem; font-weight: bold;">Your Marketplace</div>
            <ul style="list-style: none; display: flex; margin: 0; padding: 0;">
                <li style="margin-left: 1.5rem;"><a href="#" style="color: white; text-decoration: none; transition: color 0.3s ease;">Home</a></li>
                <li style="margin-left: 1.5rem;"><a href="product.jsp" style="color: white; text-decoration: none; transition: color 0.3s ease;">Products</a></li>
                <li style="margin-left: 1.5rem;"><a href="sell.jsp" style="color: white; text-decoration: none; transition: color 0.3s ease;">Sell</a></li>
                <li style="margin-left: 1.5rem;"><a href="warehouse.jsp" style="color: white; text-decoration: none; transition: color 0.3s ease;">Warehouse</a></li>
                <li style="margin-left: 1.5rem;"><a href="login.html" style="color: white; text-decoration: none; transition: color 0.3s ease;">Login/Register</a></li>
            </ul>
            <div style="position: relative;">
                 <%
             String username = (String)session.getAttribute("username");
            if(username == null)
            {
                response.sendRedirect("Login.html");
            }
        %>
        <img alt="User profile picture" src="images/user.png" width="48" height="48" style="width: 3rem; height: 3rem; border-radius: 50%; cursor: pointer;" onclick="toggleMenu()"/>
                <div id="submenu" style="position: absolute; right: 0; margin-top: 0.5rem; width: 12rem; background-color: white; color: black; border-radius: 0.5rem; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15); overflow: hidden; display: none;">
                    <div style="padding: 1rem; display: flex; align-items: center;">
                        <img alt="User profile picture" src="images/user.png.png" width="48" height="48" style="width: 3rem; height: 3rem; border-radius: 50%; margin-right: 0.75rem;"/>
                        <h2 style="font-size: 1.125rem; font-weight: 600;"><%= username %></h2>
                    </div>
                    <hr style="border-color: #e5e7eb; margin: 0.5rem 0;"/>
                    <a href="profile.jsp" style="display: flex; align-items: center; padding: 1rem; text-decoration: none; color: inherit; transition: background-color 0.3s ease;">
                        <img alt="profile icon" src="images/profile.png" width="40" height="40" style="width: 2.5rem; height: 2.5rem; border-radius: 50%; background-color: #e5e7eb; padding: 0.5rem; margin-right: 0.75rem;"/>
                        <p style="margin: 0;">Show profile</p>
                        <span style="margin-left: auto; font-size: 1.25rem;">&gt;</span>
                    </a>
                    <a href="updatedetail.jsp" style="display: flex; align-items: center; padding: 1rem; text-decoration: none; color: inherit; transition: background-color 0.3s ease;">
                        <img alt="Change profile icon" src="images/setting.png" width="40" height="40" style="width: 2.5rem; height: 2.5rem; border-radius: 50%; background-color: #e5e7eb; padding: 0.5rem; margin-right: 0.75rem;"/>
                        <p style="margin: 0;">Change profile</p>
                        <span style="margin-left: auto; font-size: 1.25rem;">&gt;</span>
                    </a>
                    <a href="logout.jsp" style="display: flex; align-items: center; padding: 1rem; text-decoration: none; color: inherit; transition: background-color 0.3s ease;">
                        <img alt="Logout icon" src="images/logout.png" width="40" height="40" style="width: 2.5rem; height: 2.5rem; border-radius: 50%; background-color: #e5e7eb; padding: 0.5rem; margin-right: 0.75rem;"/>
                        <p style="margin: 0;">Logout</p>
                        <span style="margin-left: auto; font-size: 1.25rem;">&gt;</span>
                    </a>
                </div>
            </div>
        </nav>
    </header>
    <section style="background: linear-gradient(to right, blue, teal); color: white; text-align: center; padding: 5rem 0;">
        <div style="max-width: 1200px; margin: 0 auto; padding: 0 1rem;">
            <h1 style="font-size: 3rem; font-weight: bold; margin-bottom: 1rem;">Find and Sell Everything You Need</h1>
            <p style="font-size: 1.25rem; margin-bottom: 2rem;">Discover a wide range of products and sell your unwanted items with ease.</p>
            <a href="product.jsp" style="background-color: #2563eb; color: white; font-weight: bold; padding: 0.75rem 1.5rem; border-radius: 9999px; text-decoration: none; transition: background-color 0.3s ease;">Browse Products</a>
        </div>
    </section>
    <section style="padding: 5rem 0; text-align: center;">
        <div style="max-width: 1200px; margin: 0 auto; padding: 0 1rem;">
            <h2 style="font-size: 1.875rem; font-weight: bold; margin-bottom: 2.5rem;">Featured Products</h2>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 2rem;">
                <div style="background-color: white; border-radius: 0.5rem; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 1.5rem;">
                    <img alt="Image of Product 1" src="https://storage.googleapis.com/a1aa/image/GCe2Ze0YHqtw4QhbgdRJQF4vxrkqRMCfC1wng001ztg.jpg" width="250" height="250" style="width: 100%; height: auto; border-radius: 0.25rem; margin-bottom: 1rem;"/>
                    <h3 style="font-size: 1.25rem; font-weight: 600; margin-bottom: 0.5rem;">Product 1</h3>
                    <p style="color: #4b5563;">$99.99</p>
                </div>
                <div style="background-color: white; border-radius: 0.5rem; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 1.5rem;">
                    <img alt="Image of Product 2" src="https://storage.googleapis.com/a1aa/image/UlPiMrl6XgT7YkICT2CbpwTlkEEFek30C_Ov7b1SNQ4.jpg" width="250" height="250" style="width: 100%; height: auto; border-radius: 0.25rem; margin-bottom: 1rem;"/>
                    <h3 style="font-size: 1.25rem; font-weight: 600; margin-bottom: 0.5rem;">Product 2</h3>
                    <p style="color: #4b5563;">$49.99</p>
                </div>
                <div style="background-color: white; border-radius: 0.5rem; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 1.5rem;">
                    <img alt="Image of Product 3" src="https://storage.googleapis.com/a1aa/image/QeeVj8K2rRfNjNJ3pLRYXqaOsC3re1YZoDUpNeUwbak.jpg" width="250" height="250" style="width: 100%; height: auto; border-radius: 0.25rem; margin-bottom: 1rem;"/>
                    <h3 style="font-size: 1.25rem; font-weight: 600; margin-bottom: 0.5rem;">Product 3</h3>
                    <p style="color: #4b5563;">$149.99</p>
                </div>
                <div style="background-color: white; border-radius: 0.5rem; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 1.5rem;">
                    <img alt="Image of Product 4" src="https://storage.googleapis.com/a1aa/image/nXdQjAfD_voLPEcE_SbFyVvXzzRJI90NUCkf-KmwPws.jpg" width="250" height="250" style="width: 100%; height: auto; border-radius: 0.25rem; margin-bottom: 1rem;"/>
                    <h3 style="font-size: 1.25rem; font-weight: 600; margin-bottom: 0.5rem;">Product 4</h3>
                    <p style="color: #4b5563;">$79.99</p>
                </div>
            </div>
        </div>
    </section>
    <section style="background-color: #e0f2fe; padding: 5rem 0; text-align: center;">
        <div style="max-width: 1200px; margin: 0 auto; padding: 0 1rem;">
            <h2 style="font-size: 1.875rem; font-weight: bold; margin-bottom: 1rem;">Need Storage?</h2>
            <p style="font-size: 1.25rem; margin-bottom: 2rem;">Store your items safely in our warehouse until you need them.</p>
            <a href="#" style="background-color: #2dd4bf; color: white; font-weight: bold; padding: 0.75rem 1.5rem; border-radius: 9999px; text-decoration: none; transition: background-color 0.3s ease;">Learn More</a>
        </div>
    </section>
    <footer style="background: linear-gradient(to right, blue, teal); color: white; text-align: center; padding: 1rem 0;">
        <p>� 2024 Your Marketplace. All rights reserved.</p>
    </footer>
    <script>
        function toggleMenu() {
            document.getElementById("submenu").style.display = document.getElementById("submenu").style.display === "none" ? "block" : "none";
        }
    </script>
</body>
</html>--%>