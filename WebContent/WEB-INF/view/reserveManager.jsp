<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <h2 style="color: #2E64FE" align="center">예약 내역</h2>
  <form style="position: absolute; right: 0; margin:10px">
  <span style="text-align:right" class="glyphicon glyphicon-search"></span> <input name="key" value="${key}"/> 
  </form>
  <h3 style="text-align:left">진행중인 예약</h3>
  <form id="cancelForm" action="/manager/cancelp" method="post">
  <input type="hidden" name="c" value="3">
  <table class="table table-hover">
    <thead>
      <tr align="center">
        <td><b>예약자</b></td>
        <td><b>차량</b></td>
        <td><b>시작일</b></td>
        <td><b>반납일</b></td>
        <td><b>이메일</b></td>
        <td><b>연락처</b></td>
        <td></td>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${reserve }">     
      <tr class="success trr" >
        <td align="center">${r.NAME }</td>
        <td>${r.CNAME }</td>
        <td align="center">${r.START_DAY }</td>
        <td align="center">${r.END_DAY }</td>
        <td>${r.ID }</td>
        <td align="center">${r.PHONE }</td>
        <td align="center"><input type="checkbox" name="no" value="${r.RNO }"/></td>
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
    <input type="hidden" name="c" value="3">
  <table class="table table-hover">
    <thead>
      <tr align="center">
        <td><b>예약자</b></td>
        <td><b>차량</b></td>
        <td><b>시작일</b></td>
        <td><b>반납일</b></td>
        <td><b>이메일</b></td>
        <td><b>연락처</b></td>
        <td></td>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${cancel }">     
      <tr class="danger trr">
        <td align="center">${r.NAME }</td>
        <td>${r.CNAME }</td>
        <td align="center">${r.START_DAY }</td>
        <td align="center">${r.END_DAY }</td>
        <td>${r.ID }</td>
        <td align="center">${r.PHONE }</td>
        <td align="center"><input type="checkbox" name="no" value="${r.RNO }"/></td>
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
    <table class="table table-hover">
    <thead>
      <tr align="center">
        <td><b>예약자</b></td>
        <td><b>차량</b></td>
        <td><b>시작일</b></td>
        <td><b>반납일</b></td>
        <td><b>이메일</b></td>
        <td><b>연락처</b></td>
        <td><b>비고</b></td>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${end }">     
      <tr class="active">
        <td align="center">${r.NAME }</td>
        <td>${r.CNAME }</td>
        <td align="center">${r.START_DAY }</td>
        <td align="center">${r.END_DAY }</td>
        <td>${r.ID }</td>
        <td align="center">${r.PHONE }</td>
        <td align="center"><c:if test="${r.CANCEL eq '3' }"><span style="color:red">취소</span></c:if></td>
      </tr>
     </c:forEach>
  	</tbody>
  </table>
  
  <script>
  $(".trr").click(function(){
		var old = $(this).find("input:checkbox").prop("checked");
		$(this).find("input:checkbox").prop("checked", !old);
	});
  
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
  