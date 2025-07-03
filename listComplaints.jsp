<%@page import="java.sql.*"%>
<%@page import="com.studentmanagement.login.ConnectionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>List of Complaints</title>
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
    <h2>Complaints Related to Department Head</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Student ID</th>
            <th>Complaint</th>
            <th>Status</th>
            <th>Date</th>
        </tr>
        <%
        int headId = (int) session.getAttribute("head_id"); // Get head_id from request
        
        out.println("head id"+headId);
			
       /*     String query = "SELECT c.complaint_id, c.student_id, c.description, c.status, c.date " +
                           "FROM complaints c " +
                           "JOIN department d ON c.department_id = d.department_id " +
                           "JOIN departmenthead dh ON d.head_id = dh.head_id " +
                           "WHERE dh.head_id = ? AND c.status = 'Resolved' " ;		*/
                           
                           String query = "SELECT c.complaint_id, c.student_id, c.description, c.status, c.date " +
                                   "FROM complaints c " +
                                   "WHERE c.department_id IN (SELECT d.department_id FROM department d WHERE d.head_id = ?) ";
                                   
            
      
      
   //   SELECT * FROM complaints WHERE department_id IN (SELECT department_id FROM department WHERE head_id = 499);
            
            
            
            

            try (Connection con = ConnectionService.getConnection();
                 PreparedStatement pst = con.prepareStatement(query)) {

                pst.setInt(1, headId); // Setting head_id in the query

                try (ResultSet rs = pst.executeQuery()) {
                    while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("complaint_id") %></td>
            <td><%= rs.getInt("student_id") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getString("status") %></td>
            <td><%= rs.getTimestamp("date") %></td>
        </tr>
        <%
                    }
                }
            } catch (SQLException e) {
                out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</body>
</html>
