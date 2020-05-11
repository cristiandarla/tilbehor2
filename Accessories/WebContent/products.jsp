<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<c:choose>
		<c:when test="${not empty requestScope.desc}">
		<title>tilbehør - ${requestScope.desc}</title>
		</c:when>
		<c:otherwise>
		<title>tilbehør - products</title>
		</c:otherwise>
		</c:choose>
		
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
				<img src="img/all-top1.jpg" class="img-fluid w-100 w3-opacity-min">
				<div class="caption">
		            <h1 class="huge">PRODUCTS</h1>
		        </div>
				</c:otherwise>
		        </c:choose>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-3 col-xs-12 col-sm-12 col-xl-3 mt-5">
			      	<div class="card card-body mb-4 ml-4">
			      	<c:choose>
			      	<c:when test="${not empty requestScope.desc}">
			      	<form action="ProductController?sex=${requestScope.desc}" method="post">
			      	</c:when>
			      	<c:otherwise>
			      	<form action="ProductController" method="post">
			      	</c:otherwise>
			      	</c:choose>
			      		<form action="ProductController" method="post">
				      		<h1 class="text-center">FILTERS</h1>
				      		<hr>		      	
				      		<div class="row">
					      		<div class="col-6 col-lg-6 col-xs-6 col-md-6">
					      			<h3>Sex</h3>
					      		</div>
						      	<div class="col-6 col-lg-6 col-xs-6 col-md-6">
						      		<button class="btn btn-dark btn-lg float-right" value="Expand" id="sex" type="button" data-toggle="collapse" data-target="div#sex" aria-expanded="false" aria-controls="sex">
							    		Expand
							  		</button>
						      	</div>
							  	<div class="collapse ml-4" id="sex">
							      	<input type="checkbox" name="desc" value="male">Men
					      			<input type="checkbox" name="desc" value="female">Women
					      		</div>
					      	</div>
					      	<div class="row">
					      		<div class="col-6 col-lg-6 col-xs-6 col-md-6">
					      			<h3>Category</h3>
					      		</div>
						      	<div class="col-6 col-lg-6 col-xs-6 col-md-6">
						      		<button class="btn btn-dark btn-lg float-right" value="Expand" id="categ" type="button" data-toggle="collapse" data-target="div#cat" aria-expanded="false" aria-controls="cat">
							    		Expand
							  		</button>
						      	</div>
							  	<div class="collapse ml-4" id="cat">
							  		<c:choose>
							  		<c:when test="${requestScope.desc == 'male'}">
							      	<c:forEach var="categ" items="${applicationScope.categM}">
							      		<input type="checkbox" name="category" value="${categ}">${categ}<br/>
							      	</c:forEach>
							  		</c:when>
							  		<c:when test="${requestScope.desc == 'female'}">
							      	<c:forEach var="categ" items="${applicationScope.categF}">
							      		<input type="checkbox" name="category" value="${categ}">${categ}<br/>
							      	</c:forEach>
							  		</c:when>
							  		<c:otherwise>
							      	<c:forEach var="categ" items="${applicationScope.categ}">
							      		<input type="checkbox" name="category" value="${categ}">${categ}<br/>
							      	</c:forEach>
							  		</c:otherwise>
							  		</c:choose>
					      		</div>
					      	</div>
					      	<div class="row">
					      		<div class="col-6 col-lg-6 col-xs-6 col-md-6">
					      			<h3>Material</h3>
					      		</div>
						      	<div class="col-6 col-lg-6 col-xs-6 col-md-6">
						      		<button class="btn btn-dark btn-lg float-right" value="Expand" id="material" type="button" data-toggle="collapse" data-target="div#material" aria-expanded="false" aria-controls="material">
							    		Expand
							  		</button>
						      	</div>
							  	<div class="collapse ml-4" id="material">
							  		<c:choose>
							  		<c:when test="${requestScope.desc == 'male'}">
							      	<c:forEach var="material" items="${applicationScope.materialM}">
							      		<input type="checkbox" name="material" value="${material}">${material}<br/>
							      	</c:forEach>
							  		</c:when>
							  		<c:when test="${requestScope.desc == 'female'}">
							      	<c:forEach var="material" items="${applicationScope.materialF}">
							      		<input type="checkbox" name="material" value="${material}">${material}<br/>
							      	</c:forEach>
							  		</c:when>
							  		<c:otherwise>
							      	<c:forEach var="material" items="${applicationScope.material}">
							      		<input type="checkbox" name="material" value="${material}">${material}<br/>
							      	</c:forEach>
							  		</c:otherwise>
							  		</c:choose>
					      		</div>
					      	</div>
					      	<div class="row">
					      		<div class="col-6 col-lg-6 col-xs-6 col-md-6">
					      			<h3>Brand</h3>
					      		</div>
						      	<div class="col-6 col-lg-6 col-xs-6 col-md-6 ">
							      	<button class="btn btn-dark btn-lg float-right" value="Expand" id="brand" type="button" data-toggle="collapse" data-target="div#brand" aria-expanded="false" aria-controls="brand">
								    	Expand
								  	</button>
						      	</div>
							  	<div class="collapse ml-4" id="brand">
							  		<c:choose>
							  		<c:when test="${requestScope.desc == 'male'}">
							      	<c:forEach var="brand" items="${applicationScope.brandM}">
							      		<input type="checkbox" name="brand" value="${brand}">${brand}<br/>
							      	</c:forEach>
							  		</c:when>
							  		<c:when test="${requestScope.desc == 'female'}">
							      	<c:forEach var="brand" items="${applicationScope.brandF}">
							      		<input type="checkbox" name="brand" value="${brand}">${brand}<br/>
							      	</c:forEach>
							  		</c:when>
							  		<c:otherwise>
							      	<c:forEach var="brand" items="${applicationScope.brand}">
							      		<input type="checkbox" name="brand" value="${brand}">${brand}<br/>
							      	</c:forEach>
							  		</c:otherwise>
							  		</c:choose>
					      		</div>
					      	</div><hr>
					      	<button type="submit" class="btn btn-dark btn-lg btn-block mt-3">Submit Filters</button>
			      		</form>
			      	</div>
		      	</div>
		      	<div class="col-9 col-xs-12 col-sm-12 col-xl-9">
		      	<c:choose>
		      	<c:when test="${not empty sessionScope.products}">
		      	<c:set var="count" value="${0}"></c:set>
					<c:forEach var="product" items="${sessionScope.products}">
					<c:set var="count" value="${count + 1}"></c:set>
					<c:if test="${count % 4 == 1}"><div class="row"></c:if>
				        <div class="col-3 col-xl-3 col-sm-6 col-xs-12 prod-col d-flex d-xl-flex align-items-stretch">
				        	<div class="card p-2">
				        		<div class="text-center d-flex align-items-center" style="max-width: 300px; height: 300px;">
							  	<a href="SpecificProductController?id=${product.id}"><img class="card-img-top rounded img-fluid zoom" src="${product.image}" alt="${product.name}" style="width: 100%; height: auto; max-height: 300px!important;"></a>
							  	</div>
							  	<div class="card-body pt-4 d-flex flex-column justify-content-between">
							    	<h4 class="card-title">${product.name}</h4>
							    	<div>
							    		<h5 class="card-text">SIZE: ${product.size}</h5>
							    		<h5 class="card-text"><strong>${product.price} RON</strong></h5>
							    	</div>
							    	<div class="pt-2 pull-down">
								    	<a href="SpecificProductController?id=${product.id}"><button type="submit" class="btn btn-sm btn-dark zoom btn-block">
							          		<span class="glyphicon glyphicon-chevron-right"></span> Open product
							        	</button></a>
							        	<c:if test="${not empty sessionScope.user}">
										<div class="actionList pt-2">
										<a href="WishlistController?id=${product.id}"><button type="button" class="btn btn-sm btn-dark zoom btn-block">
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
		      	</c:when>
		      	<c:otherwise>
		      	<div class="text-center">
		      		<h1>The filters you used are too selective for us. Please, try some new ones!</h1>
		      	</div>
		      	</c:otherwise>
		      	</c:choose>
		      	</div>
			</div>
		</div>
	<%@include file="/footer.jspf" %>
	</body>
</html>
