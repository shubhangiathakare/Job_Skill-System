<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.jobskill.model.JobSeeker" %>
<%
    List<JobSeeker> seekers = (List<JobSeeker>) request.getAttribute("seekers");
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Job Seekers</title>
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
            padding: 2rem;
            color: var(--dark);
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: var(--white);
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            padding: 2rem;
        }
        .page-header {
            margin-bottom: 2rem;
        }
        .page-header h2 {
            font-size: 1.75rem;
            font-weight: 600;
            color: var(--primary);
        }
        .seekers-table {
            width: 100%;
            border-collapse: collapse;
        }
        .seekers-table th {
            background-color: var(--primary);
            color: var(--white);
            padding: 1rem;
            text-align: left;
            font-weight: 500;
        }
        .seekers-table td {
            padding: 1rem;
            border-bottom: 1px solid #e9ecef;
        }
        .seekers-table tr:last-child td {
            border-bottom: none;
        }
        .seekers-table tr:hover {
            background-color: #f8f9fa;
        }
        .no-seekers {
            text-align: center;
            padding: 2rem;
            color: #6c757d;
            font-style: italic;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h2>Registered Job Seekers</h2>
    </div>
    
    <table class="seekers-table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Contact</th>
            </tr>
        </thead>
        <tbody>
            <% if (seekers != null && !seekers.isEmpty()) { %>
                <% for (JobSeeker seeker : seekers) { %>
                <tr>
                    <td><%= seeker.getName() %></td>
                    <td><%= seeker.getEmail() %></td>
                    <td><%= seeker.getContact() %></td>
                </tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td colspan="3" class="no-seekers">No job seekers found</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>