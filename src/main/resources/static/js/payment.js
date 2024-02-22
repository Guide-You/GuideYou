
  document.addEventListener("DOMContentLoaded", function () {
    var IMP = window.IMP;
    
    // payment.jsp -> paymentAPI
  	const productId = document.getElementById("order--id").value;
  	const orderTitle = document.getElementById("order--title").value;
  	const orderSeller = document.getElementById("order--seller").value;
  	const orderPrice = document.getElementById("order--price").value;
    // 객체 초기화
    IMP.init("imp50236035"); // 가맹점 식별코드

    const kakaopayBtn = document.getElementById("kakaopay--btn");

    kakaopayBtn.onclick = function requestPay() {
      IMP.request_pay(
        {
          pg: "kakaopay",
          pay_method: "card",
          merchant_uid: 'kpay_' + new Date().getTime() , // 주문번호, 매번 고유한 번호가 생성 되어야하기 때문에 날짜와 시간 값과 product Id 넣어 줌
          name: orderTitle,
          amount: orderPrice, // 가격
          buyer_email: "gildong@gmail.com", // 회원 email정보
          buyer_name: orderSeller,	// 회원 이름
          buyer_tel: "010-4242-4242",	// 회원 전화번호
          buyer_addr: "서울",	// location 
        },
        function (data) {
          // callback
          if (data.success) {		
            alert("결제 완료");
            console.log(data);
            
            $.ajax({
				type: "post",
				url: '/paySuccess',
				data:{
					"merchantUid" : data.merchant_uid,
					"userId" : data.buyer_name,
					"productId" : productId,
					"productTitle" : data.name,
					"productPrice" : data.paid_amount,
					"paymentStatus" : data.status,
				}
			})
            
            console.log("success", data);
          } else {
			  
            console.log("fail", data);
			alert("결제에 실패했습니다. 다시 결제 부탁드립니다")
            return;
          }
        }
      );
    };
  });