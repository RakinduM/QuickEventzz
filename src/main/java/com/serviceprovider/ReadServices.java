package com.serviceprovider;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReadServices
 */
@WebServlet("/ReadServices")
public class ReadServices extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("userId");
		
		List<String> servicesList = ServiceProviderDBUtil.retrieveUpdatedServices(userId);
	    request.setAttribute("servicesList", servicesList);
		
	    RequestDispatcher dispatcher = request.getRequestDispatcher("ServiceProfile.jsp");
	    dispatcher.forward(request, response);
		
	}

}
