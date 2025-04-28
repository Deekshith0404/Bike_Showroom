<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royal Enfield | Our Models</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        :root {
            --gold: #d4af37;
            --gold-dark: #b38f2a;
            --black: #121212;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
            color: var(--black);
            min-height: 100vh;
        }

        .bikes-hero {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
                        url('https://images.unsplash.com/photo-1601758003122-53c40e686a19?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            padding: 150px 0 100px;
            text-align: center;
            color: white;
            margin-top: 70px;
        }

        .bikes-hero h1 {
            font-family: 'Playfair Display', serif;
            color: var(--gold);
            font-size: 4rem;
            margin-bottom: 1rem;
        }

        .bikes-container {
            padding: 80px 0;
            background-color: white;
        }

        .bike-card {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 30px;
            transition: all 0.3s ease;
            border: 1px solid #ddd;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .bike-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            border-color: var(--gold);
        }

        .bike-img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .bike-info {
            padding: 25px;
        }

        .bike-title {
            font-family: 'Playfair Display', serif;
            color: var(--black);
            font-size: 1.8rem;
            margin-bottom: 10px;
        }

        .bike-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--gold);
            margin-bottom: 20px;
        }

        .bike-btn {
            background-color: var(--gold);
            color: white;
            border: none;
            padding: 10px 25px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
            width: 100%;
        }

        .bike-btn:hover {
            background-color: var(--gold-dark);
            color: white;
        }

        @media (max-width: 768px) {
            .bikes-hero {
                padding: 120px 0 60px;
                margin-top: 60px;
            }

            .bikes-hero h1 {
                font-size: 2.5rem;
            }

            .bike-img {
                height: 200px;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Logo" style="height: 50px;" width="150px" class="navlogo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="bikes.jsp">Models</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Accessories</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">location</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ownerLogin.jsp">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Bikes Hero Section -->
    <section class="bikes-hero">
        <div class="container">
            <h1>Our Motorcycles</h1>
            <p>Discover the perfect Royal Enfield for your riding style</p>
        </div>
    </section>

    <!-- Bikes Listing -->
    <section class="bikes-container">
        <div class="container">
            <div class="row">
                <!-- This for loop will iterate through the bikesList from your database -->
                <c:forEach items="${bikesList}" var="bike">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="bike-card">
                            <!-- Bike Image from database -->
                            <img src="${picture}" alt="${bike.model}" class="bike-img">
                            <div class="bike-info">
                                <h3 class="bike-title">${bike.model}</h3>
                                <!-- Bike Details from database -->
                                <p><strong>Engine:</strong> ${bike.cc} cc</p>
                                <p><strong>Mileage:</strong> ${bike.milege} kmpl</p>
                                <p><strong>Colors:</strong> ${bike.color}</p>
                                <div class="bike-price">₹${bike.price}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <footer>
        <div class="container text-center footer-content">
            <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Logo" class="footer-logo">
            <div class="footer-links">
                <a href="#">About Us</a>
                <a href="#">Our Heritage</a>
                <a href="#">Showrooms</a>
                <a href="#">Services</a>
                <a href="#">Careers</a>
                <a href="#">Contact</a>
            </div>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <p class="copyright">© 2025 Royal Enfield. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Navbar scroll effect
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });
    </script>
</body>
</html>