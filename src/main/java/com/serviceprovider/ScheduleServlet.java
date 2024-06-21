package com.serviceprovider;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ScheduleServlet
 */
@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
        String description = request.getParameter("description");
        String startDatetime = request.getParameter("start_datetime");
        String endDatetime = request.getParameter("end_datetime");
        String id = request.getParameter("id");
        
        
        
        String inputDateTime = startDatetime;
        String inputEndDateTime = endDatetime;
        
        // Define the input pattern
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        
        // Define the output pattern
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        // Parse the input string
        LocalDateTime dateTime = LocalDateTime.parse(inputDateTime, inputFormatter);
        LocalDateTime endDateTime = LocalDateTime.parse(inputEndDateTime, inputFormatter);
        
        // Format the parsed date-time to the desired format
        String formattedDateTime = dateTime.format(outputFormatter);
        String formattedEndDateTime = endDateTime.format(outputFormatter);

        Connection conn = DBConnect.getConnection();

        try {
            if (conn == null) {
                // Handle database connection error
                response.sendRedirect("./error.jsp"); // Create an error page
                return;
            }

            String sql;
            if (id == null || id.isEmpty()) {
                sql = "INSERT INTO schedule_list (title, description, start_datetime, end_datetime) VALUES (?, ?, ?, ?)";
            } else {
                sql = "UPDATE schedule_list SET title = ?, description = ?, start_datetime = ?, end_datetime = ? WHERE id = ?";
            }

            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setTimestamp(3, Timestamp.valueOf(formattedDateTime));
            preparedStatement.setTimestamp(4, Timestamp.valueOf(formattedEndDateTime));
            
            if (id != null && !id.isEmpty()) {
                preparedStatement.setString(5, id);
            }

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("./Home.jsp"); // Create a success page
            } else {
                // Handle database update error
                response.sendRedirect("./error.jsp"); // Create an error page
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database error
            response.sendRedirect("./error.jsp"); // Create an error page
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}

}
