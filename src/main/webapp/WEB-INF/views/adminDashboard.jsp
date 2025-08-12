<%@ page language="java" contentType="text/html" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --white: #ffffff;
            --light: #f8f9fa;
            --dark: #212529;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: var(--light);
            margin: 0;
            padding: 0;
            color: var(--dark);
        }
        .admin-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }
        .admin-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        .admin-header h2 {
            font-size: 2rem;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 1rem;
        }
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }
        .dashboard-card {
            background: var(--white);
            border-radius: 10px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0,0,0,0.1);
        }
        .dashboard-card a {
            display: block;
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            font-size: 1.1rem;
            padding: 0.75rem;
            border-radius: 6px;
            transition: background-color 0.3s;
        }
        .dashboard-card a:hover {
            background-color: rgba(67, 97, 238, 0.1);
        }
        .dashboard-card i {
            font-size: 2rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div class="admin-container">
    <div class="admin-header">
        <h2>Welcome Admin</h2>
    </div>
    
    <div class="dashboard-grid">
        <div class="dashboard-card">
            <i class="fas fa-user-plus"></i>
            <a href="addEmployer">Add Employer</a>
        </div>
        
        <div class="dashboard-card">
            <i class="fas fa-building"></i>
            <a href="viewEmployers">View Employers</a>
        </div>
        
        <div class="dashboard-card">
            <i class="fas fa-users"></i>
            <a href="admin/viewSeekers">View Seekers</a>
        </div>
        
        <div class="dashboard-card">
            <i class="fas fa-briefcase"></i>
            <a href="admin/viewAllJobs">View All Jobs</a>
        </div>
    </div>
</div>
</body>
</html>