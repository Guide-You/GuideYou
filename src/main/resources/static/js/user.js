document.addEventListener("DOMContentLoaded", function() {
	
	let validBtn = document.getElementById("valid--btn");
	let userId = document.getElementById("user--id") ? document.getElementById("user--id").value : '0';
	let signUpBtn = document.getElementById('signUpBtn');
	let nicknameInput = document.getElementById('nickname');
	let phoneInput = document.getElementById('phone');
	let signUpForm = document.forms['signUpForm'];
	let isNicknameValid = false // 닉네임유효성및중복여부를저장하는변수
	
	validBtn.addEventListener('click', function(e){
		e.preventDefault();
		
		checkNickName();
	});

	// 닉네임입력란의blur 이벤트리스너
	nicknameInput.addEventListener('blur', function(event) {
		// validateSignUpProfile 함수호출- 회원가입시true 반환
		isNicknameValid = checkNickName();
	});

	// 회원가입버튼클릭이벤트리스너
	signUpBtn.addEventListener('click', function(event) {
		event.preventDefault();

		// 닉네임 및 휴대폰번호 확인이 성공하면 폼제출
		if (isNicknameValid && checkPhoneNumber()) {

			signUpForm.nickname.value = nicknameInput.value.trim();
			signUpForm.phone.value = phoneInput.value.trim();

			alert("완료되었습니다");
			signUpForm.submit();
		} else {
			// 입력값을 확인해주세요.
			if (!isNicknameValid) {
				alert("닉네임 입력값을 확인해주세요.");
			} else {
				phoneInput.focus(); // 에러 메시지 후 입력란에 포커스 맞추기
			}
		}
	});

	// 닉네임유효성및중복체크함수
	function checkNickName() {
		var nickname = nicknameInput.value.trim(); // 닉네임입력값받아오기
		var phone = phoneInput.value.trim(); // 휴대폰번호입력값받아오기
		var nickLength = 0

		// 정규식패턴
		var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi

		// 닉네임길이계산
		for (var i = 0; i < nickname.length; i++) {
			nick = nickname.charAt(i);
			nickLength += escape(nick).length > 4 ? 2 : 1 // 한글2, 영문1로치환
		}

		// 닉네임유효성검사
		if (!nickname) {
			alert("닉네임입력은 필수입니다.");
			return false
		} else if (nickname.includes(" ")) {
			alert("닉네임은 빈칸을 포함할수없습니다.");
			return false
		} else if (nickLength < 2 || nickLength > 20) {
			alert("닉네임은 한글1~10자, 영문 및 숫자2~20자입니다.");
			return false
		} else if (specialCheck.test(nickname)) {
			alert("닉네임은 특수문자를 포함할수 없습니다.");
			return false
		} else {
			// AJAX 호출
			$.ajax({
				type: 'POST',
				url: "/member/checkNickname",
				data: { nickname: nickname,
						userId :  userId},
				error: function(err) {
					alert("실행중오류가발생하였습니다.");
				},
				success: function(data) {
					if (data != "Y") {
						alert("이미존재하는닉네임입니다.");
						isNicknameValid = false
					} else {
						alert("사용할수있는닉네임입니다.");
						isNicknameValid = true
					}
				}
			});
		}
		return isNicknameValid
	}

	// 휴대폰번호유효성함수
	function checkPhoneNumber() {
		var phone = phoneInput.value.trim(); // 휴대폰번호입력값받아오기

		if (!phone) {
			alert("휴대폰번호 입력은 필수입니다.");
			return false
		}
		// 추가적인휴대폰번호유효성검사로직을추가할수있습니다.

		return true
	}
});


document.addEventListener('DOMContentLoaded', function() {
	// nav bar 링크
	var navLinks = document.querySelectorAll('.aside--mypage .nav-link');

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

document.addEventListener('DOMContentLoaded', function() {
	// 체크박스들 세팅
	var checkboxes = document.querySelectorAll('.form-check-input');

	// 총합 화면
	var totalPriceDisplay = document.getElementById('totalPrice');

	// 총합 변수.
	var totalPrice = 0;

	//change 이벤트 (input 상태 변경될때 마다)
	checkboxes.forEach(function(checkbox) {
		checkbox.addEventListener('change', function() {
			// 체크 시 금액 추가
			if (checkbox.checked) {
				// 체크일때 ',' '원' 제거 후 금액 더하기
				var productPriceElement = checkbox.closest('tr').querySelector('#productPrice');
				var price = parseFloat(productPriceElement.textContent.replace('원', '').replace(',', '').trim());
				totalPrice += price;
			} else {
				// 체크 해제 일때 ',' '원' 제거 후 금액 빼기
				var productPriceElement = checkbox.closest('tr').querySelector('#productPrice');
				var price = parseFloat(productPriceElement.textContent.replace('원', '').replace(',', '').trim());
				totalPrice -= price;
			}

			// 총합 화면에서 금액 형식 + 원
			totalPriceDisplay.textContent = totalPrice.toLocaleString() + "원";
		});
	});
});