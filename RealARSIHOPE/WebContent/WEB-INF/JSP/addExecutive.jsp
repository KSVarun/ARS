<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
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

.box {
	width: 500px;
	height: auto;
	border-radius: 10px;
	border: solid 1px rgba(38, 166, 154, 0.3);
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
			Executive</a>
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
		<form:form class="box" action="processAddExecutive.html" method="post"
			modelAttribute="Users">
			<div class="row">
				<div class="input-field">
					<form:input path="username" id="username" class="validate" />
					<label for="username">Username</label>
					<form:errors path="username" />
				</div>
			</div>
			<div class="row">
				<div class="input-field">
					<form:input path="password" id="password" class="validate" />
					<label for="password">Password</label>
					<form:errors path="password" />
				</div>
			</div>
			<div class="row">
				<div class="input-field">
					<form:input path="role" id="role" class="validate" />
					<label for="role">Role</label>
					<form:errors path="role" />
				</div>
			</div>
			<div class="row">
				<div class="input-field ">
					<form:input path="mobileNo" id="mobileNo" class="validate" />
					<label for="mobileNo">Mobile Number</label>
					<form:errors path="mobileNo" />
				</div>
			</div>
			<button class="waves-effect waves-light btn full-width-btn">
				<input type="submit" name="submit" value="Add Executive" />
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
</body>
</html>