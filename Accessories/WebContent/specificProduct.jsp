<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>tilbehør</title>
		<%@include file="/head.jspf" %>
	</head>
	<body class="contact">
		<%@include file="/navbar.jspf" %>
		<div class="container h-75">
		    <div class="row pt-4">
		        <div class="col-4 col-xs-4">
		        	<img id="myImg" src="${product.image}" alt="${product.name}, ${product.brand}, ${product.material}" class="img-fluid img-thumbnail float-left" style="height: auto; width: 100%:">
					<div id="myModal" class="modal">
					  <span class="close">&times;</span>
					  <img class="modal-content" id="img01">
					  <div id="caption"></div>
					</div>
		        </div>
		        <div class="col-5 col-xs-5">
		        	<div style="padding: 15px 15px;">
						<h5><strong>NAME:</strong> ${product.name}</h5>
						<h5><strong>BRAND:</strong> ${product.brand}</h5>
						<h5><strong>COLOR:</strong> ${product.color}</h5>
						<h5><strong>MATERIAL:</strong> ${product.material}</h5>
						<h5><strong>SIZE:</strong> ${product.size}</h5>
						
		    		<form method="post" action="BuyController?id=${product.id}">
		    			<c:choose>
		    			<c:when test="${product.stock == 0}">
		    			<div class="form-element space-10">
		                    <input readonly class="form-control-plaintext" type="text" value="OUT OF STOCK">
		                </div>
		    			</c:when>
		    			</c:choose>
						<h2><strong>${product.price} RON</strong></h2>
						<c:if test="${empty sessionScope.user}">
						<div class="pt-2">
							<h6 class="mb-2">Log in to add a product in cart or to the wishlist</h6>
							<a href="login.jsp"><button type="button" class="btn btn-ml btn-dark zoom">
				          		<span class="glyphicon glyphicon-heart-empty"></span> Login
				        	</button></a>
						</div>
						</c:if>
						<c:if test="${not empty sessionScope.user && product.stock != 0}">
						<div class="form-element space-10">
		              		<label for="stock">Quantity</label>
		              		<c:choose>
		              		<c:when test="${product.stock > 5}">
		              		<select class="custom-select" id="qty" name="qty">
		              			<option value="1">1</option>
		              			<option value="2">2</option>
		              			<option value="3">3</option>
		              			<option value="4">4</option>
		              			<option value="5">5</option>
		              		</select>
		              		</c:when>
		              		<c:otherwise>
		              		<br><small>This product is low on stock! Take it NOW!</small>
		              		<select class="custom-select" id="qty" name="qty">
		              		<c:forEach var="qtyCount" begin="1" end="${product.stock}">
		              			<option value="${qtyCount}">${qtyCount}</option>
		              		</c:forEach>
		              		</select>
		              		</c:otherwise>
		              		</c:choose>
		                </div>
						<div class="actionList">
						<a href="WishlistController?id=${product.id}"><button type="button" class="btn btn-ml btn-dark zoom">
				          		<span class="glyphicon glyphicon-heart-empty"></span> Add to Wishlist
				        	</button></a>
						<button type="submit" class="btn btn-ml btn-dark zoom">
				          	<span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart
				        </button>
						</div> 
						</c:if>
				
		    		</form>
					</div>
				</div>
		        <div class="col-3 col-xs-3">
		        </div>
		    </div>
		</div>
		<script>
			// Get the modal
			var modal = document.getElementById("myModal");
			
			// Get the image and insert it inside the modal - use its "alt" text as a caption
			var img = document.getElementById("myImg");
			var modalImg = document.getElementById("img01");
			var captionText = document.getElementById("caption");
			img.onclick = function(){
			  modal.style.display = "block";
			  modalImg.src = this.src;
			  captionText.innerHTML = this.alt;
			}
			
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];
			
			// When the user clicks on <span> (x), close the modal
			span.onclick = function() { 
			  modal.style.display = "none";
			}
		</script>
	<%@include file="/footer.jspf" %>
	</body>
</html>
