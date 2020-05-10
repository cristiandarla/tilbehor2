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
			  </div>
			</nav>	  
		<div class="login">
			<h1>Reset Password</h1>
			<form action="ResetPasswordController" method="post">
				<label for="password">
					<i class="fas fa-lock"></i>
				</label>
				<input type="password" name="password" placeholder="Password" id="password" required>
				<label for="password">
					<i class="fas fa-lock"></i>
				</label>
				<input type="password" name="rpassword" placeholder="Repeat Password" id="rpassword" required>
				<c:forEach var="erori" items="${requestScope.errors}">
					<h6 style="color: red;text-transform: uppercase;">${erori}</h6>
				</c:forEach>
				<input type="submit" value="Reset Password" onclick="return Validate()">
			</form>
		</div>
	<%@include file="/footer.jspf" %>
	</body>
</html>
