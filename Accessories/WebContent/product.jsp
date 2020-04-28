<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>tilbehør</title>
		<link href="css/style.css" rel="stylesheet" type="text/css">
		<link href="css/style_home.css" rel="stylesheet" type="text/css">
		<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	</head>
	<body>
		
		<%@include file="/navbar.jspf" %>
		<div class="product">
			<form action="ProductController" method="post">
				<div class="product-men">
					<img src="img/men.jpeg" class="column">
					<div class="text-box-men">
						<a href="men.jsp">MEN</a>
					</div>
				</div>
				<div class="product-women">
					<img src="img/women.jpg" class="column">
					<div class="text-box-women">
						<a href="women.jsp">WOMEN</a>
					</div>
				</div>	
			</form>
		</div>
	<%@include file="/footer.jspf" %>
	</body>
</html>
