<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
   <!-- <link rel="stylesheet" href="./css/index.css">  Ensure correct path -->
   
    <link rel="stylesheet" href="./css/navbar.css"> <!-- Ensure correct path -->
	 <link rel="stylesheet" type="text/css" href="css2/bootstrap.css"/>
    <link href="css2/style.css" rel="stylesheet"/>
    <link href="css2/responsive.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>
<body>

 <% 
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) { %>
    <script type="text/javascript">
        alert("<%= errorMessage %>");.
    </script>
<% } %>
<header>
		<nav>
    <!-- Chec-kbox for toggling menu -->
    <input type="checkbox" id="check">
      
    <!-- Menu icon -->
    <label for="check" class="checkbtn">
      <i class="fas fa-bars"></i>
    </label>

    <!-- Site logo -->
    <label class="logo">MyWebsite</label>

    <!-- Navigation links (for large screens) -->
    <ul class="desktop-menu">
      <li><a  href="index.jsp">Home</a></li>
      <li><a href="#aboutus">About Us</a></li>
      <li><a href="#services">Services</a></li>
      <li><a href="#contactus">Contact Us</a></li>
      <%
                // Use the existing session reference instead of redeclaring
                if (request.getSession(false) != null && request.getSession(false).getAttribute("userId") != null) {
                    // User is logged in
            %>
      <li>
      	<a href="logout.jsp">Logout</a>
      </li>
      <%
                } else {
                    // User is not logged in
            %>
      <li>
      	<a href="login.jsp">Login</a>
      </li>
      <%
        }%>
    </ul>

    <!-- Navigation links (for small screens) -->
    <ul class="mobile-menu">
      <li><a href="#">Profile</a></li>
      <li><a href="#">Dash-board</a></li>
      <li><a href="#">Settings</a></li>
      <%
                // Use the existing session reference instead of redeclaring
                if (request.getSession(false) != null && request.getSession(false).getAttribute("userId") != null) {
                    // User is logged in
            %>
      <li>
      	<a href="logout.jsp">Logout</a>
      </li>
      <%
                } else {
        %>
      <li>
      	<a href="login.jsp">Login</a>
      </li>
      <%}%>
    </ul>
  </nav>
</header>



  
    
    
    
    
    
    

 <div class="hero_area">

  <section class=" slider_section ">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active">01</li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1">02</li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2">03</li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="container">
                <div class="row">
                  <div class="col-lg-5 col-md-6"> 
    <div class="slider_detail-box">
        <h1>
            Efficient <br/>
            Complaint Resolution <br/>
            for Students
        </h1>
        <p>
            Streamline the complaint process with our easy-to-use platform. Submit concerns, track progress, and receive timely resolutions.
        </p>
        <div class="btn-box">
            <a href="" class="btn-1">
                Learn More
            </a>
        </div>
    </div>
</div>

  <div class="col-md-6">
    <div class="slider_img-box">
     	<img src="images/slider-img.png" alt=""/>
    </div>
  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="container">
                <div class="row">
                  <div class="col-lg-5 col-md-6"> 
    <div class="slider_detail-box">
        <h1>
            Your Voice <br/>
            Matters – <br/>
            We Listen!
        </h1>
        <p>
            A dedicated system to address student concerns quickly and efficiently. Report issues, receive updates, and get solutions seamlessly.
        </p>
        <div class="btn-box">
            <a href="" class="btn-1">
                Get Started
            </a>
        </div>
    </div>
</div>

                  <div class="col-md-6">
                    <div class="slider_img-box">
                      <img src="images/slider-img.png" alt=""/>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="container">
                <div class="row">
                  <div class="col-lg-5 col-md-6"> 
    <div class="slider_detail-box">
        <h1>
            Transparent <br/>
            Complaint Handling <br/>
            for Students
        </h1>
        <p>
            Ensuring fair and prompt resolutions to student complaints. A secure and transparent platform designed to enhance student satisfaction.
        </p>
        <div class="btn-box">
            <a href="" class="btn-1">
                Explore Now
            </a>
        </div>
    </div>
</div>

                  <div class="col-md-6">
                    <div class="slider_img-box">
                      <img src="images/slider-img.png" alt=""/>
                   	</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="carousel_btn-container">
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
      </section>
   
      
</div>

 <!-- welcome section -->
  <section class="welcome_section layout_padding" id="aboutus">
    <div class="container">
      <div class="custom_heading-container">
        <h2>
          Welcome To Our Company
        </h2>
      </div>
      <div class="layout_padding2">
        <div class="img-box">
          <img src="images/welcome.png" alt=""/>
        </div>
        <div class="detail-box">
          <p>
           We are committed to providing a seam-less and efficient platform for students to voice their concerns.
          	  
           Whether it's academic issues, facility complaints, or administrative queries, our system ensures a quick, 
            
           transparent, and hassle-free resolution process.
          </p>
          <div>
            <a href="">
              Read More
            </a>
          </div>
        </div>
      </div>

    </div>
  </section>
  <!-- end welcome section -->


<!-- service section -->
<section class="service_section" id="services">
    <div class="container">
        <div class="custom_heading-container">
            <h2>
                Our Services
            </h2>
        </div>
        <div class="service_container layout_padding2">
            <div class="service_box">
                <div class="img-box">
                    <img src="images/s-1.jpg" alt=""/>
                </div>
                <div class="detail-box">
                    <h4>
                        Easy Complaint <br/>
                        Submission
                    </h4>
                    <p>
                        Students can quickly submit complaints through a simple and intuitive interface. Categorize issues and provide details for faster resolution.
                    </p>
                </div>
            </div>
            <div class="service_box">
                <div class="img-box">
                    <img src="images/s-2.jpg" alt=""/>
                </div>
                <div class="detail-box">
                    <h4>
                        Real-Time <br/>
                        Tracking
                    </h4>
                    <p>
                        Track the status of your complaints in real time. Get updates on progress, responses, and resolutions from the administration.
                    </p>
                </div>
            </div>
            
            <div class="service_box">
                <div class="img-box">
                    <img src="images/s-3.jpg" alt=""/>
                </div>
                <div class="detail-box">
                    <h4>
                        Quick and <br/>
                        Efficient Resolution
                    </h4>
                    <p>
                        Our system ensures timely responses and resolutions. We work closely with institutions to address concerns effectively.
                    </p>
                </div>
            </div>
        </div>
        <div>
            <a href="">
                Read More
            </a>
        </div>
    </div>
</section>
<!-- end service section -->


<!-- Connect With Us Section 
<section id="connect" class="connect">
    <div class="connect-container">
        <div class="connect-content">
            
            <div class="form-container">
                <h2>Connect With Us</h2>
                <form>
                    <input type="text" placeholder="Your Name" required>
                    <input type="email" placeholder="Your Email" required>
                    <textarea placeholder="Your Message" required></textarea>
                    <button type="submit">Submit</button>
                </form>
            </div>
           
        </div>
    </div>
</section> -->

<div id="contactus">
<%@ include file="contactus.jsp" %>
</div>


   <!-- <footer class="footer">
        <div>© 2024 Your Platform Name. All Rights Reserved.</div>
        <div>
            <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a> | <a href="#">Help Center</a>
        </div>
    </footer>
    -->
 <script>
 const checkBtn = document.querySelector(".checkbtn");
 const checkInput = document.getElementById("check");

 checkBtn.addEventListener("click", () => {
     if (checkInput.checked) {
         checkBtn.innerHTML = '<i class="fas fa-bars"></i>'; // Menu icon
     } else {
         checkBtn.innerHTML = '<i class="fas fa-times"></i>'; // Close icon
     }
 });

 checkInput.addEventListener("change", () => {
     if (checkInput.checked) {
         checkBtn.innerHTML = '<i class="fas fa-times"></i>'; // Close icon
     } else {
         checkBtn.innerHTML = '<i class="fas fa-bars"></i>'; // Menu icon
     }
 });
  </script>




    	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
