document.addEventListener("DOMContentLoaded", function () {
    var signUpBtn = document.getElementById('signUpBtn');

    // 클릭 이벤트 리스너
    signUpBtn.addEventListener('click', function (event) {
        event.preventDefault();
        
        // validateSignUpProfile 함수 호출 - 회원 가입시 true 반환
        if (checkNickName()) {
            // 회원가입 폼 submit
            signUpForm.submit();
        }
    });

    // 회원가입 유효성 함수
    function checkNickName() {
        var nickname = document.getElementById('nickname').value.trim(); // 닉네임 입력값 받아오기
        var nickLength = 0;

        // 정규식 패턴
        var engCheck = /[a-z]/;
        var numCheck = /[0-9]/;
        var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

        // 닉네임 길이 계산
        for (var i = 0; i < nickname.length; i++) {
            nick = nickname.charAt(i);
            nickLength += escape(nick).length > 4 ? 2 : 1; // 한글 2, 영문 1로 치환
        }

        // 닉네임 유효성 검사
        if (!nickname) {
            alert("닉네임 입력은 필수입니다.");
            return false;
        } else if (nickname.includes(" ")) {
            alert("닉네임은 빈 칸을 포함할 수 없습니다.");
            return false;
        } else if (nickLength < 2 || nickLength > 20) {
            alert("닉네임은 한글 1~10자, 영문 및 숫자 2~20자 입니다.");
            return false;
        } else if (specialCheck.test(nickname)) {
            alert("닉네임은 특수문자를 포함할 수 없습니다.");
            return false;
        } else {
            $.ajax({
                type: 'POST',
                url: "Controller를 찾아가는 URL",
                data: { data: nickname },
                error: function (err) {
                    alert("실행중 오류가 발생하였습니다.");
                },
                success: function (data) {
                    if (data != null) {
                        alert("사용할 수 있는 닉네임입니다.");
                        return true;
                    } else {
                        alert("사용할 수 없는 닉네임입니다.");
                        return false;
                    }
                }
            });
        }
    }
});