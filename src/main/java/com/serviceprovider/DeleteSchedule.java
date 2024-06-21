package com.serviceprovider;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteSchedule
 */
@WebServlet("/DeleteSchedule")
public class DeleteSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String scheduleId = request.getParameter("id");

	        if (scheduleId == null || scheduleId.isEmpty()) {
	            response.getWriter().write("Undefined Schedule ID.");
	            return;
	        }

	        try (Connection con = DBConnect.getConnection()){
	            String deleteQuery = "DELETE FROM schedule_list WHERE id = ?";
	            PreparedStatement preparedStatement = con.prepareStatement(deleteQuery);
	            preparedStatement.setString(1, scheduleId);

	            int rowsAffected = preparedStatement.executeUpdate();

	            if (rowsAffected > 0) {
	                response.getWriter().write("Event has been deleted successfully.");
	            } else {
	                response.getWriter().write("An error occurred.");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.getWriter().write("An error occurred: " + e.getMessage());
	        }
	    }
	
}

