<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>tilbeh�r</title>
		<%@include file="/head.jspf" %>
	</head>
	<body class="contact">
		<%@include file="/navbar.jspf" %>
		<div class="container">
		    <%int count = 0;%>
			<c:forEach var="product" items="${applicationScope.products}">
				<c:if test="${product.description == \"male\"}">
			<%count++; 
			if(count % 3 == 1)
			{%><div class="row""><%}%>
		        <div class="col-xs-4 prod-col">
		        	<a href="ProductController?id=${product.id}"><img src="${product.image}" alt="" class="img-fluid img-thumbnail float-left zoom" style="height: 300px; width: 100%:"></a>
					<div style="padding: 5px 0px;">
						<p>${product.name}</p>
						<p><strong>${product.price} RON</strong></p>
						<button type="button" class="btn btn-default btn-sm btn-outline-warning">
			          		<span class="fas fa-balance-scale"></span> Add to compare
			        	</button>
						<c:if test="${not empty sessionScope.user}">
						<div class="actionList">
							<button type="button" class="btn btn-default btn-sm btn-outline-primary">
				          		<span class="glyphicon glyphicon-heart-empty"></span> Add to wishlist
				        	</button>
						<button type="button" class="btn btn-default btn-sm btn-outline-primary">
				          	<span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart
				        </button>
						</div> 
						</c:if>
					</div>
		        </div>
		    <%if(count % 3 == 0)
				{%></div><%} %>							
				</c:if>
			</c:forEach>
		</div>
	</body>
</html>
