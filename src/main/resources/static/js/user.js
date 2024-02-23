document.addEventListener("DOMContentLoaded", function() {
	var signUpBtn = document.getElementById('signUpBtn');
	var nicknameInput = document.getElementById('nickname');
	var phoneInput = document.getElementById('phone');
	var signUpForm = document.forms['signUpForm'];
	var isNicknameValid = false // 닉네임유효성및중복여부를저장하는변수

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

			alert("회원가입 되었습니다");
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
				data: { nickname: nickname },
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
	  // 네비게이션 바의 각 링크 요소들을 가져옵니다.
	  var navLinks = document.querySelectorAll('.aside--mypage .nav-link');

	  // 모든 링크에 'link-dark' 클래스를 추가합니다.
	  navLinks.forEach(function(navLink) {
		  navLink.classList.add('link-dark');
	  });

	  // 링크가 클릭될 때의 이벤트 리스너를 등록합니다.
	  navLinks.forEach(function(link) {
		  link.addEventListener('click', function() {
			  // 모든 링크에서 'active' 클래스를 제거하고 'link-dark' 클래스를 추가합니다.
			  navLinks.forEach(function(navLink) {
			   navLink.classList.remove('active', 'link-dark');
				  navLink.classList.add('link-dark');
			  });

			  // 클릭된 링크에 'active' 클래스를 추가하고 'link-dark' 클래스를 제거합니다.
			  this.classList.add('active');
			  this.classList.remove('link-dark');
		  });
	  });
  });