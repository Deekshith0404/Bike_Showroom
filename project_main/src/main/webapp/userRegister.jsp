<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royal Enfield | Registration</title>
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
            background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.85)),
                        url('https://images.unsplash.com/photo-1558981806-ec527fa84c39?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Registration Form Styles */
        .registration-container {
            padding: 100px 0 50px;
        }

        .registration-card {
            background-color: rgba(18, 18, 18, 0.9);
            border: 1px solid var(--gold);
            border-radius: 0;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            transition: all 0.3s ease;
        }

        .registration-card:hover {
            box-shadow: 0 15px 40px rgba(212, 175, 55, 0.2);
        }

        .card-header {
            background-color: var(--black);
            border-bottom: 1px solid var(--gold);
            padding: 1.5rem;
        }

        .card-title {
            font-family: 'Playfair Display', serif;
            color: var(--gold);
            font-weight: 700;
            letter-spacing: 1px;
            margin-bottom: 0;
        }

        .form-control, .form-select {
            background-color: transparent;
            color: white;
            border: 1px solid var(--gold);
            border-radius: 0;
            padding: 10px 15px;
            transition: all 0.3s;
        }

        .form-control:focus, .form-select:focus {
            background-color: rgba(212, 175, 55, 0.1);
            color: white;
            border-color: var(--gold-dark);
            box-shadow: 0 0 0 0.25rem rgba(212, 175, 55, 0.25);
        }

        .form-control::placeholder {
            color: #aaa;
        }

        .form-label {
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #ddd;
        }

        .form-check-input {
            background-color: transparent;
            border: 1px solid var(--gold);
        }

        .form-check-input:checked {
            background-color: var(--gold);
            border-color: var(--gold);
        }

        .form-check-label {
            color: #ddd;
        }

        .btn-register {
            background-color: var(--gold);
            color: var(--black);
            font-weight: 700;
            padding: 12px;
            border: 2px solid var(--gold);
            border-radius: 0;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: all 0.4s;
        }

        .btn-register:hover {
            background-color: transparent;
            color: var(--gold);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .registration-card {
            animation: fadeIn 0.8s ease-out forwards;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .registration-container {
                padding: 80px 15px 30px;
            }

            .card-title {
                font-size: 1.5rem;
            }
        }

        /* Existing navbar styles (from your original code) */
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

        .navlogo {
            height: 50px;
            filter: brightness(0) invert(1);
        }

        /* Existing footer styles (from your original code) */
        footer {
            background-color: var(--black);
            color: white;
            border-top: 1px solid var(--gold);
        }
    </style>
</head>
<body>
    <!-- Navbar (from your original code) -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Logo" class="navlogo" width="150">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home</a>
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
                        <a class="nav-link active" href="#">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ownerLogin.jsp">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Registration Form -->
    <div class="registration-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card registration-card">
                        <div class="card-header text-center">
                            <h2 class="card-title">Register With Us</h2>
                        </div>
                        <div class="card-body p-4">
                            <form id="registrationForm">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="name" class="form-label">Full Name</label>
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your full name" required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <label for="age" class="form-label">Age</label>
                                        <input type="number" class="form-control" id="age" name="age" placeholder="Enter your age" min="18" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="dlno" class="form-label">Driving License No.</label>
                                        <input type="text" class="form-control" id="dlno" name="dlno" placeholder="Enter DL number" required>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <textarea class="form-control" id="address" rows="2" name="address" placeholder="Enter your full address" required></textarea>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <label for="phone" class="form-label">Phone Number</label>
                                        <input type="tel" class="form-control" id="phone" name="number" placeholder="Enter phone number" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="email" class="form-label">Email ID</label>
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address" required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <label for="showroom" class="form-label">Preferred Showroom</label>
                                                                                <select class="form-select" id="showroom" name="showroom" required>
                                                                                    <option value="" selected disabled>Select showroom</option>
                                                                                    <option>Mumbai Central</option>
                                                                                    <option>Delhi West</option>
                                                                                    <option>Bangalore South</option>
                                                                                    <option>Chennai East</option>
                                                                                    <option>Kolkata North</option>
                                                                                </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="bike" class="form-label">Bike Model</label>
                                        <select class="form-select" id="bike" required>
                                             <option value="" selected disabled>Select your bike</option>
                                             <option>Classic 350</option>
                                             <option>Bullet 350</option>
                                             <option>Meteor 350</option>
                                             <option>Interceptor 650</option>
                                             <option>Continental GT 650</option>
                                             <option>Himalayan</option>
                                          </select>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Schedule or Book a Ride</label>
                                    <div class="d-flex flex-wrap">
                                        <div class="form-check me-4">
                                            <input class="form-check-input" type="radio" name="rideOption" id="schedule" value="schedule" checked>
                                            <label class="form-check-label" for="schedule">
                                                Schedule Test Ride
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rideOption" id="bookNow" value="bookNow">
                                            <label class="form-check-label" for="bookNow">
                                                Book Ride Now
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="d-grid">
                                    <button type="submit" class="btn btn-register">SUBMIT REGISTRATION</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer (from your original code) -->
    <footer>
        <div class="container text-center py-4">
            <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Logo" class="footer-logo" style="height: 50px; filter: brightness(0) invert(1); margin-bottom: 1.5rem;">
            <div class="footer-links">
                <a href="#">About Us</a>
                <a href="#">Our Heritage</a>
                <a href="#">Showrooms</a>
                <a href="#">Services</a>
                <a href="#">Careers</a>
                <a href="#">Contact</a>
            </div>
            <div class="social-icons mt-3">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <p class="copyright mt-3">© 2025 Royal Enfield. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Navbar scroll effect
            window.addEventListener('scroll', function() {
                const navbar = document.querySelector('.navbar');
                if (window.scrollY > 50) {
                    navbar.classList.add('scrolled');
                } else {
                    navbar.classList.remove('scrolled');
                }
            });

            // Form validation and submission
            const registrationForm = document.getElementById('registrationForm');

            registrationForm.addEventListener('submit', function(e) {
                e.preventDefault();

                // Validate form
                if (validateForm()) {
                    // Get form data
                    const formData = {
                        id: document.getElementById('id').value,
                        name: document.getElementById('name').value,
                        age: document.getElementById('age').value,
                        dlno: document.getElementById('dlno').value,
                        address: document.getElementById('address').value,
                        phone: document.getElementById('phone').value,
                        email: document.getElementById('email').value,
                        bike: document.getElementById('bike').value,
                        showroom: document.getElementById('showroom').value,
                        rideOption: document.querySelector('input[name="rideOption"]:checked').value
                    };

                    // Here you would typically send the data to a server
                    console.log('Form submitted:', formData);

                    // Show success message
                    alert('Registration successful! We will contact you soon.');

                    // Reset form
                    registrationForm.reset();
                }
            });

            function validateForm() {
                let isValid = true;
                const inputs = registrationForm.querySelectorAll('input, select, textarea');

                inputs.forEach(input => {
                    if (input.hasAttribute('required') && !input.value) {
                        input.style.borderColor = 'red';
                        isValid = false;
                    } else {
                        input.style.borderColor = 'var(--gold)';
                    }

                    // Special validation for email
                    if (input.type === 'email' && input.value) {
                        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                        if (!emailRegex.test(input.value)) {
                            input.style.borderColor = 'red';
                            isValid = false;
                        }
                    }

                    // Special validation for phone
                    if (input.id === 'phone' && input.value) {
                        const phoneRegex = /^[0-9]{10,15}$/;
                        if (!phoneRegex.test(input.value)) {
                            input.style.borderColor = 'red';
                            isValid = false;
                        }
                    }

                    // Special validation for age
                    if (input.id === 'age' && input.value) {
                        if (parseInt(input.value) < 18) {
                            input.style.borderColor = 'red';
                            isValid = false;
                            alert('You must be at least 18 years old to register.');
                        }
                    }
                });

                return isValid;
            }

            // Add animation to form elements
            const formElements = document.querySelectorAll('.form-control, .form-select, .form-check-input, .btn-register');
            formElements.forEach((element, index) => {
                element.style.opacity = '0';
                element.style.transform = 'translateY(20px)';
                element.style.animation = `fadeIn 0.5s ease-out ${index * 0.1}s forwards`;
            });
        });
    </script>
</body>
</html>