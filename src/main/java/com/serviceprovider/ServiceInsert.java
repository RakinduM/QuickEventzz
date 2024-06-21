package com.serviceprovider;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServiceInsert
 */
@WebServlet("/ServiceInsert")
public class ServiceInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String service = request.getParameter("service");

		boolean isTrue;

		isTrue = ServiceProviderDBUtil.insertServices(service);

		if(isTrue) {
			RequestDispatcher dis = request.getRequestDispatcher("ServiceProfile.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("ServiceProfile.jsp");
			dis2.forward(request, response);
		}
		
	}

}
