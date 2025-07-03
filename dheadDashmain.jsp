<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<%
    Random rand = new Random();
    int studentCount = rand.nextInt(51);        // 0 to 50
    int totalComplaints = rand.nextInt(51);
    int pendingComplaints = rand.nextInt(51);
    int resolvedComplaints = rand.nextInt(51);
    int inProgressComplaints = rand.nextInt(51);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Department Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
        }

        .dashboard-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .dashboard-box {
            background-color: white;
            width: 200px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .dashboard-box:hover {
            transform: scale(1.05);
        }

        .count {
            font-size: 48px;
            color: #007bff;
            margin: 10px 0;
        }

        .label {
            font-size: 18px;
            color: #333;
        }

        @media (max-width: 600px) {
            .dashboard-box {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<header>Department Dashboard</header>

<div class="dashboard-container">
    <div class="dashboard-box" style="background-color: #e3f2fd;">
        <div class="count" data-target="<%= studentCount %>">0</div>
        <div class="label">Students</div>
    </div>

    <div class="dashboard-box" style="background-color: #ffebee;">
        <div class="count" data-target="<%= totalComplaints %>">0</div>
        <div class="label">Total Complaints</div>
    </div>

    <div class="dashboard-box" style="background-color: #fff3e0;">
        <div class="count" data-target="<%= pendingComplaints %>">0</div>
        <div class="label">Pending</div>
    </div>

    <div class="dashboard-box" style="background-color: #e8f5e9;">
        <div class="count" data-target="<%= resolvedComplaints %>">0</div>
        <div class="label">Resolved</div>
    </div>

    <div class="dashboard-box" style="background-color: #ede7f6;">
        <div class="count" data-target="<%= inProgressComplaints %>">0</div>
        <div class="label">In Progress</div>
    </div>
</div>

<script>
    // Counter animation
    const counters = document.querySelectorAll('.count');
    const speed = 50; // Adjust speed (lower = faster)

    counters.forEach(counter => {
        const updateCount = () => {
            const target = +counter.getAttribute('data-target');
            const count = +counter.innerText;

            // Increment calculation
            const increment = Math.ceil(target / speed);

            if (count < target) {
                counter.innerText = count + increment;
                setTimeout(updateCount, 30);  // Update every 30ms
            } else {
                counter.innerText = target;  // Final value
            }
        };

        updateCount();
    });
</script>

</body>
</html>
