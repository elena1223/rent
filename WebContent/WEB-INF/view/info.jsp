<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String type = request.getParameter("type");
	if(type==null){
		type="소형";
	}
%>
<html>
<head>
<title>Info</title>
<style>
table {
	border: 1px;
	width: 100%;
	height: 170px;

}
</style>
</head>
<body>
	<div align="center">
		<h2 style="color: #2E64FE">${param.type }</h2>
		<c:forEach var="li" items="${car }">
			<c:if test="${li.TYPE == param.type }">
				<table class="table table-condensed">
					<tr>
						<td colspan="5">&nbsp;<b style="font-size: 20px;">${li.CNAME }</b><small>&nbsp;(${li.MAX }인승)</small></td>
					</tr>
					<tr>
						<td rowspan="5" style="width: 50%"><img
							src="/imgCar/${li.IMG }" style="width: 400px;"></td>
						<td colspan="2" align="center" style="vertical-align: middle;">1일</td>
						<td colspan="2" align="center" style="vertical-align: middle;"><fmt:formatNumber type="number"
								value="${li.PRICE }" pattern="#,###" />원&nbsp;</td>
					</tr>
					<tr align="center">
						<td style="vertical-align: middle;">연료</td>
						<td style="vertical-align: middle;"> ${li.OIL }</td>
						<td style="vertical-align: middle;">연비</td>
						<td style="vertical-align: middle;">${li.KILO }Km</td>
					</tr>
					<tr align="center">
						<td colspan="4" style="vertical-align: middle;">옵션</td>
					</tr>
					<tr align="center">
						<td colspan="4" style="vertical-align: middle;">${li.OPT }</td>
					</tr>
					<tr>
						<c:if test="${logon != null }">
						<td colspan="4" style="height: 50px">
						<button onclick="location.href='/reserve/${li.NO}'" class="btn"
								style="width: 100%; height: 100%; background-color: #ff6000;">
								<b style="font-size: 15px; color: white;" class="needLogin">선택</b>
							</button>
							</td>
						</c:if>
					</tr>
				</table>
				<br />
			</c:if>
		</c:forEach>
	</div>
	<script>
		
	</script>
</body>
</html>
