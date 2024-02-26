<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div class="form-group row mb-4 review--group">
  <div class="col-12">
    <label for="mm">���� �Ⱓ</label>
  </div>
  <!-- datepicker (�޷�) -->    
<!-- ���۽� �⺻ ��¥ ������ value�� �̿� -->
<div class="col-md-6">
  <div class="input-group">
    <input
      type="text"
      id="startDate"
      class="form-control datepicker"
      placeholder="���� �����"
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
      placeholder="���� ������"
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
      //Ŭ������ datepicker ����
      format: "yyyy-mm-dd", //������ ���� ����(yyyy : �� mm : �� dd : �� )
      autoclose: true, //����ڰ� ��¥�� Ŭ���ϸ� �ڵ� Ķ������ ����
      startDt: new Date("2024"),
      calendarWeeks: false,
      todayHighlight: true,
      language: "ko",
    })
    .datepicker("setEndDate", new Date());
  //���� ��¥�� ���� ��¥�� �����Ͽ� �����Ϸκ��� �����Ϻ��� ���� �Ұ�.;
});
</script>