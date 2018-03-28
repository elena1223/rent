<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <h3 style="text-align:left">진행중인 예약</h3>
  <form style="position: absolute; right: 0; margin:10px">
  <input name="key" value="${key}"/> <span style="text-align:right" class="glyphicon glyphicon-search"></span>
  </form> <br/><br/>
  <form id="cancelForm" action="/manager/cancelp" method="post">
  <table class="table">
    <thead>
      <tr>
        <th>예약자</th>
        <th>차량</th>
        <th>시작일</th>
        <th>반납일</th>
        <th>이메일</th>
        <th>연락처</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${reserve }">     
      <tr class="success">
        <td>${r.NAME }</td>
        <td>${r.CNAME }</td>
        <td>${r.START_DAY }</td>
        <td>${r.END_DAY }</td>
        <td>${r.ID }</td>
        <td>${r.PHONE }</td>
        <td><input type="checkbox" name="no" value="${r.RNO }"/></td>
      </tr>
     </c:forEach>
  	</tbody>
  </table>
  <button type="button" id="cancel" style="position: absolute; right: 0; margin:12px" class="btn btn-danger">예약취소</button>
  
  </form>
  <br/>
  <br/>
  <h3>예약취소요청</h3>
    <form id="cancelAdmit" action="/manager/cancelp" method="post">
  <table class="table">
    <thead>
      <tr>
        <th>예약자</th>
        <th>차량</th>
        <th>시작일</th>
        <th>반납일</th>
        <th>이메일</th>
        <th>연락처</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${cancel }">     
      <tr class="warning">
        <td>${r.NAME }</td>
        <td>${r.CNAME }</td>
        <td>${r.START_DAY }</td>
        <td>${r.END_DAY }</td>
        <td>${r.ID }</td>
        <td>${r.PHONE }</td>
        <td><input type="checkbox" name="no" value="${r.RNO }"/></td>
      </tr>
     </c:forEach>
  	</tbody>
  </table>
  <button type="button" id="admit" style="position: absolute; right: 0; margin:12px" class="btn btn-success">취소승인</button>
  
  </form>
<br/>
  <br/>
  <br/>
  <h3>종료된 예약</h3>
    <table class="table">
    <thead>
      <tr>
        <th>예약자</th>
        <th>차량</th>
        <th>시작일</th>
        <th>반납일</th>
        <th>이메일</th>
        <th>연락처</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${end }">     
      <tr class="active">
        <td>${r.NAME }</td>
        <td>${r.CNAME }</td>
        <td>${r.START_DAY }</td>
        <td>${r.END_DAY }</td>
        <td>${r.ID }</td>
        <td>${r.PHONE }</td>
      </tr>
     </c:forEach>
  	</tbody>
  </table>
  
  <script>
  $("#cancel").click(function(){
	if(window.confirm("선택한 예약을 취소하시겠습니까?")){
		$("#cancelForm").submit();
	} 
  })
  $("#admit").click(function(){
	if(window.confirm("선택한 예약을 취소하시겠습니까?")){
		$("#cancelAdmit").submit();
	} 
  })
  </script>
  