<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <title>Sign Up Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <!-- Include Bootstrap via CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" type="text/css" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/tooplate-artxibition.css">
    
    <style type="text/css">
		*{
   			box-sizing: border-box;
   			font-family: "Merriweather Sans", sans-serif;
	}

	body{
	   background-color: #B0DBEE;
	   padding-bottom: 2px;
	   
	   #form{
	      color: white;
	      background-color: #009EDF;
	      border-radius: 5px;
	      
	      width: 400px;
	      padding: 40px;
	      margin: 150px auto;
	      
	      -webkit-box-shadow: -1px 3px 18px 0px rgba(0,0,0,0.75);
	      -moz-box-shadow: -1px 3px 18px 0px rgba(0,0,0,0.75);
	      box-shadow: -1px 3px 18px 0px rgba(0,0,0,0.75);
	      
	      p{
	         font-size: 0.9em;
	 	}
      
      button{
         width: 100%;
         text-align: center;
         color: grey;
         margin-top: 20px;
         border: 1px solid rgba(0,0,0,0.4);
      }
      
      .form-group{
         margin: 15px auto;
           
         label{
            font-weight: bold;
            font-size: 0.9em;
         }
         
         .input-group{
            border-radius: 5px;
            -webkit-box-shadow: -1px 3px 18px 0px rgba(0,0,0,0.35);
            -moz-box-shadow: -1px 3px 18px 0px rgba(0,0,0,0.35);
            box-shadow: -1px 3px 18px 0px rgba(0,0,0,0.35);
            
            .input-group-addon{
               border: none;
               border-right: 1px solid rgba(0,0,0,0.2);
            }
            
            input{
               padding-left: 10px;
            }
            
            i{
               color: #009EDF;
            }
         }
         
         input{
            padding: 3px;
            width: 100%;
            border: none;
            border-radius: 0 5px 5px 0;
         		}
      		}
   		}
	}    
    </style>
</head>
<body>
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
	
	<form id="form" method="post" action="UpdateAccount">
        <p>Update Account Info</p>
        
        <div class="form-group">
            <label for="name">Your Old username</label>
            <br />
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></div>
                <input type="text" id="oldName" name="oldName" placeholder="Enter Your Name" />
            </div>
        </div>

        <div class="form-group">
            <label for="name">Your New username</label>
            <br />
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></div>
                <input type="text" id="newName" name = "newName" placeholder="Enter Your Name" />
            </div>
        </div>

        <div class="form-group">
            <label for="email">Your Email</label>
            <br />
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                <input type="email" id="email" name= "email" placeholder="Enter Your Email" />
            </div>
        </div>

        <div class="form-group">
            <label for="phone">Your Phone Number</label>
            <br />
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-users" aria-hidden="true"></i></div>
                <input type="tel" id="phone" name = "phone" placeholder="Enter 10 digits phone number" pattern="[0-9]{3}[0-9]{3}[0-9]{4}"/>
            </div>
        </div>

        

        <button type="submit" class="btn btn-primary">Update</button>
    </form>
    
</body>
</body>
</html>