<%@page import="java.sql.*"%>
<%@page import="com.studentmanagement.login.ConnectionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Students List</title>
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
    </style>
</head>
<body>
    <h2>Students Related to Department Head</h2>
    <table>
        <tr>
        	<th>#</th>
            <th>Student Id</th>
            <th>First Name</th>
            <th>Email</th>
            <th>Department Name</th>
        </tr>
        <%
        int cnt=1;
        int headId = (int) session.getAttribute("head_id"); // Get head_id from request
            String query = "SELECT s.id, s.first_name, s.email, d.name AS department_name " +
                           "FROM students s " +
                           "JOIN department d ON s.department_id = d.department_id " +
                           "JOIN departmenthead dh ON d.head_id = dh.head_id " +
                           "WHERE dh.head_id = ?";

            try (Connection con = ConnectionService.getConnection();
                 PreparedStatement pst = con.prepareStatement(query)) {

                pst.setInt(1, headId); // Setting head_id as parameter

                try (ResultSet rs = pst.executeQuery()) {
                    while (rs.next()) {
        %>
        <tr>
        	<td><%= cnt++ %></td>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("first_name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("department_name") %></td>
        </tr>
        <%
                    }
                }
            } catch (SQLException e) {
                out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</body>
</html>
