<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employer Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --white: #ffffff;
            --light: #f8f9fa;
            --dark: #212529;
        }
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--light);
            color: var(--dark);
        }
        .navbar {
            background-color: var(--primary);
            color: var(--white);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .navbar h2 {
            margin: 0;
            font-size: 1.5rem;
            font-weight: 600;
        }
        .navbar a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            transition: opacity 0.3s;
        }
        .navbar a:hover {
            opacity: 0.9;
        }
        .dashboard {
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        .welcome-message {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        .welcome-message h3 {
            font-size: 1.5rem;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
        }
        .card {
            background: var(--white);
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0,0,0,0.1);
        }
        .card i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }
        .card a {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background-color: var(--primary);
            color: var(--white);
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        .card a:hover {
            background-color: #3a56d4;
        }
    </style>
</head>
<body>
<div class="navbar">
    <h2>Employer Dashboard</h2>
    <div>
        <a href="employerLogin">Logout</a>
    </div>
</div>

<div class="dashboard">
    <div class="welcome-message">
        <h3>Welcome to your dashboard</h3>
    </div>
    <div class="card-container">
        <div class="card">
            <i class="fas fa-plus-circle"></i>
            <a href="postJob">Post New Job</a>
        </div>
        <div class="card">
            <i class="fas fa-briefcase"></i>
            <a href="viewMyJobs">View My Jobs</a>
        </div>
        
    </div>
</div>
</body>
</html>