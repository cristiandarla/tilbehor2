<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title>ACCESSORIES - Login</title>
		<%@include file="/head.jspf" %>
	</head>
	<body class="contact">
		
		<%@include file="/navbar.jspf" %>
		<div class="container-contact100">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2848.677095930234!2d26.050500615393865!3d44.439785479102184!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40b201c227bb49d5%3A0xd90c887a15dee2ac!2sFaculty%20of%20Engineering%20in%20Foreign%20Languages!5e0!3m2!1sen!2sro!4v1585929447836!5m2!1sen!2sro" width="800" height="600" frameborder="15" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
		<div class="wrap-contact100">
			<form class="contact100-form validate-form" method="post" action="ContactController">
				<span class="contact100-form-title">
					Contact Us
				</span>

				<div class="wrap-input100 validate-input" data-validate="Name is required">
					<span class="label-input100">Name</span>
					<input class="input100" type="text" name="name" placeholder="Name...">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
					<span class="label-input100">Email</span>
					<input class="input100" type="text" name="email" placeholder="Email addess...">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100">
					<span class="label-input100">Phone</span>
					<input class="input100" type="text" name="phone" placeholder="Phone Number...">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "Message is required">
					<span class="label-input100">Message</span>
					<textarea class="input100" name="message" placeholder="Questions/Comments..."></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn">
						<div class="contact100-form-bgbtn"></div>
						<button class="contact100-form-btn">
							Send
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	</body>
</html>
