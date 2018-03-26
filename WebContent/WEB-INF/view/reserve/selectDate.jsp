<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/datepicker3.css" />
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap-datepicker.kr.js"></script>

  
  
  
  <h2 style="color:#2E64FE">예약 날짜 선택</h2>
  <h4 style="color:gray">${car.CNAME}</h4>
<form id="form" action="/reserve/result" method="post">
<input type="hidden" name="no" value="${car.NO }">
  <table>
  <tr><td><input type="text" name="start" readonly class="input-group input-append date" id="from"/></td>
  <td> ~ </td>
  <td><input type="text" name="end" readonly class="input-group input-append date" id="to"/></td></tr>
  </table>
  
</form>
  총 <span id="day">1</span>일 / <span id="price"></span>원<br/>
  <span id="msg"></span><br/>
  <button type="button" id="sub" style= "margin-left:315px" class="btn btn-primary">예약하기</button>
 <script>
 	var dateCheck=false;
 window.onload = function () {
		bw()
	}
 	
 	function check(){
		$.ajax({
			url: "/reserve/dateCheck",
			type: "POST",
			async:false,
			data : {
				"start" : $('#from').val(),
				"end" : $('#to').val(),
				"no" : '${car.NO}'
			},
			success: function(rst){
				if(rst.CNT==rst.RCNT){
					$("#msg").css("color","red");
					$("#msg").html("예약 불가능한 날짜입니다.");
					dateCheck=false;
				} else {
					$("#msg").css("color","green");
					$("#msg").html("예약 가능한 날짜 입니다.");
					dateCheck=true;
				}
			}
		});
 	}
 
	function bw(){
	 var between=(new Date($('#to').val())-new Date($('#from').val()))/1000/60/60/24+1
	 $('#day').html(between);
	 $('#price').html(between*${car.PRICE});
 }
	
	$("#sub").click(function(){
		check();
		if(dateCheck){
			$("#form").submit();
		}else{
			window.alert("예약가능한 날짜를 선택해주세요.")
		}
		
	});
 
 $('#from').datepicker({
	 format: "yyyy-mm-dd",
	 language: "kr",
	 startDate: new Date()
	 }).datepicker("setDate", new Date() );
 
 $('#to').datepicker({
	 format: "yyyy-mm-dd",
	 language: "kr",
	startDate: new Date()
 		
	 }).datepicker("setDate", new Date() );
	 
 $('#from').change(function(){
	 if($('#from').val()>$('#to').val()){
	 $('#to').val($('#from').val())
	 }
	 bw();
	 check();
 })
 
  $('#to').change(function(){
	 if($('#from').val()>$('#to').val()){
	 $('#from').val($('#to').val())
	 }
	 bw();
	 check();
 })
 
 
 </script>
  