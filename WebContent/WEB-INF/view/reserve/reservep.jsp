<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div>
 <c:choose>
 	<c:when test="${res}">
 	예약성공
 	</c:when>
 	<c:otherwise>
 	예약에 실패하였습니다. 없는 차량이거나 이미 예약된 시간입니다.
 	</c:otherwise>
 </c:choose>
 </div>