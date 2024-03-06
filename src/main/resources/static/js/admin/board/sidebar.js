document.addEventListener('DOMContentLoaded', function() {
	// nav bar 링크
	var navLinks = document.querySelectorAll('.aside--board .nav-link');

	// 클릭 이벤트
	navLinks.forEach(function(link) {
		link.addEventListener('click', function() {
			// 활성화(active), 비활성화(link-dark) 제거, 전부 비활성화(link-dark) 추가
			navLinks.forEach(function(navLink) {
				navLink.classList.remove('active', 'link-dark');
				navLink.classList.add('link-dark');
			});

			// 클릭하면 활성화(active) 추가, 비활성화(link-dark) 제거
			this.classList.add('active');
			this.classList.remove('link-dark');
		});
	});
});