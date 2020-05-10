<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>tilbehør - login</title>
		<%@include file="/head.jspf" %>
		
	</head>
	<body class="register">
	
		<nav class="navbar-default navbar navbar-expand-lg">
		  <div class="container">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="home.jsp">tilbehør</a>
		    </div>
		    <ul class="navbar-nav navbar-right">
		      <li class="nav-item"><a class="nav-link" href="register.jsp"><i class="fas fa-user-plus"></i>Sign up!</a></li>
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
					<h6 style="color: red;text-transform: uppercase;">${pageScope.erori}</h6>
				</c:forEach>
				<h6>Forgot your password? Click <a href="security.jsp">here</a></h6>
				<input type="submit" value="Login">
			</form>
		</div>
	<%@include file="/footer.jspf" %>
	</body>
</html>
