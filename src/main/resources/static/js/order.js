document.addEventListener("DOMContentLoaded", function(){


	let orderButton = document.getElementById('order--button');
	
	orderButton.addEventListener('click', function(e){

		e.preventDefault();

		let sendForm = document.getElementById('send--detail--form');
		
		sendForm.action = '/order';
		sendForm.method = 'post';
		
		sendForm.submit();
		
	});

	
});