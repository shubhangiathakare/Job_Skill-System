<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Job Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --white: #ffffff;
            --light: #f8f9fa;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: var(--light);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .portal-container {
            text-align: center;
            background: var(--white);
            padding: 3rem;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            max-width: 500px;
            width: 100%;
        }
        .portal-header h1 {
            color: var(--primary);
            margin-bottom: 2rem;
            font-size: 2rem;
        }
        .portal-options {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }
        .portal-btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background-color: var(--primary);
            color: var(--white);
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        .portal-btn:hover {
            background-color: #3a56d4;
        }
    </style>
</head>
<body>
<div class="portal-container">
    <div class="portal-header">
        <h1>Job Portal</h1>
    </div>
    
    <div class="portal-options">
        <a href="adminlog" class="portal-btn">Admin Login</a>
        <a href="employerLogin" class="portal-btn">Employer Login</a>
        <a href="jobSeekerLogin" class="portal-btn">Job Seeker Login</a>
    </div>
</div>
</body>
</html>