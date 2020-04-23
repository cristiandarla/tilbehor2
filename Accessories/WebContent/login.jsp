<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>tilbehør - Home</title>
		<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link href="css/style.css" rel="stylesheet" type="text/css">
		<link href="css/style_home.css" rel="stylesheet" type="text/css">
		
	</head>
	<body class="register">
	
		<nav class="navbar-default navbar-static-top">
			  <div class="container">
			    <div class="navbar-header">
			      <a class="navbar-brand" href="home.jsp">tilbehør</a>
			    </div>
			    <ul class="nav navbar-nav navbar-right collapse navbar-collapse">
			      <li><a href="register.jsp"><i class="fas fa-user-plus"></i>Sign up!</a></li>
			    </ul>
			  </div>
			</nav>	  
		<div class="login">
			<h1>Login</h1>
			<form action="LoginController" method="post">
				<label for="username">
					<i class="fas fa-user"></i>
				</label>
				<input type="text" name="username" placeholder="Username" id="username" required>
				<label for="password">
					<i class="fas fa-lock"></i>
				</label>
				<input type="password" name="password" placeholder="Password" id="password" required>
				<c:forEach var="erori" items="${requestScope.errors}">
					<p>${pageScope.erori}</p>
				</c:forEach>
				<p>Forgot your password? Click <a href="security.jsp">here</a></p>
				<input type="submit" value="Login">
			</form>
		</div>
	</body>
</html>
