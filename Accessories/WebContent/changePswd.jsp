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
			<h1>Change Password</h1>
			<form action="UserController?change=true" method="post">
				<label for="password">
					<i class="fas fa-lock"></i>
				</label>
				<input type="password" name="oldpass" placeholder="Old Password" id="password" required>
				<label for="password">
					<i class="fas fa-lock"></i>
				</label>
				<input type="password" name="newpass" placeholder="New Password" id="password" required>
				<c:forEach var="erori" items="${requestScope.errors}">
					<p>${pageScope.erori}</p><br>
				</c:forEach>
				<p>Forgot your password? Click <a href="security.jsp">here</a></p>
				<input type="submit" value="Login">
			</form>
		</div>
	<%@include file="/footer.jspf" %>
	</body>
</html>
