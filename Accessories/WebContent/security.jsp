<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>tilbehør - Home</title>
		<%@include file="/head.jspf" %>
		
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
			<form action="" method="post">
				<label for="username">
					<i class="far fa-envelope"></i>
				</label>
				<input type="email" name="email" placeholder="email" required>
				<input type="submit" value="Login">
			</form>
		</div>
	</body>
</html>
