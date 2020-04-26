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
            <h1>Select what you want to do:</h1>
	            <div class="form-element space">
	               <a href="addProducts.jsp"><button type="submit" class="btn btn-success">Add Product</button></a>
	               <a href="removeProducts.jsp"><button type="submit" class="btn btn-danger">Remove Product</button></a>
	           </div>
        </div>
    </body>
</html>

