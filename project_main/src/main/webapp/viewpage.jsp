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
            --dark-gray: #1e1e1e;
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

        /* Profile Dropdown */
        .profile-dropdown {
            margin-left: 15px;
        }

        .profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid var(--gold);
            cursor: pointer;
            transition: all 0.3s;
        }

        .profile-img:hover {
            border-color: var(--gold-dark);
            transform: scale(1.05);
        }

        .dropdown-menu {
            background-color: var(--dark-gray);
            border: 1px solid var(--gold);
            border-radius: 5px;
        }

        .dropdown-item {
            color: white;
            padding: 8px 15px;
            transition: all 0.3s;
        }

        .dropdown-item:hover {
            background-color: var(--gold);
            color: var(--black);
        }

        .dropdown-divider {
            border-color: rgba(255,255,255,0.1);
        }
        :root {
            --gold: #d4af37;
            --gold-dark: #b38f2a;
            --black: #121212;
            --dark-gray: #1e1e1e;
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
            height: 100%;
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .bike-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            border-color: var(--gold);
        }

        .bike-img-container {
            height: 300px;
            overflow: hidden;
            position: relative;
        }

        .bike-img-slider {
            display: flex;
            transition: transform 0.5s ease;
            height: 100%;
        }

        .bike-img {
            min-width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .bike-card:hover .bike-img-slider {
            animation: slideImages 12s infinite;
        }

        @keyframes slideImages {
            0%, 25% { transform: translateX(0); }
            30%, 55% { transform: translateX(-100%); }
            60%, 85% { transform: translateX(-200%); }
            90%, 100% { transform: translateX(-300%); }
        }

        .bike-img-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
            opacity: 0;
            transition: opacity 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .bike-card:hover .bike-img-overlay {
            opacity: 1;
        }

        .view-gallery-btn {
            background-color: var(--gold);
            color: white;
            border: none;
            padding: 10px 20px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.3s ease;
        }

        .bike-card:hover .view-gallery-btn {
            opacity: 1;
            transform: translateY(0);
        }

        .view-gallery-btn:hover {
            background-color: var(--gold-dark);
        }

        .bike-info {
            padding: 25px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            background-color: white;
        }

        .bike-title {
            font-family: 'Playfair Display', serif;
            color: var(--black);
            font-size: 1.8rem;
            margin-bottom: 10px;
            position: relative;
            display: inline-block;
        }

        .bike-title::after {
            content: '';
            position: absolute;
            width: 50px;
            height: 2px;
            bottom: -5px;
            left: 0;
            background-color: var(--gold);
            transition: width 0.3s;
        }

        .bike-card:hover .bike-title::after {
            width: 100%;
        }

        .bike-specs {
            margin-bottom: 15px;
        }

        .bike-specs p {
            margin-bottom: 8px;
            display: flex;
            align-items: center;
        }

        .bike-specs i {
            color: var(--gold);
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        .bike-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--gold);
            margin: 15px 0;
        }

        .bike-actions {
            display: flex;
            gap: 10px;
            margin-top: auto;
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
            flex: 1;
            text-align: center;
            border-radius: 4px;
        }

        .bike-btn:hover {
            background-color: var(--gold-dark);
            color: white;
            transform: translateY(-2px);
        }

        .bike-btn.secondary {
            background-color: var(--dark-gray);
        }

        .bike-btn.secondary:hover {
            background-color: var(--black);
        }

        /* Footer Styles */
        footer {
            background-color: var(--black);
            color: white;
            border-top: 1px solid var(--gold);
            padding: 50px 0 20px;
            margin-top: 50px;
        }

        .footer-links a {
            color: white;
            margin: 0 10px;
            text-decoration: none;
            transition: color 0.3s;
            position: relative;
        }

        .footer-links a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 1px;
            bottom: -2px;
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

        .social-icons a {
            color: white;
            margin: 0 10px;
            font-size: 1.2rem;
            transition: all 0.3s;
            display: inline-block;
        }

        .social-icons a:hover {
            color: var(--gold);
            transform: translateY(-3px);
        }

        .copyright {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        /* Bike Details Modal */
        .bike-modal .modal-dialog {
            max-width: 900px;
        }

        .bike-modal .modal-content {
            border-radius: 10px;
            overflow: hidden;
            border: 2px solid var(--gold);
        }

        .bike-modal .modal-header {
            background-color: var(--black);
            color: white;
            border-bottom: 1px solid var(--gold);
            padding: 15px 20px;
        }

        .bike-modal .modal-title {
            font-family: 'Playfair Display', serif;
            color: var(--gold);
        }

        .bike-modal .modal-body {
            padding: 0;
            display: flex;
            flex-direction: row;
        }

        .bike-modal .image-container {
            width: 50%;
            position: relative;
            background-color: #f5f5f5;
        }

        .bike-modal .image-slider {
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .bike-modal .modal-image {
            max-width: 100%;
            max-height: 500px;
            object-fit: contain;
            transition: opacity 0.5s ease;
            display: none;
        }

        .bike-modal .modal-image.active {
            display: block;
        }

        .bike-modal .info-container {
            width: 50%;
            padding: 30px;
            background-color: white;
        }

        .bike-modal .nav-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 10;
            transition: all 0.3s;
        }

        .bike-modal .nav-arrow:hover {
            background-color: var(--gold);
        }

        .bike-modal .nav-arrow.left {
            left: 15px;
        }

        .bike-modal .nav-arrow.right {
            right: 15px;
        }

        .bike-modal .specs-list {
            list-style: none;
            padding: 0;
        }

        .bike-modal .specs-list li {
            padding: 10px 0;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
        }

        .bike-modal .specs-list li:last-child {
            border-bottom: none;
        }

        .bike-modal .spec-label {
            font-weight: 600;
            color: var(--black);
        }

        .bike-modal .spec-value {
            color: var(--dark-gray);
        }

        .bike-modal .modal-price {
            font-size: 1.8rem;
            color: var(--gold);
            font-weight: 700;
            margin: 20px 0;
            text-align: center;
        }

        .bike-modal .action-buttons {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .bike-modal .action-btn {
            flex: 1;
            padding: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-radius: 4px;
            transition: all 0.3s;
            text-align: center;
        }

        .bike-modal .action-btn.primary {
            background-color: var(--gold);
            color: white;
            border: none;
        }

        .bike-modal .action-btn.primary:hover {
            background-color: var(--gold-dark);
        }

        .bike-modal .action-btn.secondary {
            background-color: transparent;
            color: var(--black);
            border: 2px solid var(--black);
        }

        .bike-modal .action-btn.secondary:hover {
            background-color: var(--black);
            color: white;
        }

        /* Image dots indicator */
        .image-dots {
            position: absolute;
            bottom: 20px;
            left: 0;
            right: 0;
            display: flex;
            justify-content: center;
            gap: 8px;
            z-index: 10;
        }

        .image-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.5);
            cursor: pointer;
            transition: all 0.3s;
        }

        .image-dot.active {
            background-color: var(--gold);
            transform: scale(1.2);
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
                height: 250px;
            }

            .nav-link {
                margin: 5px 0;
            }

            .bike-actions {
                flex-direction: column;
            }

            .bike-modal .modal-body {
                flex-direction: column;
            }

            .bike-modal .image-container,
            .bike-modal .info-container {
                width: 100%;
            }

            .bike-modal .image-container {
                height: 300px;
            }
            /* Gold Theme for Profile Modal */
            .bg-gold {
                background-color: var(--gold) !important;
            }

            .bg-light-gold {
                background-color: rgba(212, 175, 55, 0.1) !important;
                border: 1px solid rgba(212, 175, 55, 0.3) !important;
            }

            .text-gold {
                color: var(--gold) !important;
            }

            .btn-gold {
                background-color: var(--gold);
                color: white;
                border: none;
                transition: all 0.3s;
            }

            .btn-gold:hover {
                background-color: var(--gold-dark);
                color: white;
            }

            .profile-modal .modal-content {
                border: 2px solid var(--gold);
                border-radius: 10px;
            }

            .profile-modal .modal-header {
                border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            }

            .profile-modal .form-control {
                padding: 0.75rem 1rem;
                min-height: calc(1.5em + 1.5rem);
                border-radius: 5px;
            }

            .profile-img {
                transition: all 0.3s ease;
            }

            .profile-img:hover {
                transform: scale(1.05);
                box-shadow: 0 5px 15px rgba(212, 175, 55, 0.4);
            }
            .result{
                color:red;
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
                            <a class="nav-link active" href="bikes.jsp">Models</a>
                        </li>
                        <input type="text" hidden value="${email}" id="getemail"/>


                        <!-- Profile Dropdown -->
                        <li class="nav-item profile-dropdown dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                   <img src="getprofile?email=${email}" alt="profile" class="profile-img">
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><button class="dropdown-item" id="viewprofileBtn"><i class="fas fa-user-circle me-2"></i>My Profile</button></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="index.jsp"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                            </ul>
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
        <div class="result">
        ${result}
        </div>
    </section>

    <!-- Bikes Listing -->
    <section class="bikes-container">
        <div class="container">
            <div class="row">
                <c:forEach items="${bikesList}" var="bike" varStatus="loop">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="bike-card">
                            <div class="bike-img-container">
                                <div class="bike-img-slider">
                                    <img src="getpic?imges=${bike.rightview}" alt="${bike.model} - Right View" class="bike-img">
                                    <img src="getpicleft?imges=${bike.leftview}" alt="${bike.model} - Left View" class="bike-img">
                                    <img src="getpicfront?imges=${bike.frontview}" alt="${bike.model} - Front View" class="bike-img">
                                    <img src="getpicback?imges=${bike.backview}" alt="${bike.model} - Back View" class="bike-img">
                                </div>
                            </div>
                            <div class="bike-info">
                                <h3 class="bike-title">${bike.model}</h3>
                                <div class="bike-specs">
                                    <p><i class="fas fa-tachometer-alt"></i> <strong>Engine:</strong> ${bike.cc} cc</p>
                                    <p><i class="fas fa-gas-pump"></i> <strong>Mileage:</strong> ${bike.milage} kmpl</p>
                                    <p><i class="fas fa-palette"></i> <strong>Colors:</strong> ${bike.color}</p>
                                </div>
                                <div class="bike-price">Rs: ${bike.price}</div>
                                <div class="bike-actions">
                                    <a href="#" class="bike-btn">Book Now</a>
                                    <button class="bike-btn secondary" onclick="initModal('modal${loop.index}')" data-bs-toggle="modal" data-bs-target="#modal${loop.index}">Details</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bike Details Modal -->
                    <div class="modal fade bike-modal" id="modal${loop.index}" tabindex="-1" aria-labelledby="modalLabel${loop.index}" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalLabel${loop.index}">${bike.model}</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="image-container">
                                        <div class="image-slider" id="slider${loop.index}">
                                            <img src="getpicleft?imges=${bike.leftview}" alt="${bike.model} - Left View" class="modal-image active">
                                            <img src="getpic?imges=${bike.rightview}" alt="${bike.model} - Right View" class="modal-image">
                                            <img src="getpicfront?imges=${bike.frontview}" alt="${bike.model} - Front View" class="modal-image">
                                            <img src="getpicback?imges=${bike.backview}" alt="${bike.model} - Back View" class="modal-image">
                                        </div>
                                        <div class="nav-arrow left" onclick="prevImage('slider${loop.index}')">
                                            <i class="fas fa-chevron-left"></i>
                                        </div>
                                        <div class="nav-arrow right" onclick="nextImage('slider${loop.index}')">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                        <div class="image-dots">
                                            <span class="image-dot active" onclick="jumpToImage('slider${loop.index}', 0)"></span>
                                            <span class="image-dot" onclick="jumpToImage('slider${loop.index}', 1)"></span>
                                            <span class="image-dot" onclick="jumpToImage('slider${loop.index}', 2)"></span>
                                            <span class="image-dot" onclick="jumpToImage('slider${loop.index}', 3)"></span>
                                        </div>
                                    </div>
                                    <div class="info-container">
                                        <ul class="specs-list">
                                            <li>
                                                <span class="spec-label">Engine:</span>
                                                <span class="spec-value">${bike.cc} cc</span>
                                            </li>
                                            <li>
                                                <span class="spec-label">Mileage:</span>
                                                <span class="spec-value">${bike.milage} kmpl</span>
                                            </li>
                                            <li>
                                                <span class="spec-label">Colors:</span>
                                                <span class="spec-value">${bike.color}</span>
                                            </li>
                                            <li>
                                                <span class="spec-label">Fuel Type:</span>
                                                <span class="spec-value">Petrol</span>
                                            </li>
                                            <li>
                                                <span class="spec-label">Transmission:</span>
                                                <span class="spec-value">Manual</span>
                                            </li>
                                            <li>
                                                <span class="spec-label">ABS:</span>
                                                <span class="spec-value">Dual Channel</span>
                                            </li>
                                        </ul>
                                        <div class="modal-price">Rs: ${bike.price}</div>
                                        <div class="action-buttons">
                                            <a href="#" class="action-btn primary">Book Test Ride</a>
                                            <a href="#" class="action-btn secondary">Contact Dealer</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- view profile -->
                <div class="modal fade" id="viewprofile" tabindex="-1" aria-labelledby="viewprofile" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header bg-black text-white" >
                                <h5 class="modal-title" id="viewprofile"><i class="fas fa-user-circle me-2"></i>Profile Information</h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-4 mb-4 d-flex flex-column align-items-center">
                                        <img src="getprofile?email=${email}" alt="profile" class="profile-img img-fluid rounded-circle mb-3 shadow" style="width: 200px; height: 200px; object-fit: cover; border: 3px solid var(--gold);">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="mb-3">
                                            <label for="name" class="form-label fw-bold text-gold">Full Name</label>
                                            <span class="form-control bg-light-gold" id="name"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="email" class="form-label fw-bold text-gold" >Email Address</label>
                                            <span class="form-control bg-light-gold" id="email"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="dlnumber" class="form-label fw-bold text-gold">Driver License Number</label>
                                            <span class="form-control bg-light-gold" id="dlnumber"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="phonenumber" class="form-label fw-bold text-gold" >Phone Number</label>
                                            <span class="form-control bg-light-gold" id="phonenumber"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="address" class="form-label fw-bold text-gold" >Address</label>
                                            <span class="form-control bg-light-gold" id="address"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <a href="startupdateRegister?email=${email}"><button type="button" class="btn btn-gold">Edit Profile</button></a>
                            </div>
                        </div>
                    </div>
                </div>

    <!-- Footer -->
    <footer>
        <div class="container text-center">
            <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Logo" class="mb-4" style="height: 60px;">
            <div class="footer-links mb-4">
                <a href="#">About Us</a>
                <a href="#">Our Heritage</a>
                <a href="#">Showrooms</a>
                <a href="#">Services</a>
                <a href="#">Careers</a>
                <a href="#">Contact</a>
            </div>
            <div class="social-icons mb-4">
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

            // Initialize modal with images
            function initModal(modalId) {
                const modal = document.getElementById(modalId);
                const images = modal.querySelectorAll('.modal-image');
                const dots = modal.querySelectorAll('.image-dot');

                // Reset all images and dots
                images.forEach(img => img.classList.remove('active'));
                dots.forEach(dot => dot.classList.remove('active'));

                // Activate first image and dot
                if (images.length > 0) images[0].classList.add('active');
                if (dots.length > 0) dots[0].classList.add('active');
            }

            // Show gallery for bike card
            function showGallery(index) {
                const modal = new bootstrap.Modal(document.getElementById(`modal${index}`));
                initModal(`modal${index}`);
                modal.show();
            }

            // Image slider functions
            function prevImage(sliderId) {
                const slider = document.getElementById(sliderId);
                const images = slider.querySelectorAll('.modal-image');
                const dots = slider.parentElement.querySelectorAll('.image-dot');

                let currentIndex = 0;
                images.forEach((img, index) => {
                    if (img.classList.contains('active')) {
                        currentIndex = index;
                        img.classList.remove('active');
                        dots[index].classList.remove('active');
                    }
                });

                const newIndex = (currentIndex - 1 + images.length) % images.length;
                images[newIndex].classList.add('active');
                dots[newIndex].classList.add('active');
            }

            function nextImage(sliderId) {
                const slider = document.getElementById(sliderId);
                const images = slider.querySelectorAll('.modal-image');
                const dots = slider.parentElement.querySelectorAll('.image-dot');

                let currentIndex = 0;
                images.forEach((img, index) => {
                    if (img.classList.contains('active')) {
                        currentIndex = index;
                        img.classList.remove('active');
                        dots[index].classList.remove('active');
                    }
                });

                const newIndex = (currentIndex + 1) % images.length;
                images[newIndex].classList.add('active');
                dots[newIndex].classList.add('active');
            }

            function jumpToImage(sliderId, index) {
                const slider = document.getElementById(sliderId);
                const images = slider.querySelectorAll('.modal-image');
                const dots = slider.parentElement.querySelectorAll('.image-dot');

                if (index >= 0 && index < images.length) {
                    images.forEach(img => img.classList.remove('active'));
                    dots.forEach(dot => dot.classList.remove('active'));

                    images[index].classList.add('active');
                    dots[index].classList.add('active');
                }
            }
        </script>
        <script>
        document.getElementById("viewprofileBtn").addEventListener("click", function(event) {
            event.preventDefault();

            const email = document.getElementById("getemail").value;

            fetch("http://localhost:8095/project_main/getuser?email=" + encodeURIComponent(email))
                .then(response => response.json())
                .then(data => {
                    document.getElementById("name").innerHTML = data.name || "";
                    document.getElementById("email").innerHTML = data.email || "";
                    document.getElementById("phonenumber").innerHTML = data.phoneNumber || "";
                    document.getElementById("dlnumber").innerHTML = data.dlNumber || "";
                    document.getElementById("address").innerHTML = data.address || "";

                    console.log("User Data Loaded:", data);

                    var myModal = new bootstrap.Modal(document.getElementById("viewprofile"));
                    myModal.show();
                })
                .catch(error => {
                    console.error("Error fetching data:", error);
                    alert("Failed to fetch user data. Please try again.");
                });
        });
        </script>

</body>
</html>










