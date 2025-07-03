<%@page import="java.sql.*"%>
<%@page import="com.studentmanagement.login.ConnectionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int complaintId = Integer.parseInt(request.getParameter("complaintId"));
    String description = "", status = "", resolutionNotes = "";
    int studentId = 0;
    Timestamp date = null;

    try (Connection con = ConnectionService.getConnection();
         PreparedStatement pst = con.prepareStatement("SELECT * FROM complaints WHERE complaint_id = ?")) {

        pst.setInt(1, complaintId);
        try (ResultSet rs = pst.executeQuery()) {
            if (rs.next()) {
                studentId = rs.getInt("student_id");
                description = rs.getString("description");
                status = rs.getString("status");
                resolutionNotes = rs.getString("resolutionNotes");
                date = rs.getTimestamp("date");
            }
        }
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Complaint Status</title>
    <style>
    
    body {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    margin: 0;
    padding: 20px;
}

h2 {
    text-align: center;
}

.form-div {
    width: 70%;
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #f9f9f9;
    border-radius: 8px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto;
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
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 4px;
}

button:hover {
    background-color: #0056b3;
}

input, textarea, select {
    width: 95%;
    padding: 8px;
    margin: 4px 0;
    border: none;
    box-sizing: border-box;
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
    <h2>Update Complaint Status</h2>
    <div class="form-div">
    	<form method="post" action="saveComplaintStatus.jsp">
    		<input type="hidden" name="complaintId"
    			value="<%= complaintId %>" />
    		<table>
    			<tr>
    				<th>Complaint ID</th>
    				<td>
    					<%=complaintId%>
    				</td>
    			</tr>
    			<tr>
    				<th>Student ID</th>
    				<td>
    					<%=studentId%>
    				</td>
    			</tr>
    			<tr>
    				<th>Description</th>
    				<td>
    					<%=description%>
    				</td>
    			</tr>
    			<tr>
    				<th>Date</th>
    				<td>
    					<%=date%>
    				</td>
    			</tr>
    			<tr>
    				<th>Status</th>
    				<td>
    					<select name="status" required>
    						<option value="Pending"
    							<%= "Pending".equals(status) ? "selected" : "" %>>
    							Pending
    						</option>
    						<option value="In Progress"
    							<%= "In Progress".equals(status) ? "selected" : "" %>>
    							In Progress
    						</option>
    						<option value="Resolved"
    							<%= "Resolved".equals(status) ? "selected" : "" %>>
    							Resolved
    						</option>
    					</select>
    				</td>
    			</tr>
    			<tr>
    				<th>Resolution Notes</th>
    				<td>
    					<textarea name="resolutionNotes" rows="4">
    						<%=resolutionNotes%>
    					</textarea>
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2">
    					<button type="submit">Update Complaint</button>
    				</td>
    			</tr>
    		</table>
    	</form>
    </div>
</body>
</html>
