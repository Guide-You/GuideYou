	
	
	let reviewModalButton = document.getElementById('review--modal--btn');
	let reviewButton = document.getElementById('review--button');
	
	let reviewProductId = document.getElementById('review--product--id').value;
	
	
	reviewModalButton.addEventListener('click', function(e){
		console.log("들어욤")
		console.log("reviewProductId" + reviewProductId)
		
		$.ajax({
			type: 'POST',
			url: "/checkReview",
			data: JSON.stringify({ reviewProductId: reviewProductId }),
			headers : { // Http header
      			"Content-Type" : "application/json"
    		},
			error: function(data){
				alert('이미 작성한 리뷰입니다.')
				window.location.reload();
				e.preventDefault;
			},
			success: function(data) {
				// review 데이터가 0(작성 내역이 없을시) modal 실행 
				  $("#review--modal").appendTo("#modal-container");
				  $("#review--modal").modal({
				    backdrop: "static",
				    show: false,
				  });
			}
		})
	});
	
	reviewButton.addEventListener('click', function(e){

		let sendReview = document.getElementById('send--review--form');
		
		sendReview.action = '/saveReview';
		sendReview.method = 'post';
		
		sendReview.submit();
		


	});

	