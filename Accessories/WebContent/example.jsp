<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
     <head>
		<title>Add Products</title>
		<%@include file="/head.jspf" %>
	</head>
    <body>
        <div class="container-fluid">
        	
	        <%@include file="/navbar.jspf" %>
	      	<div class="col-4 col-xs-12 col-xl-4">
		      	<div class="card card-body mb-4 ml-4">		      	
		      		<div class="row">
			      		<div class="col-6 col-lg-6 col-xs-6 col-md-6">
			      			<h1>Sex</h1>
			      		</div>
				      	<div class="col-6 col-lg-6 col-xs-6 col-md-6">
				      		<button class="btn btn-dark btn-lg float-right" value="Expand" id="sex" type="button" data-toggle="collapse" data-target="div#sex" aria-expanded="false" aria-controls="sex">
					    		Expand
					  		</button>
				      	</div>
					  	<div class="collapse ml-4" id="sex">
					      	<input type="checkbox" name="sex" value="men">Men
			      			<input type="checkbox" name="sex" value="women">Women
			      		</div>
			      	</div>
			      	<div class="row">
			      		<div class="col-6 col-lg-6 col-xs-6 col-md-6">
			      			<h1>Category</h1>
			      		</div>
				      	<div class="col-6 col-lg-6 col-xs-6 col-md-6">
				      		<button class="btn btn-dark btn-lg float-right" value="Expand" id="categ" type="button" data-toggle="collapse" data-target="div#cat" aria-expanded="false" aria-controls="cat">
					    		Expand
					  		</button>
				      	</div>
					  	<div class="collapse ml-4" id="cat">
					      	<c:forEach var="categ" items="${applicationScope.categ}">
					      		<input type="checkbox" name="categ" value="${categ}">${categ}<br/>
					      	</c:forEach>
			      		</div>
			      	</div>
			      	<div class="row">
			      		<div class="col-6 col-lg-6 col-xs-6 col-md-6">
			      			<h1>Material</h1>
			      		</div>
				      	<div class="col-6 col-lg-6 col-xs-6 col-md-6">
				      		<button class="btn btn-dark btn-lg float-right" value="Expand" id="material" type="button" data-toggle="collapse" data-target="div#material" aria-expanded="false" aria-controls="material">
					    		Expand
					  		</button>
				      	</div>
					  	<div class="collapse ml-4" id="material">
					      	<c:forEach var="material" items="${applicationScope.material}">
					      		<input type="checkbox" name="categ" value="${material}">${material}<br/>
					      	</c:forEach>
			      		</div>
			      	</div>
			      	<div class="row">
			      		<div class="col-6 col-lg-6 col-xs-6 col-md-6">
			      			<h1>Brand</h1>
			      		</div>
				      	<div class="col-6 col-lg-6 col-xs-6 col-md-6 ">
					      	<button class="btn btn-dark btn-lg float-right" value="Expand" id="brand" type="button" data-toggle="collapse" data-target="div#brand" aria-expanded="false" aria-controls="brand">
						    	Expand
						  	</button>
				      	</div>
					  	<div class="collapse ml-4" id="brand">
					      	<c:forEach var="brand" items="${applicationScope.brand}">
					      		<input type="checkbox" name="brand" value="${brand}">${brand}<br/>
					      	</c:forEach>
			      		</div>
			      	</div>
		      	</div>
	      	</div>
	      	<div class="col-8 col-xs-12 col-xl-8">
	      	</div>
      	</div>
    </body>
</html>