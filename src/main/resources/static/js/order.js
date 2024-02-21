document.addEventListener("DOMContentLoaded", function(){

	
	// detail -> payment
	const productId = document.getElementById('product--id').value;
	const productTitle = document.getElementById('product--title').value;
	const productSeller = document.getElementById('product--seller').value;
	const productPrice = document.getElementById('product--price').value;
	
	let orderButton = document.getElementById('order--button');
	
	orderButton.addEventListener('click', function(e){

		e.preventDefault();

		let sendForm = document.getElementById('send--detail--form');
		
		sendForm.action = '/process-order';
		sendForm.method = 'post';
		
		sendForm.submit();
		
	});

	
});