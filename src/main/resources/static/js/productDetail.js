$(document).ready(function() {
	$('.carousel-item').bxSlider({
		auto: true,
		speed: 500,
		pause: 4000,
		mode: 'fade',
		autoControls: true,
		pager: true,
	});







});


$(document).ready(function() {

	let titleRate = document.getElementById('title--rate').value;

	// 평균 점수를 별로 표시하기 위한 함수
	function displayStars() {

		let stars = '';
		// 평균 점수를 0.0부터 5.0까지의 범위로 변환
		let roundedScore = Math.round(titleRate * 2) / 2;

		for (let i = 1; i <= 5; i++) {
			if (i <= roundedScore) {
				stars += '<i class="fas fa-star text-warning"></i>';
			} else if (i - roundedScore <= 0.5) {
				stars += '<i class="fas fa-star-half-alt text-warning"></i>';
			} else {
				stars += '<i class="far fa-star text-warning"></i>';
			}
		}

		return stars;
	}

	// 제품 평균 평점을 가져와서 별로 변환하여 표시
	let productAvgScore = parseFloat('${productAvg.avgScore}');
	let starsHtml = displayStars(productAvgScore);
	$('.title--rate').html(starsHtml);
});

document.addEventListener("DOMContentLoaded", function() {
	// span 요소 가져오기
	var titleLike = document.getElementById('title--like');
	var userId = document.getElementById('login--id').value;
	var productId = document.getElementById('product--id').value;

	// 클릭 이벤트 리스너 추가
	titleLike.addEventListener('click', function() {
		if (userId == null || userId == '') {
			console.log("최장호 : " + userId);
			if (confirm("로그인 하시겠습니까?")) {
				window.location.href = '/signIn'; // 메인 페이지 URL로 리다이렉트
				return;
			} 
		} else {
			// 클릭 이벤트 처리 코드 작성
			console.log('Like 이미지를 클릭했습니다.');

			// 예시: 이미지를 클릭할 때마다 이미지 소스 변경
			var image = titleLike.querySelector('img');
			if (image.src.includes('/img/like.png')) {
				console.log("여기선 삭제");
				$.ajax({
					type: 'GET',
					url: '/deleteWishList',
					data: {
						userId: userId,
						productId: productId
					},
					success: function(response) {
						console.log(response);
					},
					error: function(error) {
						console.error('Error saving markers:', error);
					}
				});
				image.src = '/img/unlike.png';
			} else {
				$.ajax({
					type: 'GET',
					url: '/saveWishList',
					data: {
						userId: userId,
						productId: productId
					},
					success: function(response) {
						console.log(response);
					},
					error: function(error) {
						console.error('Error saving markers:', error);
					}
				});
				console.log("여기선 추가");
				image.src = '/img/like.png';
			}
		}
	});
});