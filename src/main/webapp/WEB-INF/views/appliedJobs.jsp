<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.jobskill.model.AppliedJob" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Applied Jobs</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --white: #ffffff;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4cc9f0;
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
        .jobs-table {
            width: 100%;
            border-collapse: collapse;
        }
        .jobs-table th {
            background-color: var(--primary);
            color: var(--white);
            padding: 1rem;
            text-align: left;
            font-weight: 500;
        }
        .jobs-table td {
            padding: 1rem;
            border-bottom: 1px solid #e9ecef;
        }
        .status-pending {
            color: #ffc107;
            font-weight: 500;
        }
        .status-approved {
            color: var(--success);
            font-weight: 500;
        }
        .no-jobs {
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
        <h2>Applied Jobs</h2>
    </div>
    
    <table class="jobs-table">
        <thead>
            <tr>
                <th>Job Title</th>
                <th>Company</th>
                <th>Location</th>
                <th>Status</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<AppliedJob> appliedJobs = (List<AppliedJob>) request.getAttribute("appliedJobs");
                if (appliedJobs != null && !appliedJobs.isEmpty()) { 
                    for (AppliedJob aj : appliedJobs) { 
            %>
            <tr>
                <td><%= aj.getJobTitle() %></td>
                <td><%= aj.getCompanyName() %></td>
                <td><%= aj.getLocation() %></td>
                <td class="status-<%= aj.getStatus().toLowerCase() %>"><%= aj.getStatus() %></td>
                <td><%= aj.getAppliedDate() %></td>
            </tr>
            <% 
                    } 
                } else { 
            %>
            <tr>
                <td colspan="5" class="no-jobs">No applied jobs found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>