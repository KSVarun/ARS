<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style type="text/css">
.page-footer{
	padding-top:0px;
	color:#4db6ac;
}
.slideshow,
.slideshow:after {
    position: fixed;
    width: 100%;
    height: 100%;
    list-style:none;
    top: 0px;
    left: 0px;
    z-index: 0;
}
.slideshow li span {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0px;
    left: 0px;
    color: transparent;
    background-size: cover;
    background-position: 50% 50%;
    background-repeat: none;
    list-style:none;
    opacity: 0;
    z-index: 0;
	-webkit-backface-visibility: hidden;
    -webkit-animation: imageAnimation 36s linear infinite 0s;
    -moz-animation: imageAnimation 36s linear infinite 0s;
    -o-animation: imageAnimation 36s linear infinite 0s;
    -ms-animation: imageAnimation 36s linear infinite 0s;
    animation: imageAnimation 36s linear infinite 0s;
}
.slideshow li div {
    z-index: 1000;
    position: absolute;
    bottom: 30px;
    left: 0px;
    width: 100%;
    text-align: center;
     list-style:none;
    opacity: 0;
    -webkit-animation: titleAnimation 36s linear infinite 0s;
    -moz-animation: titleAnimation 36s linear infinite 0s;
    -o-animation: titleAnimation 36s linear infinite 0s;
    -ms-animation: titleAnimation 36s linear infinite 0s;
    animation: titleAnimation 36s linear infinite 0s;
}

.slideshow li:nth-child(1) span { background-image: url(https://wallpapercave.com/wp/YZ9U7fs.jpg) }
.slideshow li:nth-child(2) span {
    background-image: url(https://wallpapercave.com/wp/ZtpS25u.jpg);
    -webkit-animation-delay: 6s;
    -moz-animation-delay: 6s;
    -o-animation-delay: 6s;
    -ms-animation-delay: 6s;
    animation-delay: 6s;
}
.slideshow li:nth-child(3) span {
    background-image: url(https://wallpapercave.com/wp/ETHu4kk.jpg);
    -webkit-animation-delay: 12s;
    -moz-animation-delay: 12s;
    -o-animation-delay: 12s;
    -ms-animation-delay: 12s;
    animation-delay: 12s;
}
.slideshow li:nth-child(4) span {
    background-image: url(https://wallpapercave.com/wp/jYrVwgV.jpg);
    -webkit-animation-delay: 18s;
    -moz-animation-delay: 18s;
    -o-animation-delay: 18s;
    -ms-animation-delay: 18s;
    animation-delay: 18s;
}
.slideshow li:nth-child(5) span {
    background-image: url(https://wallpapercave.com/wp/27qzaq7.jpg);
    -webkit-animation-delay: 24s;
    -moz-animation-delay: 24s;
    -o-animation-delay: 24s;
    -ms-animation-delay: 24s;
    animation-delay: 24s;
}
.slideshow li:nth-child(6) span {
    background-image: url(https://wallpapercave.com/wp/CUNCODg.jpg);
    -webkit-animation-delay: 30s;
    -moz-animation-delay: 30s;
    -o-animation-delay: 30s;
    -ms-animation-delay: 30s;
    animation-delay: 30s;
}
.slideshow li:nth-child(2) div {
    -webkit-animation-delay: 6s;
    -moz-animation-delay: 6s;
    -o-animation-delay: 6s;
    -ms-animation-delay: 6s;
    animation-delay: 6s;
}
.slideshow li:nth-child(3) div {
    -webkit-animation-delay: 12s;
    -moz-animation-delay: 12s;
    -o-animation-delay: 12s;
    -ms-animation-delay: 12s;
    animation-delay: 12s;
}
.slideshow li:nth-child(4) div {
    -webkit-animation-delay: 18s;
    -moz-animation-delay: 18s;
    -o-animation-delay: 18s;
    -ms-animation-delay: 18s;
    animation-delay: 18s;
}
.slideshow li:nth-child(5) div {
    -webkit-animation-delay: 24s;
    -moz-animation-delay: 24s;
    -o-animation-delay: 24s;
    -ms-animation-delay: 24s;
    animation-delay: 24s;
}
.slideshow li:nth-child(6) div {
    -webkit-animation-delay: 30s;
    -moz-animation-delay: 30s;
    -o-animation-delay: 30s;
    -ms-animation-delay: 30s;
    animation-delay: 30s;
}
/* Animation for the slideshow images */

@-webkit-keyframes imageAnimation { 
	0% {
	    opacity: 0;
	    -webkit-animation-timing-function: ease-in;
	}
	8% {
	    opacity: 1;
	    -webkit-transform: scale(1.05);
	    -webkit-animation-timing-function: ease-out;
	}
	17% {
	    opacity: 1;
	    -webkit-transform: scale(1.1);
	}
	25% {
	    opacity: 0;
	    -webkit-transform: scale(1.1);
	}
	100% { opacity: 0 }
}
@-moz-keyframes imageAnimation { 
	0% {
	    opacity: 0;
	    -moz-animation-timing-function: ease-in;
	}
	8% {
	    opacity: 1;
	    -moz-transform: scale(1.05);
	    -moz-animation-timing-function: ease-out;
	}
	17% {
	    opacity: 1;
	    -moz-transform: scale(1.1);
	}
	25% {
	    opacity: 0;
	    -moz-transform: scale(1.1);
	}
	100% { opacity: 0 }
}

@-o-keyframes imageAnimation { 
	0% {
	    opacity: 0;
	    -o-animation-timing-function: ease-in;
	}
	8% {
	    opacity: 1;
	    -o-transform: scale(1.05);
	    -o-animation-timing-function: ease-out;
	}
	17% {
	    opacity: 1;
	    -o-transform: scale(1.1);
	}
	25% {
	    opacity: 0;
	    -o-transform: scale(1.1);
	}
	100% { opacity: 0 }
}
@-ms-keyframes imageAnimation { 
	0% {
	    opacity: 0;
	    -ms-animation-timing-function: ease-in;
	}
	8% {
	    opacity: 1;
	    -ms-transform: scale(1.05);
	    -ms-animation-timing-function: ease-out;
	}
	17% {
	    opacity: 1;
	    -ms-transform: scale(1.1);
	}
	25% {
	    opacity: 0;
	    -ms-transform: scale(1.1);
	}
	100% { opacity: 0 }
}

@keyframes imageAnimation { 
	0% {
	    opacity: 0;
	    animation-timing-function: ease-in;
	}
	8% {
	    opacity: 1;
	    transform: scale(1.05);
	    animation-timing-function: ease-out;
	}
	17% {
	    opacity: 1;
	    transform: scale(1.1);
	}
	25% {
	    opacity: 0;
	    transform: scale(1.1);
	}
	100% { opacity: 0 }
}

/* Show at least something when animations not supported */
.no-cssanimations .slideshow li span{
	opacity: 1;
}
@media screen and (max-width: 1140px) { 
	.slideshow li div h3 { font-size: 100px }
}
@media screen and (max-width: 600px) { 
	.slideshow li div h3 { font-size: 50px }
}

body {
	background-color: #f0f0f0;
	margin: 0;
	box-sizing: border-box;
	font-family: 'Roboto', sans-serif;
}

.flex-container {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	flex-wrap: wrap;
}

.flex-items {
	padding: 15px;
	border-radius: 5px;
	height: 350px;
	transition: all 1s ease-in-out;
	transform-origin: top center;
	text-transform: capitalize;
	width: 330px;
	z-index: 3;
}

.flex-items:hover {
	height: 350px;
	transform: scale(1.2);
	box-shadow: 0 7px 29px slategrey;
	z-index: 5;
}

.row {
	padding: 15px;
	display: flex;
	flex-direction: row;
	display: flex;
}

nav ul a {
	margin-right: 10px;
}

nav .brand-logo i, nav .brand-logo [class^="mdi-"], nav .brand-logo [class*="mdi-"],
	nav .brand-logo i.material-icons {
	float: left;
	margin-right: 15px;
	margin-left: 15px;
}
</style>

</head>

<body>
<ul class="slideshow">
  <li><span>Image 01</span></li>
  <li><span>Image 02</span></li>
  <li><span>Image 03</span></li>
  <li><span>Image 04</span></li>
  <li><span>Image 05</span></li>
  <li><span>Image 06</span></li>
</ul>

	<nav>
	<div class="nav-wrapper teal lighten-2">
		<a href="#" class="brand-logo"><i class="material-icons">flight</i>Home</a>
		<ul id="nav-mobile" class="right">
			<li><a href="fetchLoginPage.html">Login</a></li>
		</ul>
	</div>
	</nav>

	<div>
		<img id="imgBanner" src="" slt="" />

		<div class="row">
			<div class="flex-container">
				<div class="col s4">
					<div class="card flex-items">
						<a href="BookTicket.html">
							<div class="card-image">
								<img
									src="https://ak2.picdn.net/shutterstock/videos/9104432/thumb/1.jpg">
							</div>
							<div class="card-content">
								<p>
									<span class="card-title"><strong>Book Ticket</strong></span>Travelling
									to lands far far away, you are at the right place! Book your
									ticket and take your first step to fly high to awesomeness!
								</p>
							</div>
						</a>
					</div>
				</div>
			</div>


			<div class="flex-container">
				<div class="col s4">
					<div class="card flex-items">
						<a href="ViewBooking.html">
							<div class="card-image">
								<img
									src="https://ak2.picdn.net/shutterstock/videos/9104432/thumb/1.jpg">

							</div>
							<div class="card-content">
								<p>
									<span class="card-title"><strong>View Booking</strong></span>Oh!
									You want to check your booking details and see the status of
									your ticket ?
								</p>
							</div>
						</a>
					</div>
				</div>
			</div>

			<div class="flex-container">
				<div class="col s4">
					<div class="card flex-items">
						<a href="CancelBooking.html">
							<div class="card-image">
								<img
									src="https://ak2.picdn.net/shutterstock/videos/9104432/thumb/1.jpg">

							</div>
							<div class="card-content">
								<p>
									<span class="card-title"><strong>Cancel Ticket</strong></span>It's
									sad to see you cancel your ticket! Your journey is not yet over
									you can book and continue to enjoy the awesomeness
								</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>

</body>
</html>