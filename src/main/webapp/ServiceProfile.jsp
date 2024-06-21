<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" type="text/css" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/tooplate-artxibition.css">

</head>
<body>
	<c:forEach var="ser" items="${serDetails}">
           <c:set var="name" value="${ser.name}"/>
           <c:set var="email" value="${ser.email}"/>
           <c:set var="phone" value="${ser.phone}"/>
                    		
    </c:forEach>
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="index.html" class="logo">Quick<em>Eventzz</em></a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Rent Venue</a></li>
                            <li><a href="#">Shows & Events</a></li> 
                            <li><a href="Home.jsp" class="active">Calendar</a></li>
                            <li><a href="#"><form action="ProviderDetails" method="post"><button type="submit">UserProfile</button></form></a></li>  
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <section style="background-color: #eee;">
        <div class="container py-5">
            

            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
                                alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                            <h5 class="my-3" id="username">${name}</h5>
                            <p class="text-muted mb-1">Service Provider</p>
                            <p class="text-muted mb-4" id = "semail"></p>
                            <div class="d-flex justify-content-center mb-2">
                            	<a href="UpdateProfile.jsp"><button type="button" class="btn btn-primary">Edit Account Details</button></a>
                                
                                <!--<button type="button" class="btn btn-outline-primary ms-1">Message</button>-->
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4 mb-lg-0">
                        <div class="card-body p-0">
                            <ul class="list-group list-group-flush rounded-3">
                                
                                
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fa fa-twitter fa-lg" style="color: #55acee;"></i>
                                    <p class="mb-0">${name}</p>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fa fa-instagram fa-lg" style="color: #ac2bac;"></i>
                                    <p class="mb-0">${name}</p>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fa fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                                    <p class="mb-0">${name}</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card mb-4">
                    	
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Company Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0" id="companyname">${name}</p>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0" id="email">${email}</p>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Phone</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0" id="phone">${phone}</p>
                                    
                                </div>
                            </div>
                            <hr>
                            
                            
                        </div>
                    </div>
                    
                    
                    <div class="events-container">
            			<h1>Services</h1>
            
            <div class="event-container">
	            <c:forEach var="user" items="${userDetails}">
	                        
	            <c:set var="userId" value="${user.id}"/>
	            <c:set var="service" value="${user.service}"/>
	        
	            
	            ${user.id}
	            ${usr.service}
	            
	            
	            </c:forEach>
	            
	            <c:forEach var="details" items="${details}">
	                        
	            <c:set var="userId" value="${details.UseId}"/>
	            <c:set var="username" value="${details.UserName}"/>
	            <c:set var="email" value="${details.email}"/>
	            <c:set var="phone" value="${details.phone}"/>
	        
	            
	            ${details.UseId}
	           	${details.UserName}"
	            ${details.email}"
	           	${details.phone}"
	            
	            
	            </c:forEach>
            	
            	<!-- <C:url value="UpdateEvent.jsp" var="eventUpdate">
            		<C:param name="event_id" value="${event_id}"/>
            		<C:param name="event_name" value="${event_name}"/>
            		<C:param name="event_description" value="${event_description}"/>
            		<C:param name="event_date" value="${event_date}"/>
            		<C:param name="event_timr" value="${event_timr}"/>
            		<C:param name="event_venue" value="${event_venue}"/>
            		<C:param name="event_guests" value="${event_guests}"/>
            		<C:param name="event_organizer" value="${event_organizer}"/>
            	</C:url>-->
            	
           
            	
            	
            </div>
            <%
						try
						{
							Class.forName("com.mysql.jdbc.Driver");
							String url="jdbc:mysql://localhost:3306/serviceprovider";
							String username="root";
							String password="mysql";
							Connection conn=DriverManager.getConnection(url,username,password);
							Statement stmt=conn.createStatement();
							
							
							String query="select * from services";
							
							ResultSet rs=stmt.executeQuery(query);
							while(rs.next())
							{	
							%>	
							<div class="card">
								<div class="image-container">
					                <!-- <img id="event-image" src="images/event-image.jpeg" alt="Event"> <br>-->
					                <li><%=rs.getString(2) %></li><br>
									

							</div>
						
								
						
						
								
							<%
							
							}
							%>
								<%
								rs.close();
								stmt.close();
								conn.close();
								}
							catch(Exception e)
							{
								e.printStackTrace();
								}
						%>
           
            	
             </div>
                    	
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card mb-4 mb-md-0">
                                <div class="card-body">
                                    
                                    
				                                    
                                    <div class="col-sm-9">
                                        <ul id="services-list" class="mb-0">
                                        	
						                                        
                                            
                                        </ul>
                                        <!--<button class="btn btn-primary" onclick="addService()">Add a Service</button>-->
                                    </div>
                                
                                
                                   <!-- <p class="mb-4"><span class="text-primary font-italic me-1">Services</span></p>

                                    <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                    <div class="progress rounded" style="height: 5px;">
                                        <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div> -->
                                    <!-- Add more services sections -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 card mb-4 mb-md-0">
                            <div class="card-body">
                                <form action="ServiceInsert" method="post">
                                    <div class="form-group">
                                        <label for="service">Service Name:</label>
                                        <input type="text" id="service" name="service" class="form-control" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Add a Service</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       </div>
    </section>
    
    <!-- *** Footer *** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="address">
                        <h4>Sunny Hill Festival Address</h4>
                        <span>5 College St NW, <br>Norcross, GA 30071<br>United States</span>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="links">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><a href="#">Info</a></li>
                            <li><a href="#">Venues</a></li>
                            <li><a href="#">Guides</a></li>
                            <li><a href="#">Outreach</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="hours">
                        <h4>Open Hours</h4>
                        <ul>
                            <li>Mon to Fri: 10:00 AM to 8:00 PM</li>
                            <li>Sat - Sun: 11:00 AM to 4:00 PM</li>
                            <li>Holidays: Closed</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="under-footer">
                        <div class="row">
                            <div class="col-lg-6 col-sm-6">
                                <p>S�o Conrado, Rio de Janeiro</p>
                            </div>
                            <div class="col-lg-6 col-sm-6">
                                <p class="copyright">&copy2023 QuickEventzz Company 
                    
                    			<!--<br>Design: <a rel="nofollow" href="https://www.tooplate.com" target="_parent">Tooplate</a></p>-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="sub-footer">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="logo"><span>Quick<em>Eventzz</em></span></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="menu">
                                    <ul>
                                        <li><a href="home.jsp" class="active">Home</a></li>
                                        <li><a href="about.html">About Us</a></li>
                                        <li><a href="rent-venue.html">Rent Venue</a></li>
                                        <li><a href="shows-events.html">Shows & Events</a></li> 
                                        <li><a href="tickets.html">Tickets</a></li> 
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="social-links">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-behance"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    
</body>
</html>
