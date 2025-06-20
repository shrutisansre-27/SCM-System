package com.studnetmanagement.login;



import java.io.IOException;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;



import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;



//THis is same as form action

@WebServlet("/loginAdminAction")

public class loginAdminServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;



	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		String email = request.getParameter("emailAdmin");

		String password = request.getParameter("passwordAdmin");



//		 PrintWriter out=response.getWriter();

//		 out.print(email);

//		 out.print(password);

		Connection con = null;

		PreparedStatement pst = null;

		ResultSet rs = null;



		try {

			// Assuming you have JDBC driver in your classpath

			Class.forName("com.mysql.cj.jdbc.Driver"); // Load the driver class



			// Connection parameters

			String url = "jdbc:mysql://localhost:3306/student_complaint_db";

			String dbUser = "root";

			String dbPassword = "";



			// Establish connection

			con = DriverManager.getConnection(url, dbUser, dbPassword);



			// Prepare SQL statement

			String sql = "SELECT user_id, role FROM Users WHERE email = ? AND password = ?";

			pst = con.prepareStatement(sql);

			pst.setString(1, email);

			pst.setString(2, password);



			// Execute the query

			rs = pst.executeQuery();



			if (rs.next()) {

				// User found, login successful

				int userId = rs.getInt("user_id");

				String role = rs.getString("role");



				// Optional: Create a session for the user

				HttpSession session = request.getSession();

				session.setAttribute("userId", userId);

				session.setAttribute("role", role);



				// Redirect based on user role

				if ("superadmin".equals(role)) {

					response.sendRedirect(request.getContextPath() + "/superadmin/superadmindashboard.jsp");

				} else if ("admin".equals(role)) {

					response.sendRedirect("adminDashboard.jsp");

				} else {

					request.setAttribute("errorMessage", "Please select appropriate role.");

					request.getRequestDispatcher("index.jsp").forward(request, response);

				}

			} else {

				// User not found. Redirect to login page with an error.

				request.setAttribute("errorMessage", "Invalid username or password.");

				request.getRequestDispatcher("index.jsp").forward(request, response);

			}

		} catch (Exception e) {

			e.printStackTrace();

			// Handle any errors here.

			request.setAttribute("errorMessage", "An error occurred during login.");

			request.getRequestDispatcher("login2.jsp").forward(request, response);

		} finally {

			// Close resources

			try {

				if (rs != null)

					rs.close();

				if (pst != null)

					pst.close();

				if (con != null)

					con.close();

			} catch (Exception ex) {

				ex.printStackTrace();

			}

		}

	}



	protected void doGet(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		showLogin(request, response);

	}



	public void showLogin(HttpServletRequest request, HttpServletResponse response) {

		// This method should render your login page

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");

		try {

			dispatcher.include(request, response);

		} catch (ServletException | IOException e) {

			e.printStackTrace();

		}

	}

}