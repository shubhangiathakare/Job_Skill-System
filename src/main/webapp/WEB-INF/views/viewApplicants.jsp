<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.jobskill.model.AppliedJob" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Applicants</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
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
            background-color: #4361ee;
            color: #fff;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        select, button {
            padding: 6px 10px;
            font-family: inherit;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .update-form {
            display: flex;
            justify-content: center;
            gap: 8px;
        }
    </style>
</head>
<body>
    <h2>Applicants</h2>

    <table>
        <thead>
            <tr>
                <th>Applicant Email</th>
                <th>Job Title</th>
                <th>Company</th>
                <th>Location</th>
                <th>Status</th>
                <th>Applied Date</th>
                <th>Update Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<AppliedJob> applicants = (List<AppliedJob>) request.getAttribute("applicants");
                if (applicants != null) {
                    for (AppliedJob a : applicants) {
            %>
            <tr>
                <td><%= a.getJobSeekerEmail() %></td>
                <td><%= a.getJobTitle() %></td>
                <td><%= a.getCompanyName() %></td>
                <td><%= a.getLocation() %></td>
                <td><%= a.getStatus() %></td>
                <td><%= a.getAppliedDate() %></td>
                <td>
                    <form class="update-form" action="updateStatus" method="post">
                        <input type="hidden" name="applicationId" value="<%= a.getId() %>"/>
                        <input type="hidden" name="jobId" value="<%= a.getJobId() %>"/>
                        <select name="status">
                            <option value="Pending" <%= "Pending".equals(a.getStatus()) ? "selected" : "" %>>Pending</option>
                            <option value="Accepted" <%= "Accepted".equals(a.getStatus()) ? "selected" : "" %>>Accepted</option>
                            <option value="Rejected" <%= "Rejected".equals(a.getStatus()) ? "selected" : "" %>>Rejected</option>
                        </select>
                        <button type="submit">Update</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr><td colspan="7">No applicants found.</td></tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
