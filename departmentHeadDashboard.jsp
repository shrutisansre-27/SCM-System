<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.studentmanagement.login.ConnectionService"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DepartmentHead Dashboard</title>

<style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Header */
        .header {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header h1 {
            margin: 0;
            font-size: 1.5rem;
        }

        .header .nav-icons {
            display: flex;
            align-items: center;
        }

        .header .nav-icons a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
            font-size: 1rem;
        }

        .header .nav-icons .notification {
            position: relative;
        }

        .header .nav-icons .notification .badge {
            position: absolute;
            top: -5px;
            right: -10px;
            background: red;
            color: white;
            padding: 3px 6px;
            border-radius: 50%;
            font-size: 0.8rem;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #f4f4f4;
            position: fixed;
            top: 50px;
            left: 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            transform: translateX(0);
            transition: transform 0.3s ease-in-out;
            z-index: 1000;
        }

        .sidebar.closed {
            transform: translateX(-400px);
        }

        .sidebar-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #ddd;
            border-bottom: 1px solid #ccc;
        }

        .sidebar a {
            display: block;
            padding: 15px;
            margin: 5px;
            color: #333;
            text-decoration: none;
            border-radius: 5px;
        }

        .sidebar a:hover {
            background-color: #ddd;
        }

        /* Arrow for Sidebar */
        .sidebar-toggle {
            position: fixed;
            top: 20%;
            left: 0;
            transform: translateY(-50%);
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 0 5px 5px 0;
            padding: 10px;
            cursor: pointer;
            font-size: 1.2rem;
            z-index: 1100;
            display: none;
        }

        .sidebar.closed + .sidebar-toggle {
            display: block;
        }




        /* Main Content */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s ease-in-out;
        }

        .main-content.full {
            margin-left: 0;
        }

        /* iframe */
        iframe {
            width: 100%;
            height: 80vh;
            border: none;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
    </style>


</head>
<body>
<%
    int complaintCount = 0;
try (Connection con = ConnectionService.getConnection();
	     PreparedStatement pst = con.prepareStatement("SELECT COUNT(*) FROM complaints WHERE status = 'Pending' ")) {
					    
	if (con == null) {
	        out.println("<p>Error: Unable to connect to the database. Please try again later.</p>");
	    } else {
	        try (ResultSet rs = pst.executeQuery()) {
	            if (rs.next()) {
	                complaintCount = rs.getInt(1);
	            }
	        }
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	    out.println("<p>Error: " + e.getMessage() + "</p>");
	}

%>


<%
    if (session.getAttribute("head_id") != null) {
        int headId = (int) session.getAttribute("head_id");
       // out.println("Head ID: " + headId);
       // out.println("Head ID: " + session.getAttribute("head_id"));
        
    } else {
        out.println("Head ID not found in session.");
    }
%>


  <!-- Header -->
    <div class="header">
        <h1>Department Dashboard</h1>
        <div class="nav-icons">
            <div class="notification">
            <a href="#">Notifications</a>
            <span class="badge" id="notificationCount"><%= complaintCount %></span> 
        </div>
            <a href="<%= request.getContextPath() %>/logout.jsp">Logout</a>
        </div>
    </div>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <h3>Navigation</h3>
            <button class="toggle-btn" id="sidebarClose">❌</button>
        </div>
         <a href="#" onclick="loadPage('listComplaints.jsp')">View Complaints</a>
    	 <a href="#" onclick="loadPage('manageComplaints.jsp')">Manage Complaints</a>
   		 <a href="#" onclick="loadPage('studentList.jsp')">Student List</a>
   		
    </div>

    <!-- Sidebar Toggle Button -->
    <button class="sidebar-toggle" id="sidebarOpen">→</button>

    <!-- Main Content -->
    <div class="main-content" id="mainContent">
        <iframe id="contentFrame" src="dheadDashmain.jsp"></iframe>
    </div>

    
 <script>
   
    
    
    
    
    
    // Sidebar elements
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('mainContent');
    const sidebarClose = document.getElementById('sidebarClose');
    const sidebarOpen = document.getElementById('sidebarOpen');

    // Close Sidebar
    sidebarClose.addEventListener('click', () => {
        sidebar.classList.add('closed');
        mainContent.classList.add('full');
    });

    // Open Sidebar
    sidebarOpen.addEventListener('click', () => {
        sidebar.classList.remove('closed');
        mainContent.classList.remove('full');
    });

    // Function to load selected page into iframe
    function loadPage(page) {
        document.getElementById('contentFrame').src = page;
    }
    
    
    
    
    

</script>


    
</html>
