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
			<c:if test="${product.description == \"female\"}">
		        <div class="col-xs-4 prod-col">
		        	<a href="ProductController?id=${product.id}"><img src="${product.image}" alt="" class="img-fluid img-thumbnail float-left zoom" style="width: 300px; height: 300px;"></a>
					<div style="padding: 5px 0px;">
						<p>${product.name}</p>
						<p>SIZE: ${product.size}</p>
						<p><strong>${product.price} RON</strong></p>
						<a href="ProductController?id=${product.id}"><button type="submit" class="btn btn-sm btn-outline-primary zoom">
				          	<span class="glyphicon glyphicon-chevron-right"></span> Open product
				        </button></a>
						<c:if test="${not empty sessionScope.user}">
						<div class="actionList">
						<a href="WishlistController?id=${product.id}"><button type="button" class="btn btn-sm btn-outline-primary zoom">
				          		<span class="glyphicon glyphicon-heart-empty"></span> Add to wishlist
				        	</button></a>
						</div>  
						</c:if>
					</div>
		        </div>					
				</c:if>
			</c:forEach>
			</div>	
		</div>
	</body>
</html>
