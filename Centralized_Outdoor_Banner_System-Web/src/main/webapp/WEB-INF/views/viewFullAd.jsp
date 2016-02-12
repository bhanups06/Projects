<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>View Ad</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">

    <!--styles sheet -->
    <link href="resources/style.css" rel="stylesheet">
<!--Ajax Head Part Start-->
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<!--Ajax Head Part End-->

</head>

<body data-spy="scroll" data-target="#topnav">
<!--navbar-bar -->
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
                <li class="active"><a href="/controller">Home</a></li>
                <li><a href="#services">About Us</a></li>
                <li><a href="#features">Locations</a></li>
                <li><a href="#contact">Contact Us</a></li>
				<li><a href="/controller/logout" data-toggle="modal">LogOut</a></li>
			</ul>
        </div>
        <!--navbar-bar -->
    </div>
</div>

<section class="gray" id="contact">

    <div class="container">

        <div class="row">
        <div class="col-md-9">
<h1> --Full Advertisement Information-- </h1>

<form action="finalBooking" method="POST"> 
<table class="table">
<tr><td> Available From : </td> <td><input type="text" name="avaiFrom" value=" ${ads.availableFrom}" readonly="true"/><br></td></tr>
<tr><td> Available Till : </td> <td><c:out value=" ${ads.availableTill}"/><br></td></tr>
<tr><td> Length : </td> <td> <c:out value=" ${ads.length}"/><br></td></tr>
<tr><td> Width : </td> <td> <c:out value=" ${ads.width}"/><br></td></tr>
<tr><td> Price per week  : </td> <td> <c:out value=" ${ads.price}"/><br></td></tr>
<tr><td> Type : </td> <td> <c:out value=" ${ads.type}"/><br></td></tr>
<tr><td> Owner : </td> <td> <input type = "text" name="owner" value="${ads.owner}" readonly="true"/><br></td></tr>
<%-- <tr><td> Ad Id : </td> <td> <c:out value=" ${ads.ad_Id}"/><br></td></tr> --%>
<tr><td> AdId: </td> <td> <input type = "text" name="ad_Id" value="${ads.advertisementId}" readonly="true"/><br></td></tr> 
<tr><td> Book for(Weeks) : </td> <td> <select name ="week">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						
					</select><br></td></tr>

</table>
<input type="submit" value="Book"/>
</form>
</div>


</div>
</div>
</section>


<section class="slider" id="features">
<img src="resources/images/map.png">
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
                                                                    <a href="#">Yash Sehgal</a> Project COBS
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
                                                                    <a href="#">Akash Banginwar</a> Project COBS
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
                                                                    <a style="cursor: pointer;">Hitesh Sharma</a>
                                                                    Project COBS
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

                <form class="clearfix" accept-charset="utf-8" method="get" action="#">
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

                    <button class="btn btn-success btn-xlg" type="submit">Send Message</button>
                </form>
            </div>
            <div class="col-md-offset-1 col-md-5">
                <br/>
                <h4 class="pull-top">Get in <strong>touch</strong></h4>

                <span id="test"></span>

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

<script src="js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>


