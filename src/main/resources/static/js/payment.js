document.addEventListener("DOMContentLoaded", function(){
	var IMP = window.IMP;
	
	// 객체 초기화
	IMP.init("imp50236035"); // 가맹정 식별코드
	
	const kakaopayBtn = document.getElementById('kakaopay--btn');
	
	
	kakaopayBtn.onclick = function requestPay() {
		IMP.request_pay({
		    pg: 'kakaopay',
		    pay_method: 'card',
		    merchant_uid: "ORD20180131-0000013",   // 주문번호
		    name: '노르웨이 회전 의자',
		    amount: 6490000,                         // 숫자 타입
		    buyer_email: "gildong@gmail.com",
		    buyer_name: "홍길동",
		    buyer_tel: "010-4242-4242",
		    buyer_addr: "서울특별시 강남구 신사동",
		    buyer_postcode: "01181"
		    
		}, 
		function (rsp) { // callback
		    // rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		    if (rsp.success){
				
		        console.log("success", rsp);
		        
		    } else {
		        console.log("fail", rsp);
		        
		        return;
		    }
		});
	}
	

	
	
	
});