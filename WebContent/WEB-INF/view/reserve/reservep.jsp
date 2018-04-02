<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%
 	
 %>
 <div style="float:center">
 <h2 style="color:#2E64FE" align="center">예약 결과</h2>
 <c:choose>
 	<c:when test="${res}">
 	<div align="center">
 	예약에 성공하였습니다.<br/><br/>
 	<p>
 	<a href="/mypage/reserve" class="btn btn-info" role="button">예약 확인</a>
 	</p>
 	</div>
 	</c:when>
 	<c:otherwise>
 	<div align="center">
 	예약에 실패하였습니다. 없는 차량이거나 이미 예약된 시간입니다.<br/><br/>
 	<p>
 	<a href="javascript:history.back();" class="btn btn-info" role="button">되돌아가기</a>
 	</p>
 	</div>
 	</c:otherwise>
 </c:choose>
 </div>