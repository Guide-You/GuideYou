
  document.addEventListener("DOMContentLoaded", function () {
    var IMP = window.IMP;
    
      // payment -> paymentAPI
  const orderId = document.getElementById("order--id").value;
  const orderTitle = document.getElementById("order--title").value;
  const orderSeller = document.getElementById("order--seller").value;
  const orderPrice = document.getElementById("order--price").value;


    // 객체 초기화
    IMP.init("imp50236035"); // 가맹정 식별코드

    const kakaopayBtn = document.getElementById("kakaopay--btn");

    kakaopayBtn.onclick = function requestPay() {
      IMP.request_pay(
        {
          pg: "kakaopay",
          pay_method: "card",
          merchant_uid: "ORD2018013122-" + orderId, // 주문번호, 매번 고유한 번호가 생성 되어야함, 자동생성되는 날짜나 시간같은거 받아와야 할 듯, 로직 생각해보기 -> payment id auto 대체할지 확인
          name: orderTitle,
          amount: orderPrice, // 숫자 타입
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181",
        },
        function (rsp) {
          // callback
          // rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
          if (rsp.success) {
            alert("결제 완료:", rsp);
            console.log("success", rsp);
          } else {
            console.log("fail", rsp);

            return;
          }
        }
      );
    };
  });