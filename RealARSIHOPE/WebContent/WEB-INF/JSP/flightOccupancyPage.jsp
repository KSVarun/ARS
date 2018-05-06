<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	margin-top:-40px;
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
.flex-container1 {
	display: flex;
	flex-direction: row;
	justify-content: center;
	flex-wrap: wrap;
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
	margin-top: -305px;
}

.bix-box1 {
	width: 500px;
	height: 100px;
	border-radius: 10px;
	box-shadow: 0 3px 10px grey;
	background-color: #ffffff;
	padding: 50px; 
	margin-top:-450px;
	
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

</style>
</head>
<body>
	<nav>
	<div class="nav-wrapper teal lighten-2">
		<a href="#" class="brand-logo"><i class="material-icons">flight</i>Flight Occupancy</a>
		<ul id="nav-mobile" class="right">
			<li><a href="showExecutivePage.html">Home</a></li>
		</ul>
	</div>
	</nav>
	<div class="flex-container">

		<form class="bix-box" action="fetchFlightOccupancy.html" method="post">
			<div class="row">
				<div class="input-field">
					<input id="flightNo" name="flightNo" type="number" class="validate"
						required> <label for="flightNo">Flight Number</label>
				</div>
			</div>
			<button class="waves-effect waves-light btn full-width-btn">
				<input type="submit" name="submit" value="Fetch" />
			</button>
		</form>
	</div>	
	<div class="flex-container1">
	<c:if test="${flightInfo != null}">
		<table class="bordered bix-box1">
        <thead>
          <tr>
              <th>FirstClassSeatOccupancy</th>
              <th>BusinessClassSeatOccupancy</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td><c:out value="${flightInfo[0]}"></c:out></td>
            <td><c:out value="${flightInfo[1]}"></c:out></td>
          </tr>
        </tbody>
      </table>
     </c:if>
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