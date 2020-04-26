<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
     <head>
		<title>${sessionScope.user}'s profile</title>
		<%@include file="/head.jspf" %>
	</head>
    <body class="contact">
        <div id="content space">
        <%@include file="/navbar.jspf" %>
            <div class="space">
	            <h1>User:</h1>
	            <hr>
	            <div class="container">
	            	<div class="row">
	            		<div class="col-xs-6">
	            			<h3 class="space-10">Name: <cite>${sessionScope.userDetails.name }</cite></h3>
				            <h3 class="space-10">Username: <cite>${sessionScope.userDetails.username }</cite></h3>
				            <h3 class="space-10">Email: <cite>${sessionScope.userDetails.email }</cite></h3>
	            		</div>
	            		<div class="col-xs-6">
            				<div class="space-10">
            					<button type="button" class="btn btn-primary">Change password</button>
            				</div>
            				<div class="space-10">
            				<button type="button" class="btn btn-primary">See purchase history</button>
            				</div>
            				<div class="space-10">
            				<a href="wishList.jsp"><button type="button" class="btn btn-primary">See wish list</button></a>
            				</div>
	            		</div>
	            		
	            	</div>
	            </div>
            
            </div>
        </div>
    </body>
</html>

