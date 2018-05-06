<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	background-color: rgb(77, 182, 172);
	margin-top:305px;
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

.bix-box {
	width: 300px;
	height: 225px;
	border-radius: 10px;
	box-shadow: 0 3px 10px grey;
	background-color: #ffffff;
	padding: 25px;
	margin-top: -400px;
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

.flex-container1 {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	flex-wrap: wrap;
	margin-top:-350px;
}

.flex-items1 {
	padding: 5px;
	margin: 15px;
	border-radius: 5px;
	height: 290px;
	overflow: hidden;
	transition: all 1s ease-in-out;
	transform-origin: top center;
	text-transform: capitalize;
}

.flex-items1:hover {
	height: 730px;
	transform: scale(1.2);
	z-index: 1000;
	box-shadow: 0 7px 29px slategrey;
}

.row1 {
	padding: 10px;
	display: flex;
	flex-direction: row;
	display: flex;
	border-bottom: solid 1px rgba(0, 0, 0, 0.1);

}

.card-image1 {
	margin: 5px;
	width: 260px;
}

.label1 {
	flex-basis: 165px;
}

.value1 {
	flex-basis: 100px;
}
</style>
</head>
<body>
	<nav>
	<div class="nav-wrapper teal lighten-2">
		<a href="#" class="brand-logo"><i class="material-icons">flight</i>Fetch
			Flight By Date</a>
		<ul id="nav-mobile" class="right">
			<li><a href="showExecutivePage.html">Home</a></li>
		</ul>
	</div>
	</nav>

<div class="flex-container">
		<form:form class="bix-box" action="showFlightsByDate.html"
			method="post" modelAttribute="FlightInformation">
			<div class="row">
				<div class="input-field">
					<form:input path="depDate" id="depDate" class="datepicker" />
					<label for="depDate">Date</label>
				</div>
			</div>
			<button class="waves-effect waves-light btn full-width-btn">
				<input type="submit" name="submit" value="Fetch" />
			</button>
		</form:form>
	</div>

	
		<div class="flex-container1">
		<c:forEach var="flightListByDate" items="${flightListByDate}">
			<div class="flex-items1 card">
				<img class="card-image1"
					src="https://ak2.picdn.net/shutterstock/videos/9104432/thumb/1.jpg" />
				<div class="row1">
					<div class="label1">FlightNumber</div>
					<div class="value1">
						<c:out value="${flightListByDate.flightNo}"></c:out>
					</div>
				</div>
				<div class="row1">
					<div class="label1">AirLine</div>
					<div class="value1">
						<c:out value="${flightListByDate.airline}"></c:out>
					</div>
				</div>
				<div class="row1">
					<div class="label1">DepartureCity</div>
					<div class="value1">
						<c:out value="${flightListByDate.depCity}"></c:out>
					</div>
				</div>
				<div class="row1">
					<div class="label1">ArrivalCity</div>
					<div class="value1">
						<c:out value="${flightListByDate.arrCity}"></c:out>
					</div>
				</div>
				<div class="row1">
					<div class="label1">DepartureDate</div>
					<div class="value1">
						<fmt:formatDate value="${flightListByDate.depDate}" pattern="dd/MM/yyyy" />
					</div>
				</div>
				<div class="row1">
					<div class="label1">ArrivalDate</div>
					<div class="value1">
						<fmt:formatDate value="${flightListByDate.arrDate}" pattern="dd/MM/yyyy" />
					</div>
				</div>
				<div class="row1">
					<div class="label1">DepartureTime</div>
					<div class="value1">
						<c:out value="${flightListByDate.depTime}"></c:out>
					</div>
				</div>
				<div class="row1">
					<div class="label1">ArrivalTime</div>
					<div class="value1">
						<c:out value="${flightListByDate.arrTime}"></c:out>
					</div>
				</div>
				<div class="row1">
					<div class="label1">SeatsCount(FC)</div>
					<div class="value1">
						<c:out value="${flightListByDate.firstSeats}"></c:out>
					</div>
				</div>
				<div class="row1">
					<div class="label1">SeatsFare(FC)</div>
					<div class="value1">
						<c:out value="${flightListByDate.firstSeatsFare}"></c:out>
					</div>
				</div>
				<div class="row1">
					<div class="label1">SeatsCount(BC)</div>
					<div class="value1">
						<c:out value="${flightListByDate.businessSeats}"></c:out>
					</div>
				</div>
				<div class="row1">
					<div class="label1">SeatsFare(BC)</div>
					<div class="value1">
						<c:out value="${flightListByDate.businessSeatsFare}"></c:out>
					</div>
				</div>
			</div>
		</c:forEach>
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
			<script type="text/javascript">
		
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
</script>
	 

</body>
</html>