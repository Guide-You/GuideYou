$(document).ready(function() {
    $('.carousel-item').bxSlider({
        auto : true,
        speed : 500,
        pause : 4000,
        mode : 'fade',
        autoControls : true,
        pager : true,
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