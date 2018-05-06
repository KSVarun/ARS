-<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
<title>Add New Flight</title>
<style type="text/css">
.flex-container {
	display: flex;
	flex-direction: row;
	justify-content: center;
	flex-wrap: wrap;
	align-items: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.full-width-btn {
	width: 100%;
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
.page-footer .footer-copyright{
	background-color: rgb(77, 182, 172);
}
.box {
	width: 500px;
	height: auto;
	border-radius: 10px;
	box-shadow: 0 3px 10px grey;
	background-color: #ffffff;
	padding: 25px;
	margin-top : 20px;
	margin-bottom:20px;
}

.row {
	margin-bottom: 30px;
}

.full-width-btn {
	width: 100%;
}

.full-width-btn {
	width: 100%;
}
.page-footer{
	padding-top:0px;
	color:#4db6ac;
}

</style>
</head>
<body>
	<nav>
	<div class="nav-wrapper teal lighten-2">
		<a href="#" class="brand-logo"><i class="material-icons">flight</i>Add
			Flight</a>
		<ul id="nav-mobile" class="right">
			<li><a href="adminPage.html">Home</a></li>
		</ul>
	</div>
	</nav>
	<c:if test="${info!=null }">
	<button class=" btn waves-light full-width-btn pulse">
		<span style="color: #ffffff; text-align: center;">${info }</span>
	</button>
	</c:if>
	<div class="flex-container">
		<form:form class="box" id="formTag" action="addFlightDetails.html" method="post"	modelAttribute="FlightInformation">
			<div class="row">
				<div class="input-field">
					<form:input path="flightNo" id="flightNo" class="validate" />
					<label for="flightNo">Flight Number</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field">
					<form:input path="airline" id="airline" class="validate" />
					<label for="airline">Air Line</label>
					<form:errors path="airline" />
				</div>
			
			
				<div class="input-field">
					<form:input path="depCity" id="depCity" class="validate" />
					<label for="depCity">Departure City</label>
					<form:errors path="depCity" />
				</div>
			
				<div class="input-field ">
					<form:input path="arrCity" id="arrCity" class="validate" />
					<label for="arrCity">Arrival City</label>
					<form:errors path="arrCity" />
				</div>
			</div>
			<div class="row">
				<div class="input-field ">
					<form:input path="depDate" id="depDate" class="datepicker" />
					<label for="depDate">Departure Date</label>
					<form:errors path="depDate" />
				</div>
			
			 
				<div class="input-field ">
					<form:input path="arrDate" id="arrDate" class="datepicker" />
					<label for="arrDate">Arrival Date</label>
					<form:errors path="arrDate" />
				</div>
		
			
				<div class="input-field ">
					<form:input path="depTime" id="depTime" class="timepicker" />
					<label for="depTime">Departure Time</label>
					<form:errors path="depTime" />
				</div>
			</div>
			<div class="row">
				<div class="input-field ">
					<form:input path="arrTime" id="arrTime" class="timepicker" />
					<label for="arrTime">Arrival Time</label>
					<form:errors path="arrTime" />
				</div>
			
			
				<div class="input-field ">
					<form:input path="firstSeats" id="firstSeats" class="validate" />
					<label for="firstSeats">First Class Seats</label>
					<form:errors path="firstSeats" />
				</div>
			
			
				<div class="input-field ">
					<form:input path="firstSeatsFare" id="firstSeatsFare" class="validate" />
					<label for="firstSeatsFare">Seats Fare(FC)</label>
					<form:errors path="firstSeatsFare" />
				</div>
			</div>
			<div class="row">
				<div class="input-field ">
					<form:input path="businessSeats" id="businessSeats" class="validate" />
					<label for="businessSeats">Business class seats</label>
					<form:errors path="businessSeats" />
				</div>
			
			
				<div class="input-field ">
					<form:input path="businessSeatsFare" id="businessSeatsFare" class="validate" />
					<label for="businessSeatsFare">Seats Fare(BC)</label>
					<form:errors path="businessSeatsFare" />
				</div>
			</div>
			<button class="waves-effect waves-light btn full-width-btn">
				<input type="submit" name="submit" value="Add Flight" />
			</button>
		</form:form>
	</div>
	<footer class="page-footer">
	<div class="footer-copyright">
		<div class="container">
			© 2017 Copyright  <a class="grey-text text-lighten-4 right"
				href="#!">About Us</a>
		</div>
	</div>
	</footer>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<script type="text/javascript">

	$('#arrDate').pickadate({
		format: 'mm-dd-yyyy',
        startDate: new Date(),
        autoclose: true,
	    selectMonths: true, // Creates a dropdown to control month
	    selectYears: 15, // Creates a dropdown of 15 years to control year,
	    today: 'Today',
	    clear: 'Clear',
	    close: 'Ok',
	    closeOnSelect: false // Close upon selecting a date,
	  });

	$('#depDate').pickadate({
		format: 'mm-dd-yyyy',
        startDate: new Date(),
        autoclose: true,
	    selectMonths: true, // Creates a dropdown to control month
	    selectYears: 15, // Creates a dropdown of 15 years to control year,
	    today: 'Today',
	    clear: 'Clear',
	    close: 'Ok',
	    closeOnSelect: false // Close upon selecting a date,
	  });
	
	$('#formTag').submit(function(e){
		var depDate = new Date($('#depDate').val()).getTime();
		var arrDate = new Date($('#arrDate').val()).getTime();
		var now = new Date();
		now = now.getTime();
		if(now>depDate){
			console.log('inside depDate condition')
			e.preventDefault();
			var depDateEl = $('#depDate')
			depDateEl.addClass('invalid');
			depDateEl.change(function(){
				depDateEl.removeClass('invalid');
				
			});
		}
		if(now>arrDate){
			e.preventDefault();
			console.log('inside arrDate condition') 
			var arrDateEl = $('#arrDate')
			arrDateEl.addClass('invalid');
			arrDateEl.change(function(){
				arrDateEl.removeClass('invalid');
			});
		}
	});
	
	 $('.timepicker').pickatime({
	    default: 'now', // Set default time: 'now', '1:30AM', '16:30'
	    fromnow: 0,       // set default time to * milliseconds from now (using with default = 'now')
	    twelvehour: false, // Use AM/PM or 24-hour format
	    donetext: 'OK', // text for done-button
	    cleartext: 'Clear', // text for clear-button
	    canceltext: 'Cancel', // Text for cancel-button
	    autoclose: false, // automatic close timepicker
	    ampmclickable: true, // make AM PM clickable
	    aftershow: function(){} //Function for after opening timepicker
	  });
	        
	</script>
	
</body>
</html>