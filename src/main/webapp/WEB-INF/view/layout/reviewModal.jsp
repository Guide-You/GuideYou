<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!-- review modal start -->
<div
  class="modal fade"
  id="review--modal"
  tabindex="-1"
  aria-labelledby="exampleModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content rounded-0">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Review 등록</h5>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="modal"
          aria-label="Close"
        ></button>
      </div>
      <div class="d-flex main-content">
        <div class="content-text p-4">
          <span>구매 플랜 : <a href="">[부산] 기장으로 오세요</a></span>
          <p>
            구매하신 플랜에 대해 리뷰 작성을 해주세요!
            <br />
            해당 리뷰는 다른 플랜 구매자에게 큰 도움이 될 수 있습니다
          </p>
          <form action="#">
            <div class="form-group review--group">
              <label for="review--register--title">리뷰 제목</label>
              <input
                type="text"
                class="form-control review--register--title"
                placeholder="Review Title"
              />
            </div>
            <div class="form-group review--group">
              <label for="review--register--content">리뷰 내용</label>
              <input
                type="text"
                class="form-control review--content--input" placeholder="Enter content"
              />
            </div>
            <div class="form-group row mb-4 review--group">
              <div class="col-12">
                <label for="mm">여행 기간</label>
              </div>
              <!-- datepicker (달력) -->
              <!-- 시작시 기본 날짜 설정은 value를 이용 -->
              <div class="col-md-6">
                <div class="input-group">
                  <input
                    type="text"
                    id="startDate"
                    class="form-control datepicker"
                    placeholder="여행 출발일"
                  />
                  <label class="input-group-text" for="startDate"
                    ><i class="fa-solid fa-calendar"></i
                  ></label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="input-group">
                  <input
                    type="text"
                    id="startDate"
                    class="form-control datepicker"
                    placeholder="여행 종료일"
                  />
                  <label class="input-group-text" for="endDate"
                    ><i class="fa-solid fa-calendar"></i
                  ></label>
                </div>
              </div>
			  <div class="form-group review--group">
	              <label for="review--file--upload">리뷰 사진</label>
	              <input
	                type="file"
	                class="form-control"
	              />
	           </div>
            
              
              <div class="form-group">
                <input
                  type="submit"
                  value="리뷰 등록"
                  class="btn btn-primary btn-block review--btn"
                />
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- review modal end -->

<script>
// datepicker
$(function () {
  $(".datepicker")
    .datepicker({
      //클래스로 datepicker 적용
      format: "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
      autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫힘
      startDt: new Date("2024"),
      calendarWeeks: false,
      todayHighlight: true,
      language: "ko",
    })
    .datepicker("setEndDate", new Date());
  //종료 날짜를 오늘 날짜로 선언하여 현재일로부터 다음일부터 선택 불가.;
});
</script>