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
	
		<nav class="navbar-default navbar navbar-expand-lg">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="home.jsp">tilbehør</a>
		    </div>
		    <ul class="navbar-nav navbar-right">
		      <li class="nav-item"><a class="nav-link" href="register.jsp"><i class="fas fa-user-plus"></i>Sign up!</a></li>
		    </ul>
		  </div>
		</nav>	  
		<div class="login">
			<h1>Forget password</h1>
			<form action="ResetPasswordController" method="post">
				<label for="email">
					<i class="far fa-envelope"></i>
				</label>
				<input type="email" name="email" placeholder="email" required>
				<c:forEach var="erori" items="${requestScope.errors}">
					<p style="color: red;text-transform: uppercase;">${erori}</p>
				</c:forEach>
				<input type="submit" value="Submit">
			</form>
		</div>
	<%@include file="/footer.jspf" %>
	</body>
</html>
