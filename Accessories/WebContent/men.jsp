<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>tilbehør</title>
		<%@include file="/head.jspf" %>
	</head>
	<body>
		
		<%@include file="/navbar.jspf" %>
		<div class="container">
			<%int count = 0;%>
			<c:forEach var="product" items="${applicationScope.products}">
				<c:if test="${product.description == \"male\"}">
			<%count++; 
			if(count % 4 == 1)
			{%><div class="row"><%} %>
					  <div class="col col-sm">
						<a href="product_details.html"><img src="${product.image}" alt=""></a>
						<div class="caption cntr">
							<p>${product.name}</p>
							<p><strong>${product.price}</strong></p>
							<h4><a class="shopBtn" href="#" title="add to cart"> Add to cart </a></h4>
							<c:if test="${not empty sessionScope.user}">
							<div class="actionList">
								<a class="pull-left" href="#">Add to Wish List </a> 
								<a class="pull-left" href="#"> Add to Compare </a>
							</div> 
							</c:if>
							<br class="clr">
						</div>
					  </div>
				<%if(count % 4 == 0)
				{%></div><%} %>							
				</c:if>
			</c:forEach>
		</div>
	</body>
</html>
