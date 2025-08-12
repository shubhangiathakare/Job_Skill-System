<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Job Seeker Dashboard</title>
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
        .dashboard-container {
            max-width: 800px;
            margin: 2rem auto;
            background: var(--white);
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }
        .welcome-header h2 {
            color: var(--primary);
            margin-bottom: 1.5rem;
            font-size: 1.75rem;
        }
        .user-info {
            margin-bottom: 2rem;
        }
        .user-info p {
            margin-bottom: 0.5rem;
            font-size: 1.1rem;
        }
        .user-info strong {
            color: var(--primary);
        }
        .nav-links {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }
        .nav-links a {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background-color: var(--primary);
            color: var(--white);
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        .nav-links a:hover {
            background-color: #3a56d4;
        }
    </style>
</head>
<body>
<div class="dashboard-container">
    <div class="welcome-header">
        <h2>Welcome</h2>
    </div>


    <div class="nav-links">
        <a href="viewAllJobs">View All Jobs</a>
        <a href="appliedJobs">Applied Jobs</a>
        <a href="jobSeekerLogout">Logout</a>
    </div>
</div>
</body>
</html>