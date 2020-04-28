<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
     <head>
		<title>Login</title>
		<%@include file="/head.jspf" %>
	</head>
    <body>
    	<%@include file="/navbar.jspf" %>
        <div class="space">
            <div class="container">
            	<div class="row">
            		<div class="col-xs-12 col-sm">
            			<h1>Select what you want to do:</h1>
			            <div class="form-element space">
			               <a href="addProducts.jsp"><button type="submit" class="btn btn-success">Add Product</button></a>
			               <a href="removeProducts.jsp"><button type="submit" class="btn btn-danger">Remove Product</button></a>
			               <a href="OrderController"><button type="submit" class="btn btn-primary">See orders</button></a>
			               <a href="#"><button type="submit" class="btn btn-primary">Get statistics</button></a>
			           </div>
            		</div>
            	</div>
            	
            	<h1>Alerts:</h1>
			    <c:forEach var="alert" items="${applicationScope.alertProds}">
            	<div class="row">
            		<div class="col-xs-8 col-sm-8">
						  <h4>Product <a href="ProductController?id=${alert.id}">${alert.name}</a> is OUT OF STOCK!</h4>			            
            		</div>
            		<div class="col-xs-4 col-sm-4">
            			<a href="#"><button type="submit" class="btn btn-success" class="">Add Product</button></a>
			        	<a href="#"><button type="submit" class="btn btn-primary">Postpone alert</button></a>
            		</div>
            		<hr>
            	</div>
            	</c:forEach>
            </div>
        </div>
	<%@include file="/footer.jspf" %>
    </body>
</html>

