<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>tilbehør - statistics</title>
		
		<%@include file="/head.jspf" %>
	</head>
	<body class="contact">
		<%@include file="/navbar.jspf" %>
		<c:if test="${not sessionScope.admin}">
			<c:redirect url="home.jsp"></c:redirect>
		</c:if>
		<div class="container-fluid mr-5 ml-4">
			<div class="row">
				<div class="col-2 col-xl-2 col-xs-12 col-sm-12">
				</div>
				<div class="col-4 col-xl-4 col-xs-12 col-sm-12">
				<h3>NAME</h3>
				</div>
				<div class="col-3 col-xl-3 col-xs-12 col-sm-12">
				<h3>DESCRIPTION</h3>
				</div>
				<div class="col-3 col-xl-3 col-xs-12 col-sm-12">
				<h3>QTY SOLD</h3>
				</div>
			</div>
			<hr>
			<c:forEach var="stat" items="${requestScope.stats }">
			<div class="row">
				<div class="col-2 col-xl-2 col-xs-12 col-sm-12">
				<a href="SpecificProductController?id=${stat.product.id}"><img class="img-fluid img-thumbnail float-left" src="${stat.product.image}" alt="prewiew" width="100" height="100"></a>
				</div>
				<div class="col-4 col-xl-4 col-xs-12 col-sm-12">
				<h4 class="product-name"><a href="SpecificProductController?id=${stat.product.id}"><strong>${stat.product.name}</strong></a></h4>
				</div>
				<div class="col-3 col-xl-3 col-xs-12 col-sm-12">
				<h5>Price: ${stat.product.price} RON</h5>
				<h5>Size: ${stat.product.size}</h5>
				<h5>Total stock: ${stat.product.stock + stat.qty}</h5>
				<h5>Now: ${stat.product.stock}</h5>
				</div>
				<div class="col-3 col-xl-3 col-xs-12 col-sm-12 text-center">
				<h5>${stat.qty}</h5>
				</div>
			</div>
			<hr>
			</c:forEach>
			<hr>
		</div>
	<%@include file="/footer.jspf" %>
	</body>
</html>