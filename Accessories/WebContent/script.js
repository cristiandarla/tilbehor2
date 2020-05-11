$(document).ready(function() {
    $('button#categ').click(function() {
    	let now = $('button#categ').val();
    	if(now === 'Expand'){
    		this.value= 'Contract';
    		$('button#categ').html('Contract');
    	}else{
            this.value = 'Expand';
            $('button#categ').html('Expand');
    	}
    });
    $('button#material').click(function() {
    	let now = $('button#material').val();
    	if(now === 'Expand'){
    		this.value= 'Contract';
    		$('button#material').html('Contract');
    	}else{
            this.value = 'Expand';
            $('button#material').html('Expand');
    	}
    });
    $('button#brand').click(function() {
    	let now = $('button#brand').val();
    	if(now === 'Expand'){
    		this.value= 'Contract';
    		$('button#brand').html('Contract');
    	}else{
            this.value = 'Expand';
            $('button#brand').html('Expand');
    	}
    });
    $('button#sex').click(function() {
    	let now = $('button#sex').val();
    	if(now === 'Expand'){
    		this.value= 'Contract';
    		$('button#sex').html('Contract');
    	}else{
            this.value = 'Expand';
            $('button#sex').html('Expand');
    	}
    });
});

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