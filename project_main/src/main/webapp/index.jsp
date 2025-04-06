<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royal Enfield | Official Showroom</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
            background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.85)),
                        url('https://images.unsplash.com/photo-1558981806-ec527fa84c39?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        .navbar {
            background-color: rgba(18, 18, 18, 0.95) !important;
            border-bottom: 1px solid var(--gold);
            padding: 15px 0;
            transition: all 0.4s;
        }

        .navbar.scrolled {
            padding: 10px 0;
            background-color: rgba(18, 18, 18, 0.98) !important;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        .navbar-brand img {
            height: 40px;
            transition: all 0.3s;
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

        .welcome-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 2rem;
            position: relative;
            z-index: 1;
        }

        .welcome-text {
            font-family: 'Playfair Display', serif;
            color: var(--gold);
            font-size: 5.5rem;
            font-weight: 700;
            letter-spacing: 4px;
            text-shadow: 3px 3px 10px rgba(0, 0, 0, 0.7);
            margin-bottom: 1.5rem;
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 1s 0.3s forwards;
        }

        .subtitle {
            font-size: 1.4rem;
            max-width: 700px;
            margin-bottom: 3rem;
            line-height: 1.6;
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 1s 0.6s forwards;
        }

        .btn-gold {
            background-color: var(--gold);
            color: var(--black);
            font-weight: 700;
            padding: 12px 32px;
            border-radius: 0;
            border: 2px solid var(--gold);
            letter-spacing: 1px;
            text-transform: uppercase;
            font-size: 0.9rem;
            transition: all 0.4s;
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 1s 0.9s forwards;
        }

        .btn-gold:hover {
            background-color: transparent;
            color: var(--gold);
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }

        .btn-outline-light {
            border: 2px solid white;
            padding: 12px 32px;
            border-radius: 0;
            letter-spacing: 1px;
            text-transform: uppercase;
            font-size: 0.9rem;
            margin-left: 15px;
            transition: all 0.4s;
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 1s 1.1s forwards;
        }

        .btn-outline-light:hover {
            background-color: white;
            color: var(--black);
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }

        footer {
            background-color: var(--black);
            color: white;
            border-top: 1px solid var(--gold);
            position: relative;
        }

        .footer-content {
            position: relative;
            z-index: 1;
        }

        .footer-logo {
            height: 50px;
            margin-bottom: 1.5rem;
            filter: brightness(0) invert(1);
        }

        .footer-links {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 2rem;
        }

        .footer-links a {
            color: #aaa;
            text-decoration: none;
            margin: 0 15px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            position: relative;
        }

        .footer-links a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 1px;
            bottom: -3px;
            left: 0;
            background-color: var(--gold);
            transition: width 0.3s;
        }

        .footer-links a:hover {
            color: var(--gold);
        }

        .footer-links a:hover::after {
            width: 100%;
        }

        .social-icons {
            margin-bottom: 2rem;
        }

        .social-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 50%;
            margin: 0 8px;
            transition: all 0.3s;
        }

        .social-icons a:hover {
            background-color: var(--gold);
            color: var(--black);
            transform: translateY(-5px);
        }

        .copyright {
            color: #777;
            font-size: 0.9rem;
            margin-top: 2rem;
        }

        .motorcycle-overlay {
            position: absolute;
            bottom: 0;
            right: 0;
            width: 20%;
            max-width: 600px;
            opacity: 0.2;
            z-index: 0;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-20px);
            }
        }

        @media (max-width: 768px) {
            .welcome-text {
                font-size: 3.5rem;
            }

            .subtitle {
                font-size: 1.1rem;
                padding: 0 20px;
            }

            .btn-gold,
            .btn-outline-light {
                padding: 10px 20px;
                font-size: 0.8rem;
                margin-left: 0;
                margin-top: 10px;
            }

            .motorcycle-overlay {
                width: 80%;
            }

            .footer-links a {
                margin: 5px 10px;
            }
        }
        .navlogo{
            height: 50px;
            margin-bottom: 1.5rem;
            filter: brightness(0) invert(1);

        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Logo" style="height: 50px; " width="150px; class="navlogo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Models</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Accessories</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="userRegister.jsp">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ownerLogin.jsp">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="welcome-container">
        <h1 class="welcome-text">Royal Enfield</h1>
        <p class="subtitle">Built like a gun. Goes like a bullet. Since 1901, we've crafted motorcycles that embody pure riding pleasure, where every journey becomes a story worth telling.</p>
        <div class="d-flex flex-wrap justify-content-center">
            <button class="btn btn-gold">Explore Models</button>
            <button class="btn btn-outline-light">Book a Test Ride</button>
        </div>
        <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Motorcycle" class="motorcycle-overlay">
    </div>

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
            <p class="copyright">© 2025 Royal Enfield. All Rights Reserved. | Made with <i class="fas fa-heart" style="color: #d4af37;"></i> for Motorcycle Enthusiasts</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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

        // Initialize animations after page load
        document.addEventListener('DOMContentLoaded', function() {
            // Smooth scroll for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });
        });
    </script>
</body>
</html>