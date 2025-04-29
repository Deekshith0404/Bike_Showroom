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

        /* Navbar Styles */
        .navbar {
            background-color: var(--black) !important;
            border-bottom: 1px solid var(--gold);
            padding: 15px 0;
            transition: all 0.3s;
        }

        .navbar.scrolled {
            padding: 10px 0;
        }

        .nav-link {
            color: white !important;
            font-weight: 600;
            margin: 0 10px;
            position: relative;
            padding: 8px 0 !important;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: var(--gold);
            transition: width 0.3s;
        }

        .nav-link:hover::after,
        .nav-link.active::after {
            width: 100%;
        }

        /* Hero Section */
        .bikes-hero {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
                        url('https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
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

        /* Bike Cards */
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
            height: 100%; /* Ensure consistent card height */
            display: flex;
            flex-direction: column;
        }

        .bike-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            border-color: var(--gold);
        }

        .bike-img-container {
            height: 250px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .bike-img {

            object-fit: contain; /* Changed from cover to contain to fit entire image */
            transition: transform 0.3s ease;
        }

        .bike-card:hover .bike-img {
            transform: scale(1.05);
        }

        .bike-info {
            padding: 25px;
            flex-grow: 1; /* Make info section fill remaining space */
            display: flex;
            flex-direction: column;
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
            margin-top: auto; /* Push button to bottom */
        }

        .bike-btn:hover {
            background-color: var(--gold-dark);
            color: white;
        }

        /* Footer Styles */
        footer {
            background-color: var(--black);
            color: white;
            border-top: 1px solid var(--gold);
            padding: 20px 0;
            margin-top: 50px;
        }

        .footer-links a {
            color: white;
            margin: 0 10px;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: var(--gold);
        }

        .social-icons a {
            color: white;
            margin: 0 10px;
            font-size: 1.2rem;
            transition: color 0.3s;
        }

        .social-icons a:hover {
            color: var(--gold);
        }

        .copyright {
            margin-top: 20px;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .bikes-hero {
                padding: 120px 0 60px;
                margin-top: 60px;
            }

            .bikes-hero h1 {
                font-size: 2.5rem;
            }

            .bike-img-container {
                height: 200px;
            }

            .nav-link {
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>
    <!-- Updated Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Logo" style="height: 60px;">
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
                            <div class="bike-img-container">
                                <img src="getpic?imges=${bike.frontview}" alt="${bike.model}" class="bike-img" >
                            </div>
                            <div class="bike-info">
                                <h3 class="bike-title">${bike.model}</h3>
                                <!-- Bike Details from database -->
                                <p><strong>Engine:</strong> ${bike.cc} cc</p>
                                <p><strong>Mileage:</strong> ${bike.milage} kmpl</p>
                                <p><strong>Colors:</strong> ${bike.color}</p>
                                <div class="bike-price">Rs: ${bike.price}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- Updated Footer -->
    <footer>
        <div class="container text-center">
            <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Logo" class="mb-3" style="height: 60px;">
            <div class="footer-links mb-3">
                <a href="#">About Us</a>
                <a href="#">Our Heritage</a>
                <a href="#">Showrooms</a>
                <a href="#">Services</a>
                <a href="#">Careers</a>
                <a href="#">Contact</a>
            </div>
            <div class="social-icons mb-3">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <p class="copyright mb-0">© 2025 Royal Enfield. All Rights Reserved. | Made with <i class="fas fa-heart" style="color: var(--gold);"></i> for Motorcycle Enthusiasts</p>
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