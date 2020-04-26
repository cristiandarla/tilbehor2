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
        <div id="content">
        <%@include file="/navbar.jspf" %>
            <div class="space">
            <h1>Add products:</h1>
            <form method="post" action="AddProductController">
              	<div class="form-element space-10">
              		<label for="name">Name</label>
                    <input class="form-control" type="text" name="name" required>
                </div>
                <div class="form-element space-10">
              		<label for="desc">Sex</label>
                    <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="desc"value="male" required>
					  <label class="form-check-label" for="inlineRadio1">Male</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="desc" value="female">
					  <label class="form-check-label" for="inlineRadio2">Female</label>
					</div>
                </div>
                <div class="form-element space-10">
              		<label for="name">Color</label>
                    <input class="form-control" type="text" name="color" required>
                </div>
                <div class="form-element space-10">
              		<label for="name">Material</label>
                    <input class="form-control" type="text" name="material" required>
                </div>
                <div class="form-element space-10">
              		<label for="name">Category</label>
                    <input class="form-control" type="text" name="category" required>
                </div>
                <div class="form-element space-10">
              		<label for="name">Brand</label>
                    <input class="form-control" type="text" name="brand" required>
                </div>
                <div class="form-element space-10">
              		<label for="name">Size</label>
                    <input class="form-control" type="text" name="size" required>
                </div>
                <div class="form-element space-10">
              		<label for="price">Price per unit</label>
                    <input class="form-control" type="number" name="price" required>
                </div>
                <div class="form-element space-10">
              		<label for="stock">Stock</label>
                    <input class="form-control" type="number" name="stock" required>
                </div>
                <div class="form-element space-10">
                   <label for="image">Image</label>
                    <input class="form-control" enctype="multipart/form-data" type="file" name="image" accept="image/*" required>
               </div>   
                <div class="form-element space-10">
                   	<button type="submit" class="btn btn-sm btn-primary">
			        	<span class="glyphicon glyphicon-shopping-cart"></span> Submit
			       	</button>
                   	<button type="reset" class="btn btn-sm btn-light">
			          	<span class="glyphicon glyphicon-shopping-cart"></span> Reset
			        </button>
               </div>
            </form>
            </div>
        </div>
    </body>
</html>