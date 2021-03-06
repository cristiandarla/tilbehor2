<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
     <head>
		<title>tilbeh�r - admin options</title>
		<%@include file="/head.jspf" %>
	</head>
    <body>
    	<c:if test="${not sessionScope.admin}">
			<c:redirect url="home.jsp"></c:redirect>
		</c:if>
    	<%@include file="/navbar.jspf" %>
        <div class="space">
            <div class="container-fluid">
            	<div class="row">
            		<div class="col-xs-12 col-sm">
            			<h1>Select what you want to do:</h1>
			            <div class="form-element space">
			               <a href="addProducts.jsp"><button type="button" class="btn btn-success">Add Product</button></a>
			               <a href="removeProducts.jsp"><button type="button" class="btn btn-danger">Remove Product</button></a>
			               <a href="OrderController"><button type="button" class="btn btn-primary">See orders</button></a>
			               <a href="StatsController"><button type="button" class="btn btn-primary">Get statistics</button></a>
			           </div>
            		</div>
            	</div>
            	
            	<h1>Alerts:</h1>
            	<c:choose>
            	<c:when test="${empty applicationScope.alertProds}">
            	<h3>No alert! Hurray!&#127881;&#127881;</h3>
            	</c:when>
            	<c:otherwise>
            	<c:forEach var="alert" items="${applicationScope.alertProds}">
            	<div class="row">
            		<div class="col-xs-8 col-sm-8">
						  <h4>Product <a href="ProductController?id=${alert.id}">${alert.name}</a> is OUT OF STOCK!</h4>			            
            		</div>
            		<div class="col-xs-4 col-sm-4">
            			<a href="#"><button type="button" class="btn btn-success" class="">Add Stock</button></a>
			        	<a href="#"><button type="button" class="btn btn-primary">Postpone alert</button></a>
            		</div>
            		<hr>
            	</div>
            	</c:forEach>
            	</c:otherwise>
            	</c:choose>
			    
            </div>
        </div>
	<%@include file="/footer.jspf" %>
    </body>
</html>

