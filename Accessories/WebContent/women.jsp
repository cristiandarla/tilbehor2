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
		<section>
			<%int count = 0;%>
			<c:forEach var="product" items="${applicationScope.products}">
				<c:if test="${product.description == \"female\"}">
					<%count++; %>
					<form class="well well-small">
						<%if(count % 3 == 1)
						{%>	<div class="row-fluid">
							  <ul class="thumbnails"><%} %>
								<li class="span4">
								  <div class="thumbnail">
									<a href="product_details.html"><img src="${product.image}" alt=""></a>
									<div class="caption cntr">
										<p>${product.name}</p>
										<p><strong>${product.price}</strong></p>
										<h4><a class="shopBtn" href="#" title="add to cart"> Add to cart </a></h4>
										<div class="actionList">
											<a class="pull-left" href="#">Add to Wish List </a> 
											<a class="pull-left" href="#"> Add to Compare </a>
										</div> 
									</div>
								  </div>
								</li>
						<%if(count % 3 == 0)
						{%></ul>
						</div><%} %>
					</form>	
										
				</c:if>
			</c:forEach>
		</section>	
	</body>
</html>
