package com.serviceprovider;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.serviceprovider.DBConnect;

public class ServiceProviderDBUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;


	public static boolean insertServices(String service) {
		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into services values(0,'"+service+"')";

			int rs = stmt.executeUpdate(sql);

			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}


		return isSuccess;
	}

	public static List<serviceprovider> getSerproDetails(String id){
		int convertedID = Integer.parseInt(id);
		ArrayList<serviceprovider> ser = new ArrayList<>();

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from userdetails where Userid =  '" + convertedID+"'";
			rs = stmt.executeQuery(sql);

			while(rs.next()) {
				int ID = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);

				serviceprovider s = new serviceprovider(ID, name, email, phone);
				ser.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return ser;
	}
	
	
	public static List<String> retrieveUpdatedServices(String userId) {
		
		List<String> services = new ArrayList<>();
		
		
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select service from services where id = '"+userId+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
	            String service = rs.getString("service");
	            services.add(service);
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return services;
	}
	
	public static boolean updateProfile(String newName, String newEmail, String newPhone, String oldName) {
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "Update userdetails set UserName = '"+newName+"', email = '"+newEmail+"', phone = '"+newPhone+"' where UserName = '"+oldName+"'";
						
			int rs = stmt.executeUpdate(sql);   
			    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
		
	}
	
	public static List<ScheduleEvent> getAllEvents() {
        List<ScheduleEvent> events = new ArrayList<>();

        

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM schedule_list";
            ResultSet resultSet = stmt.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String startDateTime = resultSet.getString("start_datetime");
                String endDateTime = resultSet.getString("end_datetime");

                events.add(new ScheduleEvent(id, title, description, startDateTime, endDateTime));
            }

            resultSet.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return events;
    }
	
	
	
}