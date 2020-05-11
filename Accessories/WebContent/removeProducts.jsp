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
		<c:if test="${not sessionScope.admin}">
			<c:redirect url="home.jsp"></c:redirect>
		</c:if>
		<%@include file="/navbar.jspf" %>
		<div class="container">
		
			<div class="row">
			<c:forEach var="product" items="${applicationScope.products}">
		        <form method="post" action="RemoveProductController?id=${product.id}">
		        <div class="col-xs-4 prod-col">
		        	<img src="${product.image}" alt="" class="img-fluid img-thumbnail float-left zoom" style="width: 300px; height: 300px;">
					<div style="padding: 5px 0px;">
						<p>${product.name}</p>
						<p><strong>${product.price} RON</strong></p>
						<div class="actionList">
						<button type="submit" class="btn btn-sm btn-danger">
				          	<span class="glyphicon glyphicon-shopping-cart"></span> Remove
				        </button>
						</div>
					</div>
		        </div>
		        </form>		
			</c:forEach>
			</div>	
		</div>
	<%@include file="/footer.jspf" %>
	</body>
</html>