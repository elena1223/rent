<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
th {
	text-align: center;
	font-size: small;
}
</style>
</head>
<body>
<h4 align="center">종료된 예약</h4>
<table class="table table-hover table-bordered" >
	<thead>
		<tr>
			<th>예약자</th>
			<th>차량</th>
			<th>시작일</th>
			<th>반납일</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="r" items="${end }" >
			<tr class="active">
				<td align="center"><small>${r.NAME }</small></td>
				<td><small>${r.CNAME }</small></td>
				<td align="center"><small><fmt:formatDate value="${r.START_DAY }" pattern="yyyy-MM-dd"/></small></td>
				<td align="center"><small><fmt:formatDate value="${r.END_DAY }" pattern="yyyy-MM-dd"/></small></td>
				<td><small>${r.ID }</small></td>
				<td align="center"><small>${r.PHONE }</small></td>
				<td align="center">
				<c:choose>
					<c:when test="${r.CANCEL eq '3' }">
						<span style="color: red"><small>취소</small></span>
					</c:when>
					<c:otherwise>
						<span style="color: blue"><small>완료</small></span>						
					</c:otherwise>
				</c:choose>	
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>


</body>
</html>