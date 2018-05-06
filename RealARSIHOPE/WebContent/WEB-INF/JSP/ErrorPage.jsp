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
<title>Insert title here</title>
<style>
.page-footer{
	padding-top:0px;
	color:#4db6ac;
}
.page-footer .footer-copyright{
	margin-top:270px;
}
body {
	background-color: #f0f0f0;
	margin: 0;
	box-sizing: border-box;
	font-family: 'Roboto', sans-serif;
	
}

nav .brand-logo i, nav .brand-logo [class^="mdi-"], nav .brand-logo [class*="mdi-"],
	nav .brand-logo i.material-icons {
	float: left;
	margin-right: 15px;
	margin-left: 15px;
}

nav ul a {
	margin-right: 10px;
}

.waves-effect input[type="button"], .waves-effect input[type="reset"],
	.waves-effect input[type="submit"] {
	border: 0;
	font-style: normal;
	font-size: inherit;
	text-transform: inherit;
	background: none;
	margin-top: 10px;
	
}

.full-width-btn {
	width: 40%;
	margin-top:100px;
	margin-left:500px;
	height:450px;
	color:#f44336;
	
}

.btn, .btn-large{
	background-color:#ee6e73;
}

.btn:hover, .btn-large:hover {
    background-color: #ee6e73;
}
</style>
</head>
<body>
	<nav>
	<div class="nav-wrapper">
		<a href="#" class="brand-logo"><i class="material-icons">flight</i>Error</a>
		<ul id="nav-mobile" class="right">
		</ul>
	</div>
	</nav>
	<button class="waves-effect waves btn full-width-btn">
	<span style="color:#ffffff;text-align:center;">Something Went Wrong</span><br/> 
				<span style="color:#ffffff;text-align:center;">Reason</span><br/>
				<span style="color:#ffffff;text-align:center;"><b>${errMsg }</b></span>
			</button>
	<footer class="page-footer">
	<div class="footer-copyright">
		<div class="container">
			© 2017 Copyright <a class="grey-text text-lighten-4 right"
				href="#!">About Us</a>
		</div>
	</div>
	</footer>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</body>
</html>