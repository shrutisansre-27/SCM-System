<%@page import="java.sql.*"%>
<%@page import="com.studentmanagement.login.ConnectionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int complaintId = Integer.parseInt(request.getParameter("complaintId"));
    String status = request.getParameter("status");
    String resolutionNotes = request.getParameter("resolutionNotes");

    try (Connection con = ConnectionService.getConnection();
         PreparedStatement pst = con.prepareStatement(
             "UPDATE complaints SET status = ?, resolutionNotes = ?, resolve_date = CURRENT_TIMESTAMP WHERE complaint_id = ?"
         )) {

        pst.setString(1, status);
        pst.setString(2, resolutionNotes);
        pst.setInt(3, complaintId);

        int updatedRows = pst.executeUpdate();
        if (updatedRows > 0) {
            out.println("<p>Complaint updated successfully!</p>");
        } else {
            out.println("<p>Error: Complaint not found or update failed.</p>");
        }
    } catch (SQLException e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
<a href="manageComplaints.jsp">Back to Manage Complaints</a>
