package com.ems;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertServlet
 */
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		int empId = Integer.parseInt(request.getParameter("emp_id"));
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		byte gender = Byte.parseByte(request.getParameter("gender"));
		Double salary = Double.parseDouble(request.getParameter("salary"));
		Date birthdate = Date.valueOf(request.getParameter("birthdate"));

		Connection con1 = DbConnection.getConnection("ems");
		Statement stmt1 = null;

		try {
			// create a SQL statement
			stmt1 = con1.createStatement();
			String query = "Select *from Employee where employeeId = " + empId + "";
			ResultSet rs = stmt1.executeQuery(query);
			if (!rs.next()) {
				Connection con = DbConnection.getConnection("ems");
				try {
					// create statement
					PreparedStatement ps = con.prepareStatement("insert into Employee values(?,?,?,?,?,?)");
					ps.setInt(1, empId);
					ps.setString(2, name);
					ps.setString(3, address);
					ps.setInt(4, gender);
					ps.setDouble(5, salary);
					ps.setDate(6, birthdate);
//					execute query

					int i = ps.executeUpdate();
					if (i > 0) {
						out.print("<h1>Submited</h1>");
						response.sendRedirect("Employee-List.jsp");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
//				close connection
				finally {
					if (con != null) {
						try {
							con.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			} else {
				request.setAttribute("msg", "Warning!: Duplicate Employee ID");
				request.getRequestDispatcher("Employee-Insert.jsp").forward(request, response);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (con1 != null) {
				try {
					con1.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
