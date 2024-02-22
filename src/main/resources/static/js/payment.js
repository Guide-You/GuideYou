
  document.addEventListener("DOMContentLoaded", function () {
    var IMP = window.IMP;
    
      // payment -> paymentAPI
  	const orderId = document.getElementById("order--id").value;
  	const orderTitle = document.getElementById("order--title").value;
  	const orderSeller = document.getElementById("order--seller").value;
  	const orderPrice = document.getElementById("order--price").value;
	let date = new Date()

    // 객체 초기화
    IMP.init("imp50236035"); // 가맹점 식별코드

    const kakaopayBtn = document.getElementById("kakaopay--btn");

    kakaopayBtn.onclick = function requestPay() {
      IMP.request_pay(
        {
          pg: "kakaopay",
          pay_method: "card",
          merchant_uid: 'merchant_' + date.getTime() + orderId , // 주문번호, 매번 고유한 번호가 생성 되어야하기 때문에 날짜와 시간 값과 product Id 넣어 줌
          name: orderTitle,
          amount: orderPrice, // 가격
          buyer_email: "gildong@gmail.com", // 회원 email정보
          buyer_name: orderSeller,	// 회원 이름
          buyer_tel: "010-4242-4242",	// 회원 전화번호
          buyer_addr: "서울특별시 강남구 신사동",	// 주소
          buyer_postcode: "01181",	// 우편번호
        },
        function (data) {
          // callback
          if (data.success) {		
            alert("결제 완료:", data);
            
            $.ajax({
				type: "post",
				url: '/paySuccess',
				data:{
					"merchantUid" : data.merchant_uid,
					"userId" : data.buyer_name,
				}
			})
            
            console.log("success", data);
          } else {
			  
            console.log("fail", data);

            return;
          }
        }
      );
    };
  });