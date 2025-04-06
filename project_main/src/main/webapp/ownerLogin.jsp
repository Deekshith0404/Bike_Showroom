<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royal Enfield - Owner Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --gold: #d4af37;
            --gold-dark: #b38f2a;
            --black: #121212;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            padding-top: 70px; /* Adjusted for fixed navbar */
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                        url('images/bikeimg.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            width: 100%;
        }

        /* Navbar Styles */
        .main-navbar {
            background-color: rgba(18, 18, 18, 0.95) !important;
            border-bottom: 1px solid var(--gold);
            padding: 15px 0;
        }

        .nav-logo {
            height: 60px;
            width:120px
        }

        .nav-link-custom {
            color: white !important;
            font-weight: 500;
            margin: 0 15px;
            position: relative;
            padding: 8px 0 !important;
        }

        .nav-link-custom::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: var(--gold);
            transition: width 0.3s;
        }

        .nav-link-custom:hover::after,
        .nav-link-custom.active::after {
            width: 100%;
        }

        /* Login Container */
        .login-container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 400px;
            margin: 50px auto;
            backdrop-filter: blur(10px);
            color: white;
        }

        .login-title {
            text-align: center;
            margin-bottom: 25px;
            color: var(--gold);
            font-weight: 600;
        }

        .form-control-custom {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            transition: all 0.3s;
        }

        .form-control-custom:focus {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: var(--gold);
            outline: none;
            box-shadow: 0 0 0 0.25rem rgba(212, 175, 55, 0.25);
        }

        .btn-gold {
            background-color: var(--gold);
            color: var(--black);
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s;
            margin-top: 15px;
        }

        .btn-gold:hover {
            background-color: var(--gold-dark);
            transform: translateY(-2px);
        }

        .otp-link {
            color: var(--gold);
            cursor: pointer;
            text-decoration: underline;
            font-size: 13px;
            margin-top: -5px;
            display: inline-block;
        }

        .otp-link:hover {
            color: var(--gold-dark);
        }

        .countdown {
            color: var(--gold);
            font-size: 13px;
            margin-top: 5px;
            display: none;
        }

        .error-message {
            color: #ff6b6b;
            font-size: 13px;
            margin-top: 5px;
        }

        .result {
            color: #ff6b6b;
            text-align: center;
            margin-bottom: 15px;
            font-weight: 500;
        }

        .toggle-link {
            text-align: center;
            margin-top: 20px;
            color: #aaa;
        }

        .toggle-link a {
            color: var(--gold);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .toggle-link a:hover {
            color: var(--gold-dark);
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top main-navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="https://i.ibb.co/q3B9hMxW/606dac36-b17e-4c11-a8e6-73fa43467324.png" alt="Royal Enfield Logo" class="nav-logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom active" href="index.jsp ">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom" href="admin">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Login Container -->
    <div class="login-container">
        <h2 class="login-title">Owner Login</h2>
        <span class="result">${result}</span>
        
        <form id="loginForm" action="login">
            <div class="mb-3">
                <input type="email" class="form-control-custom" id="email" name="email" placeholder="Email" required>
                <span id="emailerror" class="error-message"></span>
            </div>
            
            <div class="mb-3">
                <a id="getOtpLink" class="otp-link" onclick="sendOtp()">Get OTP</a>
                <div id="countdown" class="countdown">OTP valid for: 02:00</div>
            </div>
            
            <div class="mb-3">
                <input type="password" class="form-control-custom" id="password" name="password" placeholder="Password" required disabled>
            </div>
            
            <button type="submit" class="btn btn-gold" id="submitBtn" disabled>Login</button>
        </form>
        
        <p class="toggle-link">Don't have an account? <a href="Owner.jsp">Register here</a></p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
    <script>
        // OTP Countdown Timer
        let timer;
        let timeLeft = 120; // 2 minutes in seconds
        
        function sendOtp() {
            const email = document.getElementById('email').value;
            if (!email) {
                document.getElementById('emailerror').textContent = 'Please enter email first';
                return;
            }
            
            // Simulate OTP sending
            document.getElementById('emailerror').textContent = 'OTP sent to your email';
            document.getElementById('getOtpLink').style.display = 'none';
            document.getElementById('countdown').style.display = 'block';
            document.getElementById('password').disabled = false;
            document.getElementById('submitBtn').disabled = false;
            
            // Start countdown
            timer = setInterval(updateCountdown, 1000);
            
            // Validate email via AJAX
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "http://localhost:8081/project_main/email?email=" + email);
            xhttp.send();
            console.log()
            
            xhttp.onload = function() {
                document.getElementById("emailerror").innerHTML = this.responseText;
            }
        }
        
        function updateCountdown() {
            const minutes = Math.floor(timeLeft / 60);
            let seconds = timeLeft % 60;
            seconds = seconds < 10 ? '0' + seconds : seconds;
            
            document.getElementById('countdown').textContent = `OTP valid for: ${minutes}:${seconds}`;
            
            if (timeLeft <= 0) {
                clearInterval(timer);
                document.getElementById('countdown').textContent = 'OTP expired!';
                document.getElementById('password').disabled = true;
                document.getElementById('submitBtn').disabled = true;
                document.getElementById('getOtpLink').style.display = 'inline-block';
                timeLeft = 120; // Reset timer
            } else {
                timeLeft--;
            }
        }
        

        function onemail() {
            const email = document.getElementById('email').value;
            if (email !== "") {
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8081/project_main/email?email=" + email);
                xhttp.send();
                
                xhttp.onload = function() {
                    document.getElementById("emailerror").innerHTML = this.responseText;
                }
            }
        }
    </script>
</body>
</html>