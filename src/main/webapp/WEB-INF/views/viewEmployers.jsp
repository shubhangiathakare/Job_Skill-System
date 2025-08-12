<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.jobskill.model.Employer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Employers</title>
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
            margin: 0;
            padding: 2rem;
            color: #212529;
        }
        .employers-container {
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
        .employers-table {
            width: 100%;
            border-collapse: collapse;
        }
        .employers-table th {
            background-color: var(--primary);
            color: var(--white);
            padding: 1rem;
            text-align: left;
            font-weight: 500;
        }
        .employers-table td {
            padding: 1rem;
            border-bottom: 1px solid #e9ecef;
        }
        .employers-table tr:last-child td {
            border-bottom: none;
        }
        .employers-table tr:hover {
            background-color: #f8f9fa;
        }
        .no-employers {
            text-align: center;
            padding: 2rem;
            color: #6c757d;
            font-style: italic;
        }
    </style>
</head>
<body>
<div class="employers-container">
    <div class="page-header">
        <h2>List of Employers</h2>
    </div>
    
    <table class="employers-table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Company Name</th>
                <th>Contact</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Employer> viewEmployers = (List<Employer>) request.getAttribute("viewEmployers");
                if (viewEmployers != null && !viewEmployers.isEmpty()) {
                    for (Employer e : viewEmployers) {
            %>
            <tr>
                <td><%= e.getName() %></td>
                <td><%= e.getCompanyname() %></td>
                <td><%= e.getContact() %></td>
                <td><%= e.getEmail() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4" class="no-employers">No employers found</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>