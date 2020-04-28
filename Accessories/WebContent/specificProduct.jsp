<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>tilbehør</title>
		<%@include file="/head.jspf" %>
	</head>
	<script>
		function Validate(stock) {
			var qty = document.getElementById("qty").value;
			if (qty > stock) {
		   		swal("Oops!", "Quantity bigger than stock!!", "error");
		       	return false;
	  		}
			return true;
		}
	</script>
	<body class="contact">
		<%@include file="/navbar.jspf" %>
		<div class="container">
		    <div class="row" style="padding: 25px 0px;">
		        <div class="col-xs-4">
		        	<img id="myImg" src="${product.image}" alt="${product.name}, ${product.brand}, ${product.material}" class="img-fluid img-thumbnail float-left" style="height: auto; width: 100%:">
					<div id="myModal" class="modal">
					  <span class="close">&times;</span>
					  <img class="modal-content" id="img01">
					  <div id="caption"></div>
					</div>
		        </div>
		        <div class="col-xs-5">
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
						<h3><strong>${product.price} RON</strong></h3>
						<c:if test="${not empty sessionScope.user && product.stock != 0}">
						<div class="form-element space-10">
		              		<label for="stock">Quantity</label>
		                    <input class="form-control" type="number" id="qty" name="qty" required>
		                </div>
						<div class="actionList">
						<a href="WishlistController?id=${product.id}"><button type="button" class="btn btn-sm btn-outline-primary zoom">
				          		<span class="glyphicon glyphicon-heart-empty"></span> Add to Wishlist
				        	</button></a>
						<button type="submit" class="btn btn-sm btn-outline-primary zoom" onclick="return Validate(${product.stock})">
				          	<span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart
				        </button>
						</div> 
						</c:if>
				
		    		</form>
					</div>
				</div>
		        <div class="col-xs-3">
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
