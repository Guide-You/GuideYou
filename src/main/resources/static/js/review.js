document.addEventListener("DOMContentLoaded", function(){


	let reviewButton = document.getElementById('review--button');
	
	 function submitReview(){
		let reviewTitle = document.getElementById('review--title').value;
		let reviewContent = document.getElementById('review--content').value;
		let reviewScore = document.getElementById('review--score').value;
		
		console.log('title : ' + reviewTitle);
		console.log('content : ' + reviewContent);
		console.log('score : ' + reviewScore); 


	    $.ajax({
	        type: "POST",
	        url: "/saveReview",
	        data: JSON.stringify({ title: title, content: content, score: score }),
	        contentType: "application/json",
	        success: function(response) {
	            $("#responseMessage").text("리뷰가 성공적으로 등록되었습니다.");
	        },
	        error: function(xhr, status, error) {
	            $("#responseMessage").text("리뷰 등록에 실패했습니다. 다시 시도해주세요.");
	        }
	    });
		
	};
	


}
});