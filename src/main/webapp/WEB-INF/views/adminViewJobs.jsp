<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.jobskill.model.Job" %>
<%
    List<Job> jobs = (List<Job>) request.getAttribute("jobs");
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Jobs</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --white: #ffffff;
            --light: #f8f9fa;
            --dark: #212529;
            --gray: #6c757d;
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
        .jobs-table tr:last-child td {
            border-bottom: none;
        }
        .jobs-table tr:hover {
            background-color: #f8f9fa;
        }
        .no-jobs {
            text-align: center;
            padding: 2rem;
            color: var(--gray);
            font-style: italic;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h2>All Posted Jobs</h2>
    </div>
    
    <table class="jobs-table">
        <thead>
            <tr>
                <th>Title</th>
                <th>Company</th>
                <th>Location</th>
                <th>Type</th>
                <th>Salary</th>
                <th>Posted By</th>
            </tr>
        </thead>
        <tbody>
            <% if (jobs != null && !jobs.isEmpty()) { %>
                <% for (Job job : jobs) { %>
                <tr>
                    <td><%= job.getTitle() %></td>
                    <td><%= job.getCompanyName() %></td>
                    <td><%= job.getLocation() %></td>
                    <td><%= job.getType() %></td>
                    <td><%= job.getSalary() %></td>
                    <td><%= job.getPostedBy() %></td>
                </tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td colspan="6" class="no-jobs">No jobs found</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>