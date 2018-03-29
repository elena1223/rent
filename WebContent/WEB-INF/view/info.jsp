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
<style>
table {
	border: 1px;
	width: 100%;
	height: 170px;
	vertical-align: middle;

}
</style>
</head>
<body>
	<div align="center">
		<h2 style="color: #2E64FE">${param.type }</h2>
		<c:forEach var="li" items="${car }">
			<c:if test="${li.TYPE == param.type }">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th colspan="3">&nbsp;<b style="font-size: 20px;">${li.CNAME }</b><small>(${li.MAX }인승)</small></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="5" style="width: 50%"><img
								src="/imgCar/${li.IMG }" style="width: 400px;"></td>
							<td align="center" style="width: 18%;">1일</td>
							<td align="right"><fmt:formatNumber type="number"
									value="${li.PRICE }" pattern="#,###" />원&nbsp;</td>
						</tr>
						<tr align="center">
							<td>${li.OIL }</td>
							<td>연비 ${li.KILO }Km</td>
						</tr>
						<tr align="center">
							<td colspan="2">옵션</td>
						</tr>
						<tr align="center">
							<td colspan="2">${li.OPT }</td>
						</tr>
						<tr>
							<td colspan="2" style="height: 50px"><button
									onclick="location.href='/reserve/${li.NO}'" class="btn"
									style="width: 100%; height: 100%; background-color: #ff6000;">
									<b style="font-size: 15px; color: white;">선택</b>
								</button></td>
						</tr>
					</tbody>
				</table>
				<br />
			</c:if>
		</c:forEach>
	</div>
	<script>
		
	</script>
</body>
</html>
