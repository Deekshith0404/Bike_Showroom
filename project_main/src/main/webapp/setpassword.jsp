<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royal Enfield | Reset Password</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        :root {
            --gold: #d4af37;
            --gold-light: #e8c874;
            --gold-dark: #b38f2a;
            --black: #121212;
            --gray-dark: #2a2a2a;
            --gray-light: #f5f5f5;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            color: var(--black);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: var(--gray-light);
            position: relative;
        }

        /* Navbar Styles (Unchanged) */
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

        /* Reset Password Section - Updated Theme */
        .reset-container {
            padding: 80px 0;
            margin-top: 70px;
            flex: 1;
            display: flex;
            align-items: center;
            background: linear-gradient(135deg, rgba(248,248,248,1) 0%, rgba(255,255,255,1) 100%);
        }

        .reset-card {
            background-color: white;
            border-radius: 8px;
            padding: 40px;
            max-width: 500px;
            width: 100%;
            margin: 0 auto;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.08);
            border: none;
            position: relative;
            overflow: hidden;
            border-top: 4px solid var(--gold);
        }

        .reset-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .reset-header img {
            height: 50px;
            margin-bottom: 15px;
        }

        .reset-header h1 {
            font-family: 'Playfair Display', serif;
            color: var(--black);
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
        }

        .reset-header p {
            color: var(--gray-dark);
            font-size: 1rem;
            margin-top: 10px;
        }

        .form-control {
            border: 1px solid #e0e0e0;
            padding: 12px 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            background-color: white;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--gold-light);
            box-shadow: 0 0 0 0.2rem rgba(212, 175, 55, 0.15);
        }

        .password-input {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 42px;
            cursor: pointer;
            color: var(--gray-dark);
            opacity: 0.6;
            transition: all 0.3s;
        }

        .password-toggle:hover {
            opacity: 1;
            color: var(--gold-dark);
        }

        .reset-btn {
            background-color: var(--gold);
            color: white;
            border: none;
            padding: 12px 25px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
            width: 100%;
            margin-top: 10px;
            border-radius: 4px;
        }

        .reset-btn:hover {
            background-color: var(--gold-dark);
            transform: translateY(-2px);
        }

        .back-to-login {
            text-align: center;
            margin-top: 20px;
        }

        .back-to-login a {
            color: var(--gold-dark);
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s;
            font-weight: 500;
        }

        .back-to-login a:hover {
            color: var(--black);
            text-decoration: underline;
        }

        /* Password Requirements */
        .password-requirements {
            background-color: rgba(248, 248, 248, 0.8);
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
            border-left: 3px solid var(--gold-light);
        }

        .password-requirements small {
            display: block;
            margin-bottom: 5px;
            color: var(--gray-dark);
        }

        .requirement {
            display: flex;
            align-items: center;
            margin-bottom: 3px;
        }

        .requirement i {
            margin-right: 8px;
            font-size: 0.8rem;
        }

        /* Footer Styles (Unchanged) */
        footer {
            background-color: var(--black);
            color: white;
            border-top: 1px solid var(--gold);
            padding: 20px 0;
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
            font-size: 0.9rem;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .reset-container {
                padding: 40px 20px;
                margin-top: 60px;
            }

            .reset-card {
                padding: 30px;
            }

            .reset-header h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar (Unchanged) -->
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
                        <a class="nav-link" href="#">location</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ownerLogin.jsp">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Reset Password Form -->
    <div class="reset-container">
        <div class="container">
            <div class="reset-card">
                <div class="reset-header">
                    <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Logo">
                    <h1>Reset Your Password</h1>
                    <p>Please enter your new password below</p>
                </div>
                <form action="updatePassword" method="post">
                <span>${result}</span>
                <input type="text" name="email" hidden value="${email}" />
                    <div class="mb-3 password-input">
                        <label for="password" class="form-label">New Password</label>
                        <input type="password" class="form-control" id="password" name="password" required placeholder="Create new password">
                        <i class="far fa-eye password-toggle" id="togglePassword"></i>
                    </div>
                    <div class="mb-3 password-input">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required placeholder="Re-enter your password">
                        <i class="far fa-eye password-toggle" id="toggleConfirmPassword"></i>
                    </div>

                    <div class="password-requirements">
                        <small>Your password must contain:</small>
                        <div class="requirement">
                            <i class="fas fa-check-circle text-muted" id="lengthCheck"></i>
                            <small>At least 8 characters</small>
                        </div>
                        <div class="requirement">
                            <i class="fas fa-check-circle text-muted" id="uppercaseCheck"></i>
                            <small>One uppercase letter</small>
                        </div>
                        <div class="requirement">
                            <i class="fas fa-check-circle text-muted" id="numberCheck"></i>
                            <small>One number</small>
                        </div>
                        <div class="requirement">
                            <i class="fas fa-check-circle text-muted" id="specialCheck"></i>
                            <small>One special character</small>
                        </div>
                    </div>

                    <button type="submit" class="btn reset-btn" id="submitBtn">Update Password</button>
                    <div class="back-to-login">
                        <a href="login.jsp"><i class="fas fa-arrow-left me-2"></i>Return to login</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer (Unchanged) -->
    <footer>
        <div class="container text-center">
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

        // Password toggle visibility
        const togglePassword = document.querySelector('#togglePassword');
        const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
        const password = document.querySelector('#password');
        const confirmPassword = document.querySelector('#confirmPassword');
        const submitBtn = document.querySelector('#submitBtn');

        togglePassword.addEventListener('click', function() {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });

        toggleConfirmPassword.addEventListener('click', function() {
            const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            confirmPassword.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });

        // Password validation
        password.addEventListener('input', function() {
            const passwordValue = this.value;

            // Update requirement checks
            updateRequirement('lengthCheck', passwordValue.length >= 8);
            updateRequirement('uppercaseCheck', /[A-Z]/.test(passwordValue));
            updateRequirement('numberCheck', /[0-9]/.test(passwordValue));
            updateRequirement('specialCheck', /[^A-Za-z0-9]/.test(passwordValue));

            // Enable/disable submit button based on password match
            checkPasswordsMatch();
        });

        confirmPassword.addEventListener('input', checkPasswordsMatch);

        function updateRequirement(id, isValid) {
            const icon = document.getElementById(id);
            if (isValid) {
                icon.classList.remove('text-muted');
                icon.classList.add('text-success');
            } else {
                icon.classList.remove('text-success');
                icon.classList.add('text-muted');
            }
        }

        function checkPasswordsMatch() {
            if (password.value && confirmPassword.value && password.value === confirmPassword.value) {
                submitBtn.disabled = false;
            } else {
                submitBtn.disabled = true;
            }
        }
    </script>
</body>
</html>