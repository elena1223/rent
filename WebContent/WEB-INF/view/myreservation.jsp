<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
  <title>나의 예약관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
table { 
	table-layout:fixed;
	border: 2px; 
	text-align : center;
	}

td{
	width: 25%;
	vertical-align: middle;
	}
	
th{
	text-align: center;
	}
	
</style>
<body>


<div>
  <h2 style="color: #2E64FE">예약관리</h2>
  <div style="border-top:2px solid #ccc;"></div>
  <p style="margin-top: 10px;"> <small>취소신청 시, 당일 취소라도 100% 환불가능하며, 차량을 이용하시다 취소 시 1일 요금을 제외한 나머지를 위약금 없이 환불해드립니다. </small></p>
  
  <form id="my" action="/mypage/cancel" method="POST">
  <input type="hidden" name="c" value="1"/>
  <table class="table table-bordered table-hover" style="width: 100%;">
   <thead>
      <tr class="active" >
        <th>차종</th>
        <th>예약일</th>
        <th>반납일</th>
        <th>선택</th>
      </tr>
   </thead>
     <tbody>
    	<c:forEach var="v" items="${my}" varStatus="vs">
	      <tr class="success">
	        <td>${v.CNAME}</td>
	        <td>${v.SDAY}</td>
	        <td>${v.EDAY }</td>
	        <td><input type="checkbox" class="tt" name="no" value='${v.NO}'/></td>
	      </tr>
    	</c:forEach>
	</tbody>
  </table>
  <p align="right" ><button type="button" id="myb" class="btn btn-danger">예약취소</button><p>
  </form>
</div>
<div>
<h3>취소요청</h3>
  <form id="cancel" action="/mypage/cancel" method="POST">
  <input type="hidden" name="c" value="0"/>
  <table class="table table-bordered table-hover" style="width: 100%;">
   <thead>
      <tr class="active" >
        <th>차종</th>
        <th>예약일</th>
        <th>반납일</th>
        <th>선택</th>
      </tr>
   </thead>
     <tbody>
    	<c:forEach var="v" items="${cancel}" varStatus="vs">
	      <tr class="danger">
	        <td>${v.CNAME}</td>
	        <td>${v.SDAY}</td>
	        <td>${v.EDAY }</td>
	        <td><input type="checkbox" class="cc" name="no" value='${v.NO}'/></td>
	      </tr>
    	</c:forEach>
	</tbody>
  </table>
  <p align="right" ><button type="button" id="cancelb" class="btn btn-warning">요청취소</button><p>
  </form>
 </div>
 <div>
  <h3>종료된 예약</h3>
  <table class="table table-bordered table-hover" style="width: 100%;">
   <thead>
      <tr class="active" >
        <th>차종</th>
        <th>예약일</th>
        <th>반납일</th>
        <th>비고</th>
      </tr>
   </thead>
     <tbody>
    	<c:forEach var="v" items="${end}" varStatus="vs">
	      <tr class="active">
	        <td>${v.CNAME}</td>
	        <td>${v.SDAY}</td>
	        <td>${v.EDAY }</td>
	        <td><c:if test="${v.CANCEL eq '3' }"><span style="color:red">취소</span></c:if></td>
	      </tr>
    	</c:forEach>
	</tbody>
  </table>
</div>
<script>
  	$("#myb").click(function() {
	
		var b = false;
		$(".tt").each(function() {
			if ($(this).is(':checked')) {
				b = true;
				return true;
			}
		})
	
		if (!b) {
			alert("취소할 예약을 선택하세요");
		} else {
	
			if(window.confirm("선택한 예약을 취소하시겠습니까? 관리자가 승인할시 예약이 취소됩니다.")){
				$("#my").submit();
			} 
	
		}
	})
  
    	$("#cancelb").click(function() {
	
		var b = false;
		$(".cc").each(function() {
// 			console.log($(this).val());
			if ($(this).is(':checked')) {
				b = true;
				return true;
			}
		})
	
		if (!b) {
			alert("철회할 취소 건을 선택하세요");
		} else {
	
			if(window.confirm("취소 요청을 철회하시겠습니까?")){
				$("#cancel").submit();
			} 
	
		}
	})
  
</script>
</body>
</html>