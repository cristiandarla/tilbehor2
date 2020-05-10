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
	            <div class="container-fluid">
	            	<div class="row">
	            		<div class="col-9 col-xs-9">
	            			<h3 class="space-10">Name: <cite>${requestScope.userDetails.name }</cite></h3>
	            		</div>
	            		<div class="col-3 col-xs-3 ">
            				<div class="space-10">
            					<a href="changePswd.jsp"><button type="button" class="btn btn-primary btn-lg btn-block pull-right">Change password</button></a>
            				</div>
	            		</div>
	            	</div>
	            	<div class="row">
	            		<div class="col-9 col-xs-9">
				            <h3 class="space-10">Username: <cite>${requestScope.userDetails.username }</cite></h3>
	            		</div>
	            		<div class="col-3 col-xs-3 ">
            				<div class="space-10">
            					<a href="OrderController?client=true&id=${requestScope.userDetails.id}"><button type="button" class="btn btn-primary btn-lg btn-block pull-right">See purchase history</button></a>
            				</div>
	            		</div>
	            	</div>
	            	<div class="row">
	            		<div class="col-9 col-xs-9">
	            			<h3 class="space-10">Email: <cite>${requestScope.userDetails.email }</cite></h3>
	            		</div>
	            		<div class="col-3 col-xs-3 ">
            				<div class="space-10">
            					<a href="wishList.jsp"><button type="button" class="btn btn-primary btn-lg btn-block pull-right">See wish list</button></a>
            				</div>
	            		</div>
	            	</div>
	            </div>
            
            </div>
        </div>
	<%@include file="/footer.jspf" %>
    </body>
</html>

