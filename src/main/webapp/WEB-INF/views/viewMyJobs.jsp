<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.jobskill.model.Job" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Posted Jobs</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --white: #ffffff;
            --light: #f8f9fa;
            --success: #4cc9f0;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: var(--light);
            margin: 0;
            padding: 2rem;
            color: #212529;
        }
        .jobs-container {
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
        .jobs-table tr:last-child td {
            border-bottom: none;
        }
        .jobs-table tr:hover {
            background-color: #f8f9fa;
        }
        .btn-applicants {
            padding: 0.5rem 1rem;
            background-color: var(--success);
            color: var(--white);
            border: none;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s;
            display: inline-block;
        }
        .btn-applicants:hover {
            background-color: #3aa8d4;
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
<div class="jobs-container">
    <div class="page-header">
        <h2>Jobs Posted by You</h2>
    </div>
    
    <%
        List<Job> myJobs = (List<Job>) request.getAttribute("myJobs");
        if (myJobs == null || myJobs.isEmpty()) {
    %>
        <p class="no-jobs">No jobs posted yet.</p>
    <%
        } else {
    %>
        <table class="jobs-table">
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Location</th>
                <th>Type</th>
                <th>Salary</th>
                <th>Company</th>
                <th>Applicants</th>
            </tr>
            <%
                for (Job job : myJobs) {
            %>
            <tr>
                <td><%= job.getTitle() %></td>
                <td><%= job.getDescription() %></td>
                <td><%= job.getLocation() %></td>
                <td><%= job.getType() %></td>
                <td><%= job.getSalary() %></td>
                <td><%= job.getCompanyName() %></td>
                <td>
                    <a href="viewApplicants?jobId=<%= job.getId() %>" class="btn-applicants">View Applicants</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>
</div>
</body>
</html>