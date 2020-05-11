<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>tilbehør - Register</title>
		<%@include file="/head.jspf" %>
	</head>
	<body class="register">
		<nav class="navbar-default navbar navbar-expand-lg">
			  <div class="container-fluid">
			    <div class="navbar-header">
			      <a class="navbar-brand" href="home.jsp">tilbehør</a>
			    </div>
			    <c:if test="${empty sessionScope.user}">
			    <ul class="navbar-nav navbar-right">
			      <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i>Log in!</a></li>
			    </ul>
			    </c:if>
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
					<p>${erori}</p><br>
				</c:forEach>
				<input type="submit" value="Register" onclick="return Validate()">
			</form>
		</div>
	<%@include file="/footer.jspf" %>
	</body>
	
</html>
