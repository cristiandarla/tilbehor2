<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title>ACCESSORIES - Login</title>
		<%@include file="/head.jspf" %>
		
	</head>
	<body class="home">
		
		<%@include file="/navbar.jspf" %>
		<div class="container contact-data">
			<div class="row space">
				<div class="col embed-responsive embed-responsive-16by9">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2848.677095930234!2d26.050500615393865!3d44.439785479102184!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40b201c227bb49d5%3A0xd90c887a15dee2ac!2sFaculty%20of%20Engineering%20in%20Foreign%20Languages!5e0!3m2!1sen!2sro!4v1585929447836!5m2!1sen!2sro" width="100%" height="500px" style="" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
				</div>
			</div>
			<div class="row space">
				<div class="col">
					<h4><strong>Address:</strong>&nbsp;Splaiul Independen&#x21B;ei 313, Bucharest, CP 060042, Romania</h4>
					<h4><strong>Phone:</strong> &nbsp;+40 745 xxx xxx</h4>
				</div>
			</div>
			<div class="row space">
				<div class="col space-10">
					<form action="contactController" method="post">
					<c:choose>
					<c:when test="${not empty sessionScope.user}">
					<div class="form-group">
					    <label for="formGroupExampleInput">Name</label>
					    <input type="text" class="form-control" id="formGroupExampleInput" value="${sessionScope.user}" name="name" required>
					</div>
					</c:when>
					<c:otherwise>
					<div class="form-group">
					    <label for="formGroupExampleInput">Name</label>
					    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Name" name="name" required>
					  </div>
					</c:otherwise>
					</c:choose>
					  <div class="form-group">
					    <label for="exampleInputEmail1">Email address</label>
					    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email" required>
					    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
					  </div>
					  <div class="form-group">
					    <label for="formGroupExampleInput">Subject</label>
					    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Subject" name="subject" required>
					  </div>
					  <div class="form-group">
					    <label for="exampleFormControlTextarea1">Message</label>
    					<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="message" required="required"></textarea>
					  </div>
					  <div class="form-check">
					    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="privacy">
					    <label class="form-check-label" for="exampleCheck1">privacy, blah blah blah blah</label>
					  </div>
					  <button type="submit" class="btn btn-primary" onclick="return Function()">Submit</button>
					</form>
				</div>
			</div>
		</div>
	<%@include file="/footer.jspf" %>
	</body>
</html>
