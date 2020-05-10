function Validate() {
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("rpassword").value;
	if (password != confirmPassword) {
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: 'Passwords do not match!'
		});
		return false;
	}
	return true;
}