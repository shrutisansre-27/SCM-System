<%@page import="java.sql.*"%>
<%@page import="com.studentmanagement.login.ConnectionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Complaints</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        button {
            padding: 5px 10px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        @media (max-width: 600px) {
            table, th, td {
                display: block;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <h2>Manage Complaints</h2>
    <table>
        <tr>
            <th>#</th>
            <th>Complaint ID</th>
            <th>Student ID</th>
            <th>Complaint</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
        int count = 1;
        try (Connection con = ConnectionService.getConnection();
             PreparedStatement pst = con.prepareStatement("SELECT complaint_id, student_id, description, status FROM complaints WHERE status = 'Pending'");
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
        %>
        <tr>
            <td><%= count++ %></td>
            <td><%= rs.getInt("complaint_id") %></td>
            <td><%= rs.getString("student_id") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <form method="get" action="updateComplaintStatus.jsp">
                    <input type="hidden" name="complaintId" value="<%= rs.getInt("complaint_id") %>" />
                    <button type="submit">View To Resolve</button>
                </form>
            </td>
        </tr>
        <%
            }
        } catch (SQLException e) {
            out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
        }
        %>
    </table>
</body>
</html>
