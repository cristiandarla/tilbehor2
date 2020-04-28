<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>tilbehør</title>
		<%@include file="/head.jspf" %>
	</head>
	<body class="contact">
		<%@include file="/navbar.jspf" %>
		<div class="container">
		
			<div class="row">
			<c:forEach var="product" items="${applicationScope.products}">
			<c:if test="${product.description == \"male\"}">
		        <div class="col-xs-4 prod-col">
		        	<div class="card" style="width: 18rem;">
					  <a href="ProductController?id=${product.id}"><img class="card-img-top img-fluid zoom" src="${product.image}" alt="${product.name}" style="width: 300px; height: 300px;"></a>
					  <div class="card-body space-10">
					    <h4 class="card-title">${product.name}</h4>
					    <h5 class="card-text">SIZE: ${product.size}</h5>
					    <h5 class="card-text"><strong>${product.price} RON</strong></h5>
					    <a href="ProductController?id=${product.id}"><button type="submit" class="btn btn-sm btn-outline-primary zoom">
				          	<span class="glyphicon glyphicon-chevron-right"></span> Open product
				        </button></a>
					  </div>
					</div>
					<c:if test="${not empty sessionScope.user}">
					<div class="actionList">
					<a href="WishlistController?id=${product.id}"><button type="button" class="btn btn-sm btn-outline-primary zoom">
			          		<span class="glyphicon glyphicon-heart-empty"></span> Add to wishlist
			        	</button></a>
					</div>  
					</c:if>
				</div>					
				</c:if>
			</c:forEach>
			</div>	
		</div>
	<%@include file="/footer.jspf" %>
	</body>
</html>
