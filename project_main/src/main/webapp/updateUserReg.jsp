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

        .errormessage{
               color:red;
        }

        /* New style for ride schedule options */
        .ride-schedule-options {
            display: none;
            margin-top: 15px;
            padding: 15px;
            background-color: rgba(18, 18, 18, 0.7);
            border: 1px solid var(--gold);
            border-radius: 0;
        }

        .ride-schedule-options.show {
            display: block;
            animation: fadeIn 0.5s ease-out;
        }
        .dropdown{
            color:black;
        }
        .resultcolor{
            color:red;
        }
        option{
            color:black;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="Royalenfield.com">
                <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Logo" class="navlogo" width="150">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
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
                            <h2 class="card-title">Update Details</h2>
                        </div>
                        <div class="card-body p-4">
                            <form id="updateregistrationForm" action="updateregistrationForm" method="post"  enctype="multipart/form-data">

                                 <input type="text" class="form-control" name="email" id="email" value="${user.email}" hidden required>
                                 <input type="text" class="form-control" name="id" id="id" value="${user.id}" hidden required>
                                <div class="row mb-3">
                                         <label for="Profile pic" class="form-label">Profile</label>
                                         <input type="file" class="form-control" name="profilefile" id="profilefile" required >
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span id="nameerror" class="errormessage"></span><br>
                                        <label for="name" class="form-label">Full Name</label>
                                        <input type="text" class="form-control" id="name" value="${user.name}" onChange="onname()" name="name" placeholder="Enter your full name" required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                 <span id="ageerror" class="errormessage"></span><br>
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <label for="age" class="form-label">Age</label>
                                        <input type="number" class="form-control" onChange="onage()" value="${user.age}" id="age" name="age" placeholder="Enter your age" min="18" required>
                                    </div>
                                    <span id="dlnoerror" class="errormessage"></span><br>
                                    <div class="col-md-6">
                                        <label for="dlno" class="form-label">Driving License No.</label>
                                        <input type="text" class="form-control" id="dlno" value="${user.dlNumber}" name="dlNumber" onChange="ondlno()" placeholder="Enter DL number" required>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <span id="addresserror" class="errormessage"></span><br>
                                    <label for="address" class="form-label">Address</label>
                                    <textarea class="form-control" id="address" rows="2" onChange="onaddress()" name="address" value="${user.address}" placeholder="Enter your full address" required>${user.address}</textarea>
                                </div>

                                <div class="row mb-3">
                                        <span id="phoneerror" class="errormessage"></span><br>
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <label for="phone" class="form-label">Phone Number</label>
                                        <input type="tel" class="form-control" onChange="onnumber()" value="${user.phoneNumber}" id="phone" name="phoneNumber" placeholder="Enter phone number" required>
                                    </div>
                                        <span id="emailerror" class="errormessage"></span><br>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <label for="showroom" class="form-label">Preferred Showroom</label>
                                        <select class="form-select" id="showroom" name="showroom" onChange="fetchBikes()" required>
                                             <option value="${user.showroom}">${user.showroom}</option>
                                             <div class="dropdown">
                                                 <c:forEach items="${branchdata}" var="branch">
                                                      <option value="${branch}">${branch}</option>
                                                 </c:forEach>
                                             </div>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="bike" class="form-label">Bike Model</label>
                                        <select class="form-select" id="bike" name="bikeModel" required>
                                             <option value="${user.bikeModel}">${user.bikeModel}</option>
                                             <div class="dropdown">
                                             <option></option>
                                             </div>
                                          </select>
                                    </div>
                                </div>
                                <div class="d-grid">
                                    <input type="submit" class="btn btn-register" value="UPDATE"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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

            // Add animation to form elements
            const formElements = document.querySelectorAll('.form-control, .form-select, .form-check-input, .btn-register');
            formElements.forEach((element, index) => {
                element.style.opacity = '0';
                element.style.transform = 'translateY(20px)';
                element.style.animation = `fadeIn 0.5s ease-out ${index * 0.1}s forwards`;
            });

            // Set minimum date for ride scheduling (today)
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('rideDate').min = today;

            // Toggle ride schedule options based on radio selection
            const scheduleRadio = document.getElementById('schedule');
            const bookNowRadio = document.getElementById('bookNow');
            const rideScheduleOptions = document.getElementById('rideScheduleOptions');

            function toggleRideOptions() {
                if (scheduleRadio.checked) {
                    rideScheduleOptions.classList.add('show');
                    // Make date and time required
                    document.getElementById('rideDate').required = true;
                    document.getElementById('rideTime').required = true;
                } else {
                    rideScheduleOptions.classList.remove('show');
                    // Remove required attribute when not scheduling
                    document.getElementById('rideDate').required = false;
                    document.getElementById('rideTime').required = false;
                }
            }

            // Initial check
            toggleRideOptions();

            // Add event listeners
            scheduleRadio.addEventListener('change', toggleRideOptions);
            bookNowRadio.addEventListener('change', toggleRideOptions);
        });

        function onname(){
            var name=document.getElementById('name').value;
            const patter=/^[A-Z][a-z]*$/;
            if(patter.test(name)){
            document.getElementById('nameerror').innerHTML="";
                    if (name!=="") {
                         var xhttp = new XMLHttpRequest();
                         xhttp.open("GET","http://localhost:8095/project_main/valnamereg?name="+name);
                         xhttp.send();

                         xhttp.onload = function(){
                         document.getElementById("nameerror").innerHTML = this.responseText;
                      }
                  }

            }else{
                document.getElementById('nameerror').innerHTML="invalid pattern start the name with captial letter";
            }
        }

        function onage(){
            var age=document.getElementById('age').value;
            if(age<16){
                document.getElementById('ageerror').innerHTML="age must be above 16";
            }else{
                document.getElementById('ageerror').innerHTML="";
            }
        }

        function onnumber(){
            var number=document.getElementById('phone').value;
            const pattern=/^[98]\d{9}$/;
            if(pattern.test(number)){
                   document.getElementById('phoneerror').innerHTML=""
                   if(number!==""){
                        var xhttp = new XMLHttpRequest();
                        xhttp.open("GET","http://localhost:8095/project_main/regnumberVal?number="+number);
                        xhttp.send();

                        xhttp.onload = function(){
                            document.getElementById("phoneerror").innerHTML = this.responseText;
                        }
                   }
            }else{
                document.getElementById('phoneerror').innerHTML="invalid number pattern and size must be 10";
            }
        }

        function fetchBikes() {
          const branchId = document.getElementById('showroom').value;
          const xhr = new XMLHttpRequest();
          xhr.open("GET", "http://localhost:8095/project_main/getbranchbike?branchname="+branchId);
          xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
              const bikes = JSON.parse(xhr.responseText);
              const bikeDropdown = document.getElementById('bike');
              bikeDropdown.innerHTML = '<option value="" disabled selected>Select a bike</option>'; // Clear previous options
              bikes.forEach(bike => {
                const option = document.createElement('option');
                option.value = bike;
                option.textContent = bike;
                bikeDropdown.appendChild(option);
              });
            }
          };
          xhr.send();
        }


        function ondlno() {
            var dlNumber=document.getElementById('dlno').value;

            if (dlNumber!=="") {
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET","http://localhost:8095/project_main/regdlnum?dlnum="+dlNumber);
                xhttp.send();

                xhttp.onload = function(){
                    document.getElementById("dlnoerror").innerHTML = this.responseText;
                }
              }
           }

        function onaddress() {
            // Add your address validation logic here if needed
        }
    </script>
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                crossorigin="anonymous"></script>
</body>
</html>