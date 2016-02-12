<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index page</title>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="images/favicon.png">

    <title>COBS</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/style.css" rel="stylesheet">

<script type="text/javascript">

function checkinput() 
{
if(document.emailForm.name.value == "") 
{
    alert("please enter name");
    var x = document.emailForm.name.value;
    alert(x);
    return false;
}
else
{
	var x = document.form22.name.value;
	alert(x);
    document.frmMr.submit();
}
}

</script>



</head>
<body data-spy="scroll" data-target="#topnav">

<div class="navbar navbar-inverse navbar-fixed-top" id="topnav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="" alt="" height="17px" /> </a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#home">Home</a></li>
                <li><a href="#services">About Us</a></li>
                <li><a href="#features">Locations</a></li>
                <li><a href="#contact">Contact Us</a></li>
				
				 <li><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
				
            </ul>

        </div>
        <!--/.navbar-collapse -->
    </div>
</div>


<!-- LogIn -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  
  <div class="col-md-offset-4 col-md-3">
	  <div id="log">
	  
	  <center><img src="resources/images/team-member-2.png" alt="" class="img-circle"></center><br><br>
       
     
				<form:form action = "login" method = "POST" commandName="user">
					<div class="control">		
					<form:input path="userName" class="form-control glyphicon glyphicon-user" placeholder="User Name" required="true"/>
					<form:errors path="userName"/>
					</div><br>
					
					<div class="control">
					<form:input type="password" path="password" class="form-control" placeholder="Password" required="true"/>
	                <form:errors path="password"/>
	                </div>
	                <br>
					<center>
					<input type="submit" class="btn btn-default" value="LogIn">
					</center>
				</form:form>
		</div>               
      
  </div> 
</div>
	<!--LogIn_end -->
	
	
<div class="jumbotron" id="home">


    <div class="container">

        <div class="media">
           

            <div class="media-body">
                <div class="col-md-13">
				<center>
                    <h2 class="title"><span>Centralized</span> Outdoor Banner System </h2>

                    <a href="#"  class="btn btn-primary btn-lg active" data-toggle="modal" data-target="#myModal1">Register as Publisher</a>
					
					<a href="#" class="btn btn-success btn-lg active" data-toggle="modal" data-target="#myModal2">Register as Advertiser</a>
					
					</center>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Become A member -->


<div class="modal fade1" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  
  <div class="col-md-offset-5 col-md-3">
  
	  <div id="log">
	  
	  <form:form commandName="user" role="form" action="register" method="POST">
							<div class="form-group">
			   				<img src="resources/images/reg.png">
			   			</div>
							<div class="form-group">	   			
							<form:input type="text" path ="name" id ="name" pattern="[a-zA-Z]*"  maxlength="15" title="Enter a valid name" class = "form-control input-sm" placeholder="Name" required = "true"/>
							<form:errors path="name"/>		
			   			</div>
							<div class="form-group">			
								<form:input  path="userName" pattern="[a-zA-Z0-9]{3,15}" maxlength="15" class="form-control input-sm" placeholder="User Name" required = "true"/>
								<form:errors path="userName"/>
			   			</div>
			   			
			   			<div class="form-group">
			   				<form:input type="email" path= "emailId" name="emailId" id="emailId" class="form-control input-sm" placeholder="Email Address" required="true"/>
								<form:errors path ="emailId"/>
			   			</div>
			   			
			   			
							
							<div class="row">
			   				<div class="col-xs-6 col-sm-6 col-md-6">
			   					<div class="form-group">
										<form:input type="password" pattern="[a-z0-9_-]{6,18}" title="Min password length should be 6 characters." path="password" class="form-control input-sm" placeholder="Password" required = "true"/>
										<form:errors path="password"/>
			   					</div>

			   				</div>
			   				<div class="col-xs-6 col-sm-6 col-md-6">
			   					<div class="form-group">
			   						<form:input type="text" pattern="[0-9]{10}" maxlength="10" path="contactNumber" name="contactNumber" id="contactNumber" class="form-control input-sm" placeholder="Contact Number" required ="true"/>
										<form:errors path ="contactNumber"/>
			   					</div>
			   				</div>
			   			</div>
							
			   			<div class="row">
			   				<div class="col-xs-6 col-sm-6 col-md-6">		   					
									<div class="form-group">
			   						<form:input type="text" path="type" name="type" id="type" class="form-control input-sm" readonly="true" value="Publisher"/>
										<form:errors path ="type"/>
			   					</div>
			   				</div>
			   				<div class="col-xs-6 col-sm-6 col-md-6">
			   					<div class="form-group">
			   						<input type="text"  name="fees" id="fees" class="form-control input-sm" value="$100" readonly="true" placeholder="Fees"/>										
										
			   					</div>
			   				</div>
			   			</div>		
			   			<input type="submit" value="Register" class="btn btn-info btn-block">
			   		</form:form>
			   		</div>
	</div>               
    </div>

	
	<!--LogIn_end publisher-->
	
	<div class="modal fade2" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  
  <div class="col-md-offset-5 col-md-3">
  
	  <div id="log">
	  
	   <form:form commandName="user" role="form" action="register" method="POST">
							<div class="form-group">
			   				<img src="resources/images/reg.png">
			   			</div>
							<div class="form-group">	   			
							<form:input type="text" path ="name" id ="name" pattern="[a-zA-Z]*"  maxlength="15" title="Enter a valid name" class = "form-control input-sm" placeholder="Name" required = "true"/>
							<form:errors path="name"/>		
			   			</div>
							<div class="form-group">			
								<form:input  path="userName" pattern="[a-zA-Z0-9]{3,15}" maxlength="15" class="form-control input-sm" placeholder="User Name" required = "true"/>
								<form:errors path="userName"/>
			   			</div>
			   			
			   			<div class="form-group">
			   				<form:input type="email" path= "emailId" name="emailId" id="emailId" class="form-control input-sm" placeholder="Email Address" required="true"/>
								<form:errors path ="emailId"/>
			   			</div>
			   			
			   			
							
							<div class="row">
			   				<div class="col-xs-6 col-sm-6 col-md-6">
			   					<div class="form-group">
										<form:input type="password" pattern="[a-z0-9_-]{6,18}" title="Min password length should be 6 characters and it contain numbers and - _ only" path="password" class="form-control input-sm" placeholder="Password" required = "true"/>
										<form:errors path="password"/>
			   					</div>

			   				</div>
			   				<div class="col-xs-6 col-sm-6 col-md-6">
			   					<div class="form-group">
			   						<form:input type="text" pattern="[0-9]{10}"  maxlength="10" path="contactNumber" name="contactNumber" id="contactNumber" class="form-control input-sm" placeholder="Contact Number" required ="true"/>
										<form:errors path ="contactNumber"/>
			   					</div>
			   				</div>
			   			</div>
							
			   			<div class="row">
			   				<div class="col-xs-6 col-sm-6 col-md-6">		   					
									<div class="form-group">
			   						<form:input type="text" path="type" name="type" id="type" class="form-control input-sm" readonly="true" value="Advertiser"/>
										<form:errors path ="type"/>
			   					</div>
			   				</div>
			   				<div class="col-xs-6 col-sm-6 col-md-6">
			   					<div class="form-group">
			   						<input type="text"  name="fees" id="fees" class="form-control input-sm" value="$50" readonly="true" placeholder="Fees"/>										
										
			   					</div>
			   				</div>
			   			</div>		
			   			<input type="submit" value="Register" class="btn btn-info btn-block">
			   		</form:form>
			   		</div>
	</div>               
    </div>


	
	<!--LogIn_end advertiser-->

<div class="container" id="services">
    <!-- Example row of columns -->
	<div class="bgimg">
    <div class="row features">
        <div class="col-md-12 text-center">
            <div class="single-fet">
                <h2>OUTDOOR BANNER IS A PLATFORM FOR ADVETISER & PUBLISHER.<br>WE PROVIDE THE SPACE AND SERVICES YOU NEED TO CREATE YOUR LIFE'S WORK</h2>
				
            </div>
        </div>
    </div>
	</div>
</div>


<section class="slider" id="features">
<img src="resources/images/map.png">
</section>

<section class="pricing" id="pricing">

  
    <div class="container">
   
        </div>

</section>


<section class="gray">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="text-center">Tell your projects awesome story.</h3>
            </div>
        </div>
    </div>
</section>
<section class="about" id="clients">
    <div class="dmask">

        <div class="our-clients">
            <div class="container">
                <div class="row">
                    <div class="client" style="background-position: 50% 27px;">
                        <div class="client-logo">
                            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
                                <div class="clients-title">
                                    <h3 class="title">Our <span>Clients</span></h3>

                                    <div class="carousel-controls pull-right">
                                        <a data-slide="prev" href="#client-carousel" class="prev btn-mini"><i
                                                class="icon-angle-left"></i></a>
                                        <a data-slide="next" href="#client-carousel" class="next btn-mini"><i
                                                class="icon-angle-right"></i></a>

                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="row">
                                    <div class="client-carousel slide" id="client-carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d1 animate_start">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="resources/images/logo-1.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d2 animate_start">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="resources/images/logo-2.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d3 animate_start">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="resources/images/logo-3.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d4 animate_start">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="resources/images/logo-4.png" alt="Upportdash"></a></div>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="resources/images/logo-5.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="resources/images/logo-4.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="resources/images/logo-3.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="resources/images/logo-2.png" alt="Upportdash"></a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <!-- Testimonials Widget Start -->
                                <div class="row ">
                                    <div class="testimonials widget">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="testimonials-title">
                                                <h3 class="title">Client <span>Testimonials</span></h3>

                                                <div class="carousel-controls pull-right">
                                                    <a data-slide="prev" href="#testimonials-carousel"
                                                       class="prev btn-mini"><i class="icon-angle-left"></i></a>
                                                    <a data-slide="next" href="#testimonials-carousel"
                                                       class="next btn-mini"><i class="icon-angle-right"></i></a>

                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="testimonials-carousel slide animate_afr d5 animate_start"
                                             id="testimonials-carousel">
                                            <div class="carousel-inner">
                                                <div class="item">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="testimonial item">
                                                            <p>
                                                                Lorem Ipsum is simply dummy text of the printing and
                                                                typesetting industry. Lorem Ipsum has been the
                                                                industry's standard dummy text ever since the 1500s,
                                                                when an unknown printer took a galley of type.
                                                            </p>

                                                            <div class="testimonials-arrow">
                                                            </div>
                                                            <div class="author">
                                                                <div class="testimonial-image "><img
                                                                        src="resources/images/team-member-1.png" alt=""></div>
                                                                <div class="testimonial-author-info">
                                                                    <a style="cursor: pointer;">Jullian cooper</a> COBS
                                                                        Project
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item active">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="testimonial item">
                                                            <p>
                                                                Lorem Ipsum is simply dummy text of the printing and
                                                                typesetting industry. Lorem Ipsum has been the
                                                                industry's standard dummy text ever since the 1500s,
                                                                when an unknown printer took a galley of type.
                                                            </p>

                                                            <div class="testimonials-arrow">
                                                            </div>
                                                            <div class="author">
                                                                <div class="testimonial-image "><img
                                                                        src="resources/images/team-member-2.png" alt=""></div>
                                                                <div class="testimonial-author-info">
                                                                    <a href="#">Bhanu Pratap Singh</a> COBS Project
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="testimonial item">
                                                            <p>
                                                                Lorem Ipsum is simply dummy text of the printing and
                                                                typesetting industry. Lorem Ipsum has been the
                                                                industry's standard dummy text ever since the 1500s,
                                                                when an unknown printer took a galley of type.
                                                            </p>

                                                            <div class="testimonials-arrow">
                                                            </div>
                                                            <div class="author">
                                                                <div class="testimonial-image "><img
                                                                        src="resources/images/team-member-3.png" alt=""></div>
                                                                <div class="testimonial-author-info">
                                                                    <a style="cursor: pointer;">Akash Banginwar</a>
                                                                    COBS Project
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<section class="contact" id="contact">

    <div class="container">

        <div class="row">

            <div class="col-md-6">

                <div class="alert alert-success hidden" id="contactSuccess">
                    <strong>Success!</strong> Your message has been sent to us.
                </div>

                <div class="alert alert-error hidden" id="contactError">
                    <strong>Error!</strong> There was an error sending your message.
                </div>

                <h2 class="short"><strong>Contact</strong> Us</h2>

                <form  name= emailForm method="POST" action="MAILTO:banginwar.aakash@gmail.com" enctype="text/plain">
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label for="name">Name</label>
                            <input type="text" placeholder="" value="" name="name" id="name"
                                   class="form-control input-lg">
                        </div>

                        <div class="col-sm-6 form-group">
                            <label for="email">Email Address</label>
                            <input type="email" placeholder="" value="" name="email" id="email"
                                   class="form-control input-lg">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <label for="message">Message</label>
                            <textarea rows="4" name="message" id="message" class="form-control"></textarea>
                        </div>
                    </div>

                    <button class="btn btn-success btn-xlg" onclick="checkInput();" type="submit">Send Message</button>
                </form>
            </div>
            <div class="col-md-offset-1 col-md-5">
                <br/>
                <h4 class="pull-top">Get in <strong>touch</strong></h4>

                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eget leo at velit imperdiet
                    varius. In eu ipsum vitae velit congue iaculis vitae at risus.</p>

                <hr>

                <h4>The <strong>Office</strong></h4>
                <ul class="unstyled">
                    <li><i class="icon-map-marker"></i> <strong>Address:</strong> 1234 Street Name, City Name, United
                        States
                    </li>
                    <li><i class="icon-phone"></i> <strong>Phone:</strong> (123) 456-7890</li>
                    <li><i class="icon-envelope"></i> <strong>Email:</strong> <a href="mailto:mail@example.com">mail@example.com</a>
                    </li>
                </ul>


            </div>


        </div>

    </div>
	
	
</section>

<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="footer-ribbon" style="right: 0">
                <h3 class="title" style="margin: 0;padding: 5px 10px">Thank <span>You</span></h3>
            </div>

        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <a class="logo" href="index.html">
                        <img src="" alt="">
                    </a>
                </div>
                <div class="col-md-5">
                    <p>&copy; Copyright 2015 by COBS. All Rights Reserved.</p>
                </div>
                <div class="col-md-5">
                    <nav id="footer-menu">
                        <ul>
                            <li><a href="#">FAQ's</a></li>
                            <li><a href="#">Sitemap</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="resources/js/jquery.js"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>