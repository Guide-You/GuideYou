
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
  	
    // 객체 초기화
    IMP.init(imp_uid); // 가맹점 식별코드

    const kakaopayBtn = document.getElementById("kakaopay--btn");

    kakaopayBtn.onclick = function requestPay() {
			  console.log("kakaoBtn  클릭 인식!");
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
            
			await savePayment(rsp);
			
			console.log("success");
            
          } else {
			  
            console.log("fail");
			alert(`결제에 실패하였습니다. ${rsp.error_msg}`);
            //return;
          }
        })
    };
    
   // 결제 정보 저장
   async function savePayment(rsp) {
	   console.log("savePayment 실행!");
	   console.log("rsp"+JSON.stringify(rsp, null, 2));
	    try {
	   		console.log("data 생성!!");
	        // 필요한 데이터 구성
	        let postData = {
				impUid: imp_uid,
	            merchantUid: rsp.merchant_uid,
	            userId: rsp.buyer_name,
	            productId: productId,
	            productTitle: rsp.name,
	            totalPrice: rsp.paid_amount,
	            paymentStatus: rsp.status,
	            orderUserId: orderSellerId
	        };
	
			console.log("결제정보 : " +postData);
	        // fetch를 이용한 비동기 POST 요청
	        let response = await fetch('/paySuccess', {
	            method: 'POST',
	            headers: {'Content-Type': 'application/json'},
	            body: JSON.stringify(postData)
	        });
	
	        if (response.ok) {
				if(confirm("결제가 완료되었습니다. 결제 내역을 확인하시겠습니까?")){
					
					//let responseData = await response.json();
					//console.log("응답 데이터 : " + responseData);
					// /complete/{completeId}로 넘어가고싶어요
					// 빽에서 findby(merchantUid)로 조회해
					// 
					
					
					
					
					
            	window.location.href="/complete"
				} else{
					window.location.href="/main"
				}
				
            //alert("결제가 완료되었습니다.");
            
            
	        } else {
	            alert("결제에 실패했습니다")
	        }
	    } catch (e) {
	        console.error("실패", e.message);
	            alert("결제에 실패했습니다")
	    }
	}
	
	
	
	

    
    
  });