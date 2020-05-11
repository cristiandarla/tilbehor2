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
        	<h1>Orders:</h1>
           	<hr>
            <div class="container-fluid">
            	<div class="row space-10">
            		<div class="col-xs-2 col-sm-2">
            		<h4>NO. ORDER</h4>
            		</div>
			        <div class="col-xs-2 col-sm-2">
			        <h4>DATE</h4>
			        </div>
			        <div class="col-xs-2 col-sm-2">
			        <h4>TOTAL PRICE</h4>
			        </div>
			        <div class="col-xs-6 col-sm-6">
			        </div>	
           		</div>
           		<hr>
            	<c:forEach var="order" items="${requestScope.orders}">
           		
           		<div class="row space-10">
            		<div class="col-xs-2 col-sm-2">
            			<h4>${order.id}</h4>
            		</div>
			        <div class="col-xs-2 col-sm-2">
			        	<h4>${order.date}</h4>
			        </div>
			        <div class="col-xs-2 col-sm-2">
			        	<h4>${order.totalPrice}</h4>
			        </div>
			        <div class="col-xs-6 col-sm-6">
				        <a class="btn btn-primary float-right" data-toggle="collapse" href="#order-${order.id}" role="button" aria-expanded="false" aria-controls="order-${order.id}">
	   					Show more
	   					</a>
			        </div>
           		</div>
           		<div class="collapse" id="order-${order.id}">
				  <div class="card card-body">
				  <div class="row">
			       	<div class="col-12 col-sm-12 col-md-2 text-center">
                    </div>
                    <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                    <h5>NAME</h5>
                    </div>
                        <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                            <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                    			<h5>PRICE</h5>
                            </div>
                            <div class="col-6 col-sm-6 col-md-6">
                    			<h5>QUANTITY</h5>
                            </div>
                        </div>
					</div>
					<hr>
				  	<c:forEach var="product" items="${order.items}">
				  	<div class="row">
			       	<div class="col-12 col-sm-12 col-md-2 text-center">
                    	<a href="SpecificProductController?id=${product.id}"><img class="img-fluid img-thumbnail float-left" src="${product.img}" alt="prewiew" width="100" height="100"></a>
                    </div>
                    <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                    <h5><a href="SpecificProductController?id=${product.id}">${product.name}</a></h5>
                    </div>
                        <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                            <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                    			<h5>${product.price}</h5>
                            </div>
                            <div class="col-4 col-sm-4 col-md-4">
                    			<h5>${product.qty}</h5>
                            </div>
                        </div>
					</div>
					<hr>
				  	</c:forEach>
				  </div>
				</div>
            	</c:forEach>
            	
            	
            </div>
        </div>
	<%@include file="/footer.jspf" %>
    </body>
</html>

