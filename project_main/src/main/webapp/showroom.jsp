<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royal Enfield | Our Showrooms</title>
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
        .showrooms-hero {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
                        url('https://images.unsplash.com/photo-1591637333184-19aa84b3e01f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            padding: 150px 0 100px;
            text-align: center;
            color: white;
            margin-top: 70px;
        }

        .showrooms-hero h1 {
            font-family: 'Playfair Display', serif;
            color: var(--gold);
            font-size: 4rem;
            margin-bottom: 1rem;
        }

        /* Showroom Cards */
        .showrooms-container {
            padding: 80px 0;
            background-color: white;
        }

        .showroom-card {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 30px;
            transition: all 0.3s ease;
            border: 1px solid #ddd;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .showroom-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            border-color: var(--gold);
        }

        .showroom-img-container {
            height: 300px;
            overflow: hidden;
        }

        .showroom-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .showroom-card:hover .showroom-img {
            transform: scale(1.05);
        }

        .showroom-info {
            padding: 25px;
        }

        .showroom-title {
            font-family: 'Playfair Display', serif;
            color: var(--black);
            font-size: 1.8rem;
            margin-bottom: 10px;
        }

        .showroom-location {
            font-size: 1.1rem;
            color: #666;
            margin-bottom: 15px;
        }

        .showroom-contact {
            margin-bottom: 15px;
        }

        .showroom-contact p {
            margin-bottom: 5px;
        }

        .showroom-btn {
            background-color: var(--gold);
            color: white;
            border: none;
            padding: 10px 25px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
        }

        .showroom-btn:hover {
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
            .showrooms-hero {
                padding: 120px 0 60px;
                margin-top: 60px;
            }

            .showrooms-hero h1 {
                font-size: 2.5rem;
            }

            .showroom-img-container {
                height: 200px;
            }

            .nav-link {
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
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
                        <a class="nav-link" href="bikes.jsp">Models</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Accessories</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="showrooms.jsp">Showrooms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ownerLogin.jsp">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Showrooms Hero Section -->
    <section class="showrooms-hero">
        <div class="container">
            <h1>Our Showrooms</h1>
            <p>Visit us to experience the Royal Enfield legacy in person</p>
        </div>
    </section>

    <!-- Showrooms Listing - Single Column Layout -->
    <section class="showrooms-container">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto"> <!-- Centered column with max width -->
                    <!-- This for loop will iterate through the showroomsList from your database -->
                    <c:forEach items="${showroomsList}" var="showroom">
                        <div class="showroom-card">
                            <div class="row g-0">
                                <div class="col-md-5">
                                    <div class="showroom-img-container">
                                        <img src="getpicofbranch?imges=${showroom.profile}" alt="${showroom.name}" class="showroom-img">
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="showroom-info">
                                        <h3 class="showroom-title">${showroom.name}</h3>
                                        <div class="showroom-location">
                                            <i class="fas fa-map-marker-alt"></i> ${showroom.location}
                                        </div>
                                        <div class="showroom-contact">
                                            <p><i class="fas fa-phone"></i> ${showroom.number}</p>
                                            <p><i class="fas fa-envelope"></i> ${showroom.email}</p>
                                        </div>
                                        <a href="https://maps.google.com/?q=${showroom.location}" target="_blank" class="btn showroom-btn">
                                            <i class="fas fa-directions"></i> Get Directions
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
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