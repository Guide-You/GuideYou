
  document.addEventListener("DOMContentLoaded", function () {
    var IMP = window.IMP;
    
    // payment.jsp -> paymentAPI
  	const productId = document.getElementById("order--id").value;
  	const orderTitle = document.getElementById("order--title").value;
  	const orderSellerId = document.getElementById("order--seller--id").value;
  	const orderPrice = document.getElementById("order--price").value;
  	const orderUserId = document.getElementById("order--user--id").value;
  	
  	// 포트원 info
  	let imp_uid = 'imp50236035';
    let reason = '테스트용 환불 사유';
  	
  	let merchantUid ;
  	
  	
  	
    // 객체 초기화
    IMP.init(imp_uid); // 가맹점 식별코드

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
          buyer_name: orderUserId,
          buyer_tel: "010-4242-4242",	// 회원 전화번호
          buyer_addr: "서울",	// location 
        }, async function (rsp) {
          // callback
          if (rsp.success) {
			console.log("success", data);
            alert("결제가 완료되었습니다.");
            
			await savePayment();
            
          } else {
			  
            console.log("fail", data);
			alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
            //return;
          }
        })
    };
    
    // 결제 정보 저장
   async function savePayment(data) {
	    try {
	        // 필요한 데이터 구성
	        let postData = {
	            merchantUid: data.merchant_uid,
	            userId: data.buyer_name,
	            productId: productId,
	            productTitle: data.name,
	            totalPrice: data.paid_amount,
	            paymentStatus: data.status,
	            orderUserId: orderSellerId
	        };
	
	        // fetch를 이용한 비동기 POST 요청
	        let response = await fetch('/paySuccess', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json'
	            },
	            body: JSON.stringify(postData)
	        });
	
	        if (response.ok) {
	            console.log("결제 정보 저장 완료");
	            // 저장 완료시 로직
	        } else {
	            console.error("실패", response.statusText);
	        }
	    } catch (e) {
	        console.error("실패", e.message);
	    }
	}

    
    
  });