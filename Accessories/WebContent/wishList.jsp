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
            <h1>Wishlist:</h1>
            <hr>
            <c:if test="${empty sessionScope.wishlist}">
            <h4>Your wishlist is empty!</h4>
            <h4>Get some products from <a href="product.jsp">here</a>!</h4>
            </c:if>
            <div class="container">
				<c:forEach var="wishlist" items="${sessionScope.wishlist}">
			       	
            	<div class="row">
			       	<div class="col-12 col-sm-12 col-md-2 text-center">
                    	<img class="img-fluid img-thumbnail float-left" src="${wishlist.img}" alt="prewiew" width="100" height="100">
                    </div>
                    <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                       	<h4 class="product-name"><strong>${wishlist.name}</strong></h4>
                    </div>
                        <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                        	<div class="col-4 col-sm-4 col-md-4">
                                <div class="size">
                                    <h4><strong>${wishlist.size}</strong></h4>
                                </div>
                            </div>
                            <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                                <h4><strong>${wishlist.price}<span class="text-muted"> RON</span></strong></h4>
                            </div>
                            <div class="col-2 col-sm-2 col-md-2 text-right">
                                <form method="post" action="DeleteWController?productName=${wishlist.id}">
	                                <button type="submit" class="btn btn-outline-danger btn-xs" >
	                                    <i class="fa fa-trash" aria-hidden="true"></i>
	                                </button>
                                </form>
                            </div>
                        </div>
					</div>
                    <hr>
				</c:forEach>
			
        </div>
    </body>
</html>

