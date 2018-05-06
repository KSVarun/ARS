<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.page-footer{
	padding-top:0px;
	color:#4db6ac;
}
.page-footer .footer-copyright{
	background-color: rgb(77, 182, 172);
	margin-top:300px;
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
	padding: 5px;
	margin: 15px;
	border-radius: 5px;
	height: 290px;
	overflow: hidden;
	transition: all 1s ease-in-out;
	transform-origin: top center;
	text-transform: capitalize;
}

.flex-items:hover {
	height: 960px;
	transform: scale(1.2);
	z-index: 1000;
	box-shadow: 0 7px 29px slategrey;
}

.row {
	padding: 10px;
	display: flex;
	flex-direction: row;
	display: flex;
	border-bottom: solid 1px rgba(0, 0, 0, 0.1);
}

.card-image {
	margin: 5px;
	width: 260px;
}

.label {
	flex-basis: 165px;
}

.value {
	flex-basis: 100px;
}

nav .brand-logo i, nav .brand-logo [class^="mdi-"], nav .brand-logo [class*="mdi-"], nav .brand-logo i.material-icons {
    float: left;
    margin-right: 15px;
    margin-left: 15px;
}
nav ul a{
	margin-right:10px;
}
</style>
</head>
<body>
	<nav>
	<div class="nav-wrapper teal lighten-2">
		<a href="#" class="brand-logo"><i class="material-icons">flight</i>Flight List</a>
		<ul id="nav-mobile" class="right">
			<li><a href="adminPage.html">Home</a></li>
		</ul>
	</div>
	</nav>
	
	<div class="flex-container">
		<c:forEach var="flightInfo" items="${flightInfo}">
			<div class="flex-items card">
				<img class="card-image"
					src="https://ak2.picdn.net/shutterstock/videos/9104432/thumb/1.jpg" />
				<div class="row">
					<div class="label">FlightNumber</div>
					<div class="value">
						<c:out value="${flightInfo.flightNo}"></c:out>
					</div>
				</div>
				<div class="row">
					<div class="label">AirLine</div>
					<div class="value">
						<c:out value="${flightInfo.airline}"></c:out>
					</div>
				</div>
				<div class="row">
					<div class="label">DepartureCity</div>
					<div class="value">
						<c:out value="${flightInfo.depCity}"></c:out>
					</div>
				</div>
				<div class="row">
					<div class="label">ArrivalCity</div>
					<div class="value">
						<c:out value="${flightInfo.arrCity}"></c:out>
					</div>
				</div>
				<div class="row">
					<div class="label">DepartureDate</div>
					<div class="value">
						<fmt:formatDate value="${flightInfo.depDate}" pattern="dd/MM/yyyy" />
					</div>
				</div>
				<div class="row">
					<div class="label">ArrivalDate</div>
					<div class="value">
							<fmt:formatDate value="${flightInfo.arrDate}" pattern="dd/MM/yyyy" />
					</div>
				</div>
				<div class="row">
					<div class="label">DepartureTime</div>
					<div class="value">
						<c:out value="${flightInfo.depTime}"></c:out>
					</div>
				</div>
				<div class="row">
					<div class="label">ArrivalTime</div>
					<div class="value">
						<c:out value="${flightInfo.arrTime}"></c:out>
					</div>
				</div>
				<div class="row">
					<div class="label">SeatsCount(FC)</div>
					<div class="value">
						<c:out value="${flightInfo.firstSeats}"></c:out>
					</div>
				</div>
				<div class="row">
					<div class="label">SeatsFare(FC)</div>
					<div class="value">
						<c:out value="${flightInfo.firstSeatsFare}"></c:out>
					</div>
				</div>
				<div class="row">
					<div class="label">SeatsCount(BC)</div>
					<div class="value">
						<c:out value="${flightInfo.businessSeats}"></c:out>
					</div>
				</div>
				<div class="row">
					<div class="label">SeatsFare(BC)</div>
					<div class="value">
						<c:out value="${flightInfo.businessSeatsFare}"></c:out>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>

</body>
</html>