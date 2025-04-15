<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royal Enfield | Admin Dashboard</title>
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

        .navbar {
            background-color: var(--black) !important;
            border-bottom: 1px solid var(--gold);
            padding: 15px 0;
        }

        .navbar-brand img {
            height: 40px;
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

        .dashboard-header {
            background-color: var(--black);
            color: white;
            padding: 30px 0;
            margin-bottom: 30px;
            border-bottom: 1px solid var(--gold);
        }

        .dashboard-header h1 {
            font-family: 'Playfair Display', serif;
            color: var(--gold);
            font-weight: 700;
        }

        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            transition: transform 0.3s, box-shadow 0.3s;
            border-top: 3px solid var(--gold);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            background-color: white;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            font-weight: 700;
            padding: 15px 20px;
        }

        .btn-gold {
            background-color: var(--gold);
            color: var(--black);
            font-weight: 700;
            padding: 8px 20px;
            border-radius: 4px;
            border: none;
            transition: all 0.3s;
        }

        .btn-gold:hover {
            background-color: var(--gold-dark);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(212, 175, 55, 0.3);
        }

        .btn-outline-gold {
            background-color: transparent;
            color: var(--gold);
            border: 1px solid var(--gold);
            font-weight: 600;
            padding: 8px 20px;
            border-radius: 4px;
            transition: all 0.3s;
        }

        .btn-outline-gold:hover {
            background-color: var(--gold);
            color: var(--black);
        }

        .badge-gold {
            background-color: var(--gold);
            color: var(--black);
        }

        footer {
            background-color: var(--black);
            color: white;
            border-top: 1px solid var(--gold);
            padding: 20px 0;
            margin-top: 50px;
        }

        /* Modal Styles */
        .modal-header {
            background-color: var(--black);
            color: white;
            border-bottom: 1px solid var(--gold);
        }

        .modal-title {
            font-family: 'Playfair Display', serif;
            color: var(--gold);
        }

        .modal-footer {
            border-top: 1px solid var(--gold);
        }

        .close {
            color: white;
        }

        /* Form Styles */
        .form-label {
            font-weight: 600;
        }

        /* Status Badges */
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .status-active {
            background-color: rgba(40, 167, 69, 0.2);
            color: #28a745;
        }

        .status-inactive {
            background-color: rgba(220, 53, 69, 0.2);
            color: #dc3545;
        }
        .resultlist{
            color:white;
        }

        /* Showroom Bike Modal */
        #showroomBikeModal .modal-dialog {
            max-width: 800px;
        }
        .showroom-bike-image {
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .reslt{
        color:green;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="dashboard.jsp">
                <img src="https://logos-world.net/wp-content/uploads/2022/12/Royal-Enfield-Logo.png" alt="Royal Enfield Logo" style="height: 40px;">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="dashboard.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="startRegister">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <header class="dashboard-header">
        <div class="container text-center">
            <h1>Admin Dashboard</h1>
            <p class="mb-0">Manage your Royal Enfield inventory and branches</p>
            <div class="reslt">
              ${branchresult}
              ${bikeresult}
              ${result}
            </div>
        </div>
    </header>

    <div class="container">
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h3 class="card-title">${bike}</h3>
                        <p class="card-text">Total Bikes</p>
                        <i class="fas fa-motorcycle fa-2x" style="color: var(--gold);"></i>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h3 class="card-title">${branch}</h3>
                        <p class="card-text">Branches</p>
                        <i class="fas fa-store fa-2x" style="color: var(--gold);"></i>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h3 class="card-title">${user}</h3>
                        <p class="card-text">Customers</p>
                        <i class="fas fa-users fa-2x" style="color: var(--gold);"></i>
                    </div>
                </div>
            </div>

            <!-- New Showroom Bike Card -->
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h3 class="card-title">${showroomBikes}</h3>
                        <p class="card-text">Showroom Bikes</p>
                        <button class="btn btn-gold btn-sm" data-bs-toggle="modal" data-bs-target="#showroomBikeModal">
                            <i class="fas fa-plus"></i> Add to Showroom
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bikes Inventory Section -->
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <span>Bikes Inventory</span>
                        <button class="btn btn-gold btn-sm" data-bs-toggle="modal" data-bs-target="#addBikeModal">
                            <i class="fas fa-plus"></i> Add Bike
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive" style="max-height: 200px; overflow-y: auto;">
                            <table class="table table-hover">
                                <thead style="position: sticky; top: 0; background-color: white; z-index: 1;">
                                    <tr>
                                        <th>Model</th>
                                        <th>Name</th>
                                        <th>CC</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${justbike}" var="bike">
                                        <tr>
                                            <td>${bike.model}</td>
                                            <td>${bike.bikename}</td>
                                            <td>${bike.cc}</span></td>
                                            <td>
                                                <a href="edit?id=${bike.model}" class="btn btn-outline-gold btn-sm">Edit</a>
                                                <a href="edit?id=${follow.name}" class="btn btn-outline-danger btn-sm">Delete</a>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Branches Section -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <span>Branches</span>
                        <button class="btn btn-gold btn-sm" data-bs-toggle="modal" data-bs-target="#addBranchModal">
                            <i class="fas fa-plus"></i> Add Branch
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive" style="max-height: 200px; overflow-y: auto;">
                            <table class="table table-hover">
                                <thead style="position: sticky; top: 0; background-color: white; z-index: 1;">
                                    <tr>
                                        <th>Branch Name</th>
                                        <th>Location</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${branchesList}" var="branch">
                                        <tr>
                                            <td>${branch.name}</td>
                                            <td>${branch.location}</td>
                                            <td><span class="status-badge ${branch.status == 'active' ? 'status-active' : 'status-inactive'}">${branch.status}</span></td>
                                            <td>
                                                <a href="branchEdit?name=${branch.name}" class="btn btn-outline-gold btn-sm" >Edit</a>
                                                <a href="branchDelete?name=${branch.name}" class="btn btn-outline-danger btn-sm">delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- followup page -->
       <div class="row">
        <div class="col-sm-9 p-3">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <span>Follow up</span>

                            </div>
                            <div class="card-body">
                                <div class="table-responsive" style="max-height: 200px; overflow-y: auto;">
                                    <table class="table table-hover">
                                        <thead style="position: sticky; top: 0; background-color: white; z-index: 1;">
                                            <tr>
                                                <th>User</th>
                                                <th>RideOption</th>
                                                <th>Model</th>
                                                <th>showroom</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${followIt}" var="follow">
                                                <tr>
                                                    <td>${follow.name}</td>
                                                    <td>${follow.rideOption}</td>
                                                    <td>${follow.bikeModel}</td>
                                                    <td>${follow.showroom}</td>
                                                    <td>
                                                       <a href="#" class="btn btn-outline-gold btn-sm editFollowupBtn" data-bs-toggle="modal" data-name="${follow.name}">Edit</a>
                                                       <a href="followupview?name=${follow.name}" class="btn btn-outline-success btn-sm">View</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
         </div>
        </div>
    </div>

    <!-- Add Bike Modal -->
    <div class="modal fade" id="addBikeModal" tabindex="-1" aria-labelledby="addBikeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addBikeModalLabel"><i class="fas fa-motorcycle"></i> Add New Bike</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="addbike" method="post" enctype="multipart/form-data">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="bikeName" class="form-label">Bike Name</label>
                                <input type="text" class="form-control" id="bikeName" name="bikename" placeholder="e.g., Classic 350" required>
                            </div>
                            <div class="col-md-6">
                                 <label for="bikeModel" class="form-label">Model</label>
                                 <input type="text" class="form-control" id="bikeModel" name="model" placeholder="e.g., Classic 350" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="bikeEngine" class="form-label">Engine (CC)</label>
                                <input type="number" class="form-control" name="cc" id="bikeEngine" placeholder="e.g., 350" required>
                            </div>
                            <div class="col-md-4">
                                <label for="bikeMileage" class="form-label">Mileage (kmpl)</label>
                                <input type="number" class="form-control" name="milage" id="bikeMileage" placeholder="e.g., 35" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="bikePrice" class="form-label">Price (₹)</label>
                                <input type="number" class="form-control" name="price" id="bikePrice" placeholder="e.g., 215000" required>
                            </div>
                            <div class="col-md-6">
                                <label for="bikeColor" class="form-label">Available Colors</label>
                                <input type="text" class="form-control" name="color" id="bikeColor" placeholder="e.g., Black, Red, Blue">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="bikeImage" class="form-label">front image</label>
                            <input class="form-control" type="file" name="front" id="bikeImage" name="front">
                        </div>
                        <div class="mb-3">
                             <label for="bikeImage" class="form-label">Left-Side image</label>
                             <input class="form-control" name="left" type="file" id="bikeImage" name="left">
                        </div>
                        <div class="mb-3">
                              <label for="bikeImage" class="form-label">Rigth-Side image</label>
                              <input class="form-control" name="right" type="file" id="bikeImage" name="right">
                        </div>
                        <div class="mb-3">
                               <label for="bikeImage" class="form-label">Bike-back image</label>
                               <input class="form-control" name="back" type="file" id="bikeImage" name="back">
                        </div>
                        <div class="modal-footer">
                               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                               <input type="submit" class="btn btn-gold" value="add"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- edit the follow up page -->
    <div class="modal fade" id="editfollowup" tabindex="-1" aria-labelledby="editfollowupLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editfollowupLabel"></i>Follow UP</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="followupeditsubmit" method="post">
                            <div class="col-mb-6">
                                    <label for="Name" class="form-label"> Name : </label>
                                    <span id="followupName" name="name" ></span>
                            </div>
                            <div class="col-md-6">
                                   <label for="status" class="form-label">status : </label>
                                   <span id="followupData" name="status"></span>
                            </div>
                                <div class="col-md-6">
                                    <label for="bikePrice" class="form-label">Message</label>
                                    <input type="message" class="form-control" name="message" id="message" required>
                                </div>

                            <div class="modal-footer">
                                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                   <input type="submit" class="btn btn-gold" value="submit"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </div>


    <!-- Add Bike to Showroom Modal -->
    <div class="modal fade" id="showroomBikeModal" tabindex="-1" aria-labelledby="showroomBikeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="showroomBikeModalLabel"><i class="fas fa-store"></i> Add Bike to Showroom</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="addbiketoshowroom" method="post" ">
                        <div class="row">
                            <div class="col-md-6">

                                <div class="mb-3">
                                    <label for="showroomBranch" class="form-label">Select Branch</label>
                                    <select class="form-select" id="showroomBranch" name="branch" required>
                                        <option value="">-- Select Branch --</option>
                                        <c:forEach items="${notfullbranch}" var="branch">
                                            <option value="${branch.id}">${branch.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="mb-3">
                                        <label for="showroomBike" class="form-label">Select Bike</label>
                                        <select class="form-select" id="showroomBike" name="bike" required>
                                               <option value="">-- Select Bike --</option>
                                               <c:forEach items="${unSelBike}" var="bike">
                                               <option value="${bike.id}">${bike.bikename}</option>
                                                 </c:forEach>
                                       </select>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-gold">Add to Showroom</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Branch Modal -->
    <div class="modal fade" id="addBranchModal" tabindex="-1" aria-labelledby="addBranchModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addBranchModalLabel"><i class="fas fa-store"></i> Add New Branch</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="addbranch" method="post">
                    <div class="resultlist">
                    </div>
                        <div class="mb-3">
                            <label for="branchName" class="form-label">Branch Name</label>
                            <input type="text" class="form-control" name="name" id="branchName" placeholder="e.g., Royal Enfield Mumbai Central" required>
                        </div>
                        <div class="mb-3">
                            <label for="branchLocation" class="form-label">Location</label>
                            <input type="text" class="form-control" name="location" id="branchLocation" placeholder="e.g., 123 Heritage Road, Mumbai" required>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="branchContact" class="form-label">Contact Number</label>
                                <input type="text" class="form-control" name="number" id="branchContact" placeholder="e.g., +91 9876543210" required>
                            </div>
                            <div class="col-md-6">
                                <label for="branchEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" id="branchEmail" placeholder="e.g., mumbai@royalenfield.com">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="branchManager" class="form-label">Branch Manager</label>
                            <input type="text" class="form-control" name="managerName" id="branchManager" placeholder="e.g., John Doe">
                        </div>
                        <div class="mb-3">
                            <label for="branchStatus" class="form-label">Status</label>
                            <select class="form-select" id="branchStatus" name="status">
                                <option value="active" selected>Active</option>
                                <option value="inactive">Inactive</option>
                                <option value="maintenance">Under Maintenance</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                              <input type="submit" class="btn btn-gold">Save Branch</input>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <div class="container text-center">
            <p class="copyright mb-0"> © 2025 Royal Enfield. All Rights Reserved. | Made with <i class="fas fa-heart" style="color: var(--gold);"></i> for Motorcycle Enthusiasts</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
    document.querySelectorAll('.editFollowupBtn').forEach(item => {
        item.addEventListener('click', function(event) {
            event.preventDefault();

            let name = this.getAttribute('data-name');

            fetch("http://localhost:8081/project_main/followupedit?name=" + encodeURIComponent(name))
                .then(response => response.json())
                .then(data => {
                    document.getElementById("followupName").textContent = data.name;
                    document.getElementById("followupData").textContent = data.rideOption;

                    var myModal = new bootstrap.Modal(document.getElementById("editfollowup"));
                    myModal.show();
                })
                .catch(error => console.error("Error fetching data:", error));
        });
    });
    </script>

</body>
</html>