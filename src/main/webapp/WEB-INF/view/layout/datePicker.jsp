<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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