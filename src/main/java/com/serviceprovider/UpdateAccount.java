package com.serviceprovider;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateAccount
 */
@WebServlet("/UpdateAccount")
public class UpdateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oldName = request.getParameter("oldName");
		String newName = request.getParameter("newName");
        String newEmail = request.getParameter("email");
        String newPhone = request.getParameter("phone");
	     try {
	            
	            
	            boolean isTrue;
	            
		        isTrue = ServiceProviderDBUtil.updateProfile(newName, newEmail, newPhone, oldName);
		        if(isTrue == true) {
		        	
		        	List<serviceprovider> serDetails = ServiceProviderDBUtil.getSerproDetails("2");
		    		request.setAttribute("serDetails", serDetails);
		    		
		    		RequestDispatcher dis = request.getRequestDispatcher("ServiceProfile.jsp");
		    		dis.forward(request, response);
		        }else {
		        	RequestDispatcher dis2 = request.getRequestDispatcher("success.jsp");
		        	dis2.forward(request, response);
		        }
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}	
	
		
	
		     

  
	     
	     


