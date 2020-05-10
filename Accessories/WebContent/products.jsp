<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>tilbehør - ${requestScope.desc}</title>
		<%@include file="/head.jspf" %>
	</head>
	<body class="contact">
		<%@include file="/navbar.jspf" %>
		<div class="row">
			<div class="col-12 col-xs-12 w-100 thumbnail text-center">
				<c:choose>
				<c:when test="${requestScope.desc == \"male\" }">
				<img src="img/men-top2.jpg" class="img-fluid w-100 w3-opacity-min">
				<div class="caption">
		            <h1 class="huge">MEN</h1>
		        </div>
				</c:when>
				<c:when test="${requestScope.desc == \"female\" }">
				<img src="img/women-top2.jpg" class="img-fluid w-100 w3-opacity-min">
				<div class="caption">
		            <h1 class="huge">WOMEN</h1>
		        </div>
				</c:when>
				<c:otherwise>
				<img src="img/all-top.png" class="img-fluid w-100 w3-opacity-min">
				<div class="caption">
		            <h1 class="huge">PRODUCTS</h1>
		        </div>
				</c:otherwise>
		        </c:choose>
			</div>
		</div>
		<div class="container-fluid">
				<c:set var="count" value="${0}"></c:set>
				<c:forEach var="product" items="${sessionScope.products}">
				<c:set var="count" value="${count + 1}"></c:set>
				<c:if test="${count % 4 == 1}"><div class="row"></c:if>
			        <div class="col-3 col-xl-3 col-sm-6 col-xs-12 prod-col d-flex d-xl-flex align-items-stretch">
			        	<div class="card p-2">
						  	<a href="SpecificProductController?id=${product.id}"><img class="card-img-top rounded img-fluid zoom w-100" src="${product.image}" alt="${product.name}" style="width: 300px; height: 300px;"></a>
						  	<div class="card-body pt-4 d-flex flex-column justify-content-between">
						    	<h4 class="card-title">${product.name}</h4>
						    	<div>
						    		<h5 class="card-text">SIZE: ${product.size}</h5>
						    		<h5 class="card-text"><strong>${product.price} RON</strong></h5>
						    	</div>
						    	<div class="pt-2 pull-down">
							    	<a href="SpecificProductController?id=${product.id}"><button type="submit" class="btn btn-lg btn-dark zoom btn-block">
						          		<span class="glyphicon glyphicon-chevron-right"></span> Open product
						        	</button></a>
						        	<c:if test="${not empty sessionScope.user}">
									<div class="actionList pt-2">
									<a href="WishlistController?id=${product.id}"><button type="button" class="btn btn-lg btn-dark zoom btn-block">
										<span class="glyphicon glyphicon-heart-empty"></span> Add to wishlist
									</button></a>
									</div> 
									</c:if>
						    	</div>
						    	
						  	</div>
						</div>
						
					</div>
					<c:if test="${count % 4 == 0}"></div></c:if>		
				</c:forEach>
			</div>
	<%@include file="/footer.jspf" %>
	</body>
</html>
