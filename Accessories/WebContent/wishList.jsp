<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
     <head>
		<title>wishlist</title>
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
            <div class="container-fluid">
            <c:if test="${not empty sessionScope.wishlist}">
            <div class="row">
			       	<div class="col-2 col-xs-12 text-center">
			       	</div>
                    <div class="col-4 col-xs-12 text-xs-center">
                       	<h4 class="product-name"><strong>NAME</strong></h4>
                    </div>
                   	<div class="col-2 col-xs-4">
                           <div class="size">
                               <h4><strong>SIZE</strong></h4>
                           </div>
                       </div>
                       <div class="col-2 col-xs-4 text-xs-right">
                           <h4><strong>PRICE</strong></h4>
                       </div>
                       <div class="col-1 col-xs-2 text-right">
                       </div>
                       <div class="col-1 col-xs-2 text-right">
                       </div>
					</div>
					<hr>
            </c:if>
				<c:forEach var="wishlist" items="${sessionScope.wishlist}">
            	<div class="row">
			       	<div class="col-2 col-xs-12 text-center">
                    	<a href="SpecificProductController?id=${wishlist.id}"><img class="img-fluid img-thumbnail float-left" src="${wishlist.img}" alt="preview" width="100" height="100"></a>
                    </div>
                    <div class="col-4 col-xs-12 text-xs-center">
                       	<h4 class="product-name"><a href="SpecificProductController?id=${wishlist.id}"><strong>${wishlist.name}</strong></a></h4>
                    </div>
					<div class="col-2 col-xs-4">
					       <div class="size">
					           <h4><strong>${wishlist.size}</strong></h4>
					    </div>
					</div>
					<div class="col-2 col-xs-4 text-xs-right">
					<h4><strong>${wishlist.price}<span class="text-muted"> RON</span></strong></h4>
					</div>
					<div class="btn-group" role="group" aria-label="wishlist buttons">
						 <div class="col-1 col-xs-2 text-right">
					     <form method="post" action="ProductController?id=${wishlist.id}">
					      <button type="submit" class="btn btn-primary btn-xs" >
					          <i class="fas fa-shopping-cart" aria-hidden="true"></i>
					      </button>
					     </form>
					 </div>
					 <div class="col-1 col-xs-2 text-right">
					     <form method="post" action="DeleteWController?id=${wishlist.id}">
					      <button type="submit" class="btn btn-primary btn-xs" >
					          <i class="fa fa-trash" aria-hidden="true"></i>
					      </button>
					     </form>
					 </div>
					</div>
					</div>
                    <hr>
				</c:forEach>

        </div>
	<%@include file="/footer.jspf" %>
    </body>
</html>
