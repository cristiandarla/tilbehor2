<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>tilbehør - Register</title>
		<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link href="css/style.css" rel="stylesheet" type="text/css">
		<link href="css/style_home.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
        function Validate() {
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("rpassword").value;
			if (password != confirmPassword) {
	    		alert("Passwords do not match.");
	        	return false;
    		}
			return true;
		}
        </script>
	</head>
	<body class="register">
		<nav class="navbar-default navbar-static-top">
			  <div class="container">
			    <div class="navbar-header">
			      <a class="navbar-brand" href="home.jsp">tilbehør</a>
			    </div>
			    <ul class="nav navbar-nav navbar-right collapse navbar-collapse">
			      <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i>Log in!</a></li>
			    </ul>
			  </div>
			</nav>	  
		<div class="login">
			<h1>Register</h1>
			<form action="RegisterController" method="post">
				<label for="name">
					<i class="fas fa-user"></i>
				</label>
				<input type="text" name="name" placeholder="Name" id="name" required>
				<label for="username">
					<i class="fas fa-user"></i>
				</label>
				<input type="text" name="username" placeholder="Username" id="username" required>
				<label for="email">
					<i class="far fa-envelope"></i>
				</label>
				<input type="email" name="email" placeholder="Email" id="email" required>
				<label for="password">
					<i class="fas fa-lock"></i>
				</label>
				<input type="password" name="password" placeholder="Password" id="password" required>
				<label for="password">
					<i class="fas fa-lock"></i>
				</label>
				<input type="password" name="rpassword" placeholder="Repeat Password" id="rpassword" required>
				<c:forEach var="erori" items="${requestScope.errors}">
					<p>${pageScope.erori}</p>
				</c:forEach>
				<input type="submit" value="Register" onclick="return Validate()">
			</form>
		</div>
	</body>
	
</html>
