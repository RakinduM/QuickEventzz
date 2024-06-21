<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.serviceprovider.ScheduleEvent" %>
<%@ page import="com.serviceprovider.ServiceProviderDBUtil" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Tooplate">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./fullcalendar/lib/main.min.css">
    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./fullcalendar/lib/main.min.js"></script>
    
	<!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" type="text/css" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/tooplate-artxibition.css">
    
    <title>Home</title>
    
    <style>
        :root {
            --bs-success-rgb: 71, 222, 152 !important;
        }

        html,
        body {
            height: 100%;
            width: 100%;
            font-family: Apple Chancery, cursive;
        }

        .btn-info.text-light:hover,
        .btn-info.text-light:focus {
            background: #000;
        }
        table, tbody, td, tfoot, th, thead, tr {
            border-color: #ededed !important;
            border-style: solid;
            border-width: 1px !important;
        }
    </style>

</head>
<body class = "bg-light">
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
	<div class="container py-5" id="page-container">
        <div class="row">
            <div class="col-md-9">
                <div id="calendar"></div>
            </div>
            <div class="col-md-3">
				<div class="cardt rounded-0 shadow">
					<div class="card-header bg-gradient bg-primary text-light">
						<h5 class="card-title">Schedule Form</h5>
					</div>
					<div class="card-body">
						<div class="container-fluid">
							<form action="ScheduleServlet" method="post" id="schedule-form">
								<input type="hidden" name="id" value="">
								<div class="form-group mb-2">
									<label for="title" class="control-label">Title</label> <input
										type="text" class="form-control form-control-sm rounded-0"
										name="title" id="title" required>
								</div>
								<div class="form-group mb-2">
									<label for="description" class="control-label">Description</label>
									<textarea rows="3"
										class="form-control form-control-sm rounded-0"
										name="description" id="description" required></textarea>
								</div>
								<div class="form-group mb-2">
									<label for="start_datetime" class="control-label">Start</label>
									<input type="datetime-local"
										class="form-control form-control-sm rounded-0"
										name="start_datetime" id="start_datetime" required>
								</div>
								<div class="form-group mb-2">
									<label for="end_datetime" class="control-label">End</label> <input
										type="datetime-local"
										class="form-control form-control-sm rounded-0"
										name="end_datetime" id="end_datetime" required>
								</div>

								<div class="card-footer">
									<div class="text-center">
										<button class="btn btn-primary btn-sm rounded-0" type="submit"
											form="schedule-form">
											<i class="fa fa-save"></i> Save
										</button>
										<button class="btn btn-default border btn-sm rounded-0"
											type="reset" form="schedule-form">
											<i class="fa fa-reset"></i> Cancel
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
        </div>
    </div>
    <!-- Event Details Modal -->
    <div class="modal fade" tabindex="-1" data-bs-backdrop="static" id="event-details-modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-0">
                <div class="modal-header rounded-0">
                    <h5 class="modal-title">Schedule Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body rounded-0">
                    <div class="container-fluid">
                        <dl>
                            <dt class="text-muted">Title</dt>
                            <dd id="title" class="fw-bold fs-4"></dd>
                            <dt class="text-muted">Description</dt>
                            <dd id="description" class=""></dd>
                            <dt class="text-muted">Start</dt>
                            <dd id="start" class=""></dd>
                            <dt class="text-muted">End</dt>
                            <dd id="end" class=""></dd>
                        </dl>
                    </div>
                </div>
                <div class="modal-footer rounded-0">
                    <div class="text-end">
                        <button type="button" class="btn btn-primary btn-sm rounded-0" id="edit" data-id="">Edit</button>
                        <form action="DeleteSchedule" id="delete-form">
                        	<input type="hidden" name="id" value="" id="delete-event-id">
                        	<button type="button" class="btn btn-danger btn-sm rounded-0" id="delete" data-id="" name="delete">Delete</button>
                        </form>
                        <button type="button" class="btn btn-secondary btn-sm rounded-0" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Event Details Modal -->
    
    <script>
        var scheds = [
            <%
                
                List<ScheduleEvent> events = ServiceProviderDBUtil.getAllEvents();
                for (ScheduleEvent event : events) {
            %>
                {
                    id: <%= event.getId() %>,
                    title: "<%= event.getTitle() %>",
                    description: "<%= event.getDescription() %>",
                    start_datetime: "<%= event.getStartDateTime() %>",
                    end_datetime: "<%= event.getEndDateTime() %>"
                },
                <%
                }
            %>
        ];
        
        /*function confirmDelete(){
        	var result = confirm("Do you want to delete?");
        	if(result){
        		document.getElementById("delete").submit;
        	}else{
        		
        	}*/
        	
    </script>
    
    
    
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
<script src="./js/script.js"></script>

</html>