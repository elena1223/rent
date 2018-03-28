<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div style="float:center">
 <h2 style="color:#2E64FE">예약 진행 결과</h2>
 <c:choose>
 	<c:when test="${res}">
 	예약에 성공하였습니다.<br/><a href="">예약 확인</a>
 	</c:when>
 	<c:otherwise>
 	예약에 실패하였습니다. 없는 차량이거나 이미 예약된 시간입니다.<br/><a href="javascript:history.back();">되돌아가기</a>
 	</c:otherwise>
 </c:choose>
 </div>