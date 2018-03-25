<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String uri=((String)request.getAttribute( "javax.servlet.forward.request_uri" )).split("/")[1];
	String[] location="info,reserve,service,customer,mypage,manager".split(",");
	request.setAttribute("location", location);
	request.setAttribute("uri", uri);
%>
<c:choose>
	<c:when test="${uri==location[0]}">
		<p><a href="/info?type=소형">소형</a></p>
		<p><a href="/info?type=중형">중형</a></p>
		<p><a href="/info?type=대형">대형</a></p>
		<p><a href="/info?type=외제">외제</a></p>
	</c:when>
	<c:when test="${uri==location[2]}">
		<p><a href="/service/way">오시는길</a>
		<p><a href="/service/condition">대여자격</a></p>
		<p><a href="/service/indemnity">보험보상</a></p>
	</c:when>
	<c:when test="${uri==location[3]}">
		<p><a href="/customer/qna">고객문의</a></p>
		<p><a href="/customer/notice">공지</a></p>
		<p><a href="/customer/review">후기</a></p>
	</c:when>
	<c:when test="${uri==location[5]}">
		<p><a href="/manager/register">차량등록</a></p>
		<p><a href="/manager/updateremove">수정/삭제</a></p>
		<p><a href="/manager/reservation">예약내역</a></p>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>

