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
.page-footer .footer-copyright{
	background-color: rgb(77, 182, 172);
}
.flex-container {
	display: flex;
	flex-direction: row;
	justify-content: center;
	flex-wrap: wrap;
	height: calc(100vh - 70px);
	align-items: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.box {
	width: 500px;
	height: 450px;
	border-radius: 10px;
	box-shadow: 0 3px 10px grey;
	background-color: #ffffff;
	padding: 25px;
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

.row {
	margin-bottom: 30px;
}

.waves-effect input[type="button"], .waves-effect input[type="reset"],
	.waves-effect input[type="submit"] {
	border: 0;
	font-style: normal;
	font-size: inherit;
	text-transform: inherit;
	background: none;
	margin-top: 0px;
}

.full-width-btn {
	width: 100%;
}

input:not ([type] ), input[type=text]:not (.browser-default ), input[type=password]:not
	 (.browser-default ), input[type=email]:not (.browser-default ), input[type=url]:not
	 (.browser-default ), input[type=time]:not (.browser-default ), input[type=date]:not
	 (.browser-default ), input[type=datetime]:not (.browser-default ),
	input[type=datetime-local]:not (.browser-default ), input[type=tel]:not
	 (.browser-default ), input[type=number]:not (.browser-default ), input[type=search]:not
	 (.browser-default ), textarea.materialize-textarea {
	width: 50%;
}

.btn1, .btn-large1 {
	width:50%;
	background-color: #4db6ac;
}

.page-footer {
	padding-top: 0px;
	color: #4db6ac;
}
</style>
</head>
<body>
	<nav>
	<div class="nav-wrapper teal lighten-2">
		<a href="#" class="brand-logo"><i class="material-icons">flight</i>Confirm
			Booking</a>
	</div>
	</nav>
	<button class=" btn waves-light full-width-btn ">
		<span style="color: #ffffff; text-align: center;">You are
			booking flight <b>${flight}</b> from <b>${src}</b> to <b>${dest}</b> </span>
	</button>

	<div class="flex-container">

		<form class="box"
			action="confirmBookingAction.html?flightId=${flight}&src=${src}&dest=${dest}"
			method="post">
			<div class="row">
				<div class="input-field">
					<input id="noOfPassengers" name="noOfPassengers" type="number"
						class="validate" required min="1"> <label for="noOfPassengers">No
						of passengers</label>
				</div>
			</div>
			<div class="row">

				<input class="with-gap" name="classType" type="radio" id="classType"
					value="FirstClass" checked /> <label for="classType">First
					Class</label> <input class="with-gap" name="classType" type="radio"
					id="classType1" value="Business" /> <label for="classType1">Business
					Class</label>

			</div>
			<div class="row">
				<div class="input-field">
					<input id="email" name="email" type="email" class="validate"
						required> <label for="email">Email</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field">
					<input id="creditCard" name="creditCard" type="text"
						class="creditCard" pattern="[0-9]{4}[-][0-9]{4}[-][0-9]{4}[-][0-9]{4}" required> <label
						for="creditCard">Credit Card</label>
				</div>
			</div>
			<button class="waves-effect waves-light btn full-width-btn">
				<input type="submit" name="submit" value="Confirm Book" />
			</button>
		</form>

	</div>
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