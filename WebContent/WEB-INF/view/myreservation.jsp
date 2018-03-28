<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
  <title>나의 예약관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	height: 49px;
	vertical-align: middle;
	padding: 0px;
	}
	
th{
	text-align: center;
	}
	
</style>
<body>


<div class="container">
  <h2>예약관리</h2>
  <p>?? 할말있음 쓰고..</p>
  <table class="table table-bordered" style="width: 80%;">
   <thead>
      <tr class="active" >
        <th>차이름</th>
        <th>예약일</th>
        <th>반납일</th>
        <th>취소신청</th>
      </tr>
   </thead>
     <tbody>
    	<c:forEach var="v" items="${my}" varStatus="vs">
	      <tr class="success">
	        <td>${v.CNAME}</td>
	        <td>${v.SDAY}</td>
	        <td>${v.EDAY }</td>
	        <td><button type="button" class="btn btn-warning btn-sm">취소신청</button></td>
	      </tr>
    	</c:forEach>
	</tbody>
  </table>
</div>

</body>
</html>