<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%
 	
 %>
 <div style="float:center">
 <h2 style="color:#2E64FE" align="center">예약 결과</h2>
 <div style="margin-bottom: 250px;">
 <c:choose>
 	<c:when test="${res}">
 	<div align="center" style="margin-top: 150px;">
 	<b>예약에 <span style="color: green;">성공</span>하였습니다.</b><br/><br/>
 	<p style="margin-top: 30px;">
 	<a href="/mypage/reserve" class="btn btn-success btn-sm" role="button">예약 확인</a>
 	<a href="/" class="btn btn-info btn-sm" role="button">메인으로</a>
 	</p>
 	</div>
 	</c:when>
 	<c:otherwise>
 	<div align="center">
 	<b>예약에 <span style="color: green;">실패</span>하였습니다.<br/>
 	<small>없는 차량이거나 이미 예약된 시간입니다.</small></b><br/><br/>
 	<p>
 	<a href="javascript:history.back();" class="btn btn-info btn-xs" role="button">되돌아가기</a>
 	</p>
 	</div>
 	</c:otherwise>
 </c:choose>
 </div>
 </div>