<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>ACCESSORIES - Recover Password</title>
		<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
		<link href="style.css" rel="stylesheet" type="text/css">
		<link href="style_home.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<nav class="navtop">
			<div>
				<h1><a href="home.jsp">ACCESSORIES</a></h1>
			</div>
		</nav>
		<div class="login">
			<h1>Recover Password</h1>
			<form action="RegisterController" method="post">
				<label for="email">
					<i class="far fa-envelope"></i>
				</label>
				<input type="email" name="email" placeholder="Email" id="email" required>
				<input type="submit" value="Register">
			</form>
		</div>
	</body>
</html>
