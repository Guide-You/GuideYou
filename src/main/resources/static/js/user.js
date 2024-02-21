function validateSignUpProfile() {
    var nickname = document.getElementById('nickname').value.trim();
    var phone = document.getElementById('phone').value.trim();

    if (!nickname) {
        alert("닉네임은 필수 입력 사항입니다.");
        return false;
    }

    if (!phone) {
        alert("휴대폰 번호는 필수 입력 사항입니다.");
        return false;
    }

    console.log("validateSignUpProfile 함수 실행됨");  // 추가된 부분

    alert("회원가입되었습니다");
    // 다른 필요한 검증 로직이 있다면 여기에 추가
    return true;
}