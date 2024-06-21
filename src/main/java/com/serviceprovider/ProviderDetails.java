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
 * Servlet implementation class ProviderDetails
 */
@WebServlet("/ProviderDetails")
public class ProviderDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		List<serviceprovider> serDetails = ServiceProviderDBUtil.getSerproDetails("2");
		request.setAttribute("serDetails", serDetails);
		
		RequestDispatcher dis = request.getRequestDispatcher("ServiceProfile.jsp");
		dis.forward(request, response);
	}

}
