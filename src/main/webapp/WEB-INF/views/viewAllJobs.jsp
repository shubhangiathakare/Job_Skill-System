<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.jobskill.model.Job" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Jobs</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f8fc;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 14px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #7209b7;
            color: #fff;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a.button {
            padding: 6px 12px;
            background-color: #f72585;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
    </style>
</head>
<body>

<h2>Available Jobs</h2>

<table>
    <thead>
        <tr>
            <th>Job Title</th>
            <th>Description</th>
            <th>Location</th>
            <th>Type</th>
            <th>Salary</th>
            <th>Company</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    <%
        List<Job> jobList = (List<Job>) request.getAttribute("jobList");
        if (jobList != null && !jobList.isEmpty()) {
            for (Job job : jobList) {
    %>
        <tr>
            <td><%= job.getTitle() %></td>
            <td><%= job.getDescription() %></td>
            <td><%= job.getLocation() %></td>
            <td><%= job.getType() %></td>
            <td><%= job.getSalary() %></td>
            <td><%= job.getCompanyName() %></td>
            <td>
                <form action="applyJob" method="post">
                    <input type="hidden" name="jobId" value="<%= job.getId() %>">
                    <input type="submit" value="Apply">
                </form>
            </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="7">No jobs available.</td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>