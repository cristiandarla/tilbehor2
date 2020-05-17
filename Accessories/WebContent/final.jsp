<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
     <head>
		<title>tilbehør - checkout</title>
		<%@include file="/head.jspf" %>
	</head>
    <body>
        <div id="content">
        <%@include file="/navbar.jspf" %>
            <div class="space">
	            <h1>Products bought:</h1>
	            <c:if test="${empty sessionScope.cart}">
	            <p>Your shopping cart is empty!</p>
	            <p>Get some products from <a href="product.jsp">here</a>!</p>
	            </c:if>
	            <div class="container-fluid">
				<c:forEach var="cart" items="${sessionScope.cart}">
			       	
            	<div class="row">
			       	<div class="col-12 col-sm-12 col-md-2 text-center">
                    	<img class="img-fluid img-thumbnail float-left" src="${cart.img}" alt="prewiew" width="50" height="50">
                    </div>
                    <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                       	<h4 class="product-name"><strong>${cart.name}</strong></h4>
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
                        </div>
					</div>
                    <hr>
				</c:forEach>
				<c:set var="cart" scope="session" value="${null}"></c:set>
			<div class="row">
				<div class="col-10 col-xs-10">
				</div>
				<div class="col-2 col-xs-2">
					<form method="post" action="home.jsp">
					<button type="submit" class="btn btn-succes">
                           <span class="fas fa-home"></span> Back Home
                    </button>
					</form>
				</div>
			</div>
			</div>
        </div>
        </div>
	<%@include file="/footer.jspf" %>
    </body>
</html>

