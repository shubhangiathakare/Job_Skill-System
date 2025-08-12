<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post New Job</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .job-form-container {
            background: var(--white);
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            width: 100%;
            max-width: 500px;
        }
        .form-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .form-header h2 {
            font-size: 1.75rem;
            font-weight: 600;
            color: var(--primary);
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #495057;
        }
        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #ced4da;
            border-radius: 6px;
            font-size: 1rem;
        }
        .form-control:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
        }
        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }
        .btn-submit {
            width: 100%;
            padding: 0.75rem;
            background-color: var(--primary);
            color: var(--white);
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-submit:hover {
            background-color: #3a56d4;
        }
    </style>
</head>
<body>
<div class="job-form-container">
    <div class="form-header">
        <h2>Post a New Job</h2>
    </div>
    
    <form action="submitJob" method="post">
        <div class="form-group">
            <label for="title">Job Title</label>
            <input type="text" name="title" id="title" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="description">Job Description</label>
            <textarea name="description" id="description" class="form-control" required></textarea>
        </div>
        
        <div class="form-group">
            <label for="location">Location</label>
            <input type="text" name="location" id="location" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="type">Job Type</label>
            <select name="type" id="type" class="form-control" required>
                <option value="Full-time">Full-time</option>
                <option value="Part-time">Part-time</option>
                <option value="Contract">Contract</option>
                <option value="Remote">Remote</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="salary">Salary (per annum)</label>
            <input type="number" name="salary" id="salary" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="experience">Experience Required (in years)</label>
            <input type="number" name="experience" id="experience" class="form-control" required>
        </div>
        
        <button type="submit" class="btn-submit">Post Job</button>
    </form>
</div>
</body>
</html>