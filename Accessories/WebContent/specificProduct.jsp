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
						<p>NAME: ${product.name}</p>
						<p>BRAND: ${product.brand}</p>
						<p>COLOR: ${product.color}</p>
						<p>MATERIAL: ${product.material}</p>
						<p>SIZE: ${product.size}</p>
						<p>STOCK: ${product.stock}</p>
						<p><strong>${product.price} RON</strong></p>
						<button type="button" class="btn btn-default btn-sm btn-outline-warning">
			          		<span class="fas fa-balance-scale"></span> Add to compare
			        	</button>
						<c:if test="${not empty sessionScope.user}">
						<div class="actionList">
							<button type="button" class="btn btn-default btn-sm btn-outline-primary">
				          		<span class="glyphicon glyphicon-heart-empty"></span> Add to wishlist
				        	</button>
						<button type="button" class="btn btn-default btn-sm btn-outline-primary">
				          	<span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart
				        </button>
						</div> 
						</c:if>
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
	</body>
</html>
