<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
     <head>
		<title>Login</title>
		<%@include file="/head.jspf" %>
	</head>
    <body>
        <%@include file="/navbar.jspf" %>
        <div class="space">
            <h1>Shopping cart:</h1>
            <hr>
            <c:if test="${empty sessionScope.cart}">
            <h4>Your shopping cart is empty!</h4>
            <h4>Get some products from <a href="product.jsp">here</a>!</h4>
            </c:if>
            <div class="container-fluid">
            <c:if test="${not empty sessionScope.cart}">
            	<c:set var="count" scope="page" value="${0.0}"></c:set>
            	<div class="row">
			       	<div class="col-2 col-xs-12 text-center">
                    </div>
                    <div class="col-4 col-xs-12 text-xs-center">
                    <h4><strong>NAME</strong></h4>
                    </div>
                        <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                            <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                    			<h4>PRICE</h4>
                            </div>
                            <div class="col-4 col-sm-4 col-md-4">
                    			<h4>QUANTITY</h4>
                            </div>
                            <div class="col-2 col-xs-2 text-right">
                            </div>
                        </div>
					</div>
					<hr>
				</c:if>
				<c:forEach var="cart" items="${sessionScope.cart}">
			    <c:set var="count" scope="page" value="${count + cart.price}"></c:set>
            	<div class="row">
			       	<div class="col-2 col-xs-12 text-center">
                    	<a href="SpecificProductController?id=${cart.id}"><img class="img-fluid img-thumbnail float-left" src="${cart.img}" alt="prewiew" width="100" height="100"></a>
                    </div>
                    <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                       	<a href="SpecificProductController?id=${cart.id}"><h4 class="product-name"><strong>${cart.name}</strong></h4></a>
                    </div>
                        <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                            <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                                <h4><strong><fmt:formatNumber type = "number" maxFractionDigits="2" value = "${cart.price}" /><span class="text-muted"> RON</span></strong></h4>
                            </div>
                            <div class="col-4 col-sm-4 col-md-4">
                                <div class="quantity">
                                    <h4><strong>${cart.qty}<span class="text-muted">pieces</span></strong></h4>
                                </div>
                            </div>
                            <div class="col-2 col-sm-2 col-md-2 text-right">
                                <form method="post" action="DeleteController?id=${cart.id}&qty=${cart.qty}">
	                                <button type="submit" class="btn btn-outline-danger btn-xs" >
	                                    <i class="fa fa-trash" aria-hidden="true"></i>
	                                </button>
                                </form>
                            </div>
                        </div>
					</div>
                    <hr>
				</c:forEach>
			<c:if test="${not empty sessionScope.cart}">
			<div class="row">
			<div class="col-12 col-sm-12 col-md-2 text-center">
               </div>
               <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                  	<h4 class="product-name"><strong>Total</strong></h4>
               </div>
               <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                   <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                       <h4><strong><fmt:formatNumber type = "number" maxFractionDigits="2"  value = "${count}" /></p><span class="text-muted"> RON</span></strong></h4>
                   </div>
                   <div class="col-4 col-sm-4 col-md-4">
                   </div>
                   <div class="col-2 col-sm-2 col-md-2 text-right">
                   </div>
               </div>
			</div>
               <hr>
			<div class="row">
				<div class="col-10 col-xs-10">
				</div>
				<div class="col-2 col-xs-2">
					<form method="post" action="TransactionController">
					<button type="submit" class="btn btn-succes">
                           <span class="fas fa-shipping-fast"></span> Purchase object
                    </button>
					</form>
				</div>

			</div>
			</c:if>
        </div>
	<%@include file="/footer.jspf" %>
    </body>
</html>
