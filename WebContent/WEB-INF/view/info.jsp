<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String type = request.getParameter("type");
%>
<html>
<head>
<title>Info</title>
</head>
<body>
	<div calss="carList" align="center">
		<h2>차량 정보</h2>
	<c:forEach var="li" items="${car }">
		<c:if test="${li.TYPE == param.type }">
		<table border="1" style="width: 100%; height: 170px;">
			<tr>
				<td colspan="3">&nbsp;<b style="font-size: 20px;">${li.CNAME }</b><small>(${li.MAX }인승)</small></td>
			</tr>
			<tr>
				<td rowspan="5" style="width: 50%"><img src="/imgCar/${li.NO }.JPG" style="width: 400px;"></td>
				<td align="center" style="width: 18%">1일</td>
				<td align="right">
					<fmt:formatNumber type="number" value="${li.PRICE }" pattern="#,###"/>원&nbsp;
				</td>
			</tr>
			<tr align="center">
				<td>${li.OIL }</td>
				<td>${li.KILO }Km</td>
			</tr>
			<tr align="center">
				<td colspan="2">옵션</td>
			</tr>
			<tr align="center">
				<td colspan="2">${li.OPT }</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 50px"><button style="width: 100%; height: 100%"><b style="font-size: 15px">선택</b></button></td>
			</tr>
		</table>
		<br/>
		</c:if>
	</c:forEach>
	</div>
</body>
</html>
