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
  
  <%@ include file="calendar.jsp" %>
  <table>
  <tr><td><input type="text" readonly class="input-group input-append date" id="from"/></td>
  <td> ~ </td>
  <td><input type="text" readonly class="input-group input-append date" id="to"/></tr>
  </table>
  총<span id="day"> 1</span>일 / <span id="price"></span>원
<button type="button" id="sub" style= "margin-left:315px" class="btn btn-primary">예약하기</button>
  
 <script>
 window.onload = function () {
		bw()
	}
 
 var oneDay=1000*60*60*24
	function bw(){
	 var between=(new Date($('#to').val())-new Date($('#from').val()))/1000/60/60/24+1
	 $('#day').html(between);
	 $('#price').html(between*${car.PRICE});
 }
 
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
 })
 
  $('#to').change(function(){
	 if($('#from').val()>$('#to').val()){
	 $('#from').val($('#to').val())
	 }
	 bw();
 })
 
 
 </script>
  