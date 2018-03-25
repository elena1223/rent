<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Manager</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div align="center">
		<h2>차량 목록</h2>
		<table class="table table-condensed table-hover">
			<thead>
				<tr align="center">
					<td><input type="checkbox" id="checkAll" /></td>
					<td><b>Name</b></td>
					<td><b>Type</b></td>
					<td><b>Price</b></td>
					<td><b>Oil</b></td>
					<td><b>Kilo</b></td>
					<td><b>Option</b></td>
					<td><b>Max</b></td>
					<td><b>Cnt</b></td>
				</tr>
			</thead>
			<c:forEach var="li" items="${car }">
				<tbody>
					<tr>
						<td><input type="checkbox" name="check" class="check" /></td>
						<td>${li.CNAME }</td>
						<td>${li.TYPE }</td>
						<td align="right"><fmt:formatNumber pattern="#,###">${li.PRICE }</fmt:formatNumber>원</td>
						<td align="center">${li.OIL }</td>
						<td align="right">${li.KILO }</td>
						<td>${li.OPT }</td>
						<td align="center">${li.MAX }</td>
						<td align="center">${li.CNT }</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>

		<button type="submit" class="btn btn-primary" style="width: 20%">수정</button>
		<button type="submit" class="btn btn-danger" style="width: 20%">삭제</button>

	</div>
	<script>
		var chkObj = document.getElementsByName("check");
		var rowCnt = chkObj.length;
		var ck;
		$(document).ready(function() {
			$('#checkAll').click(function() {
				if ($('#checkAll').is(':checked')) {
					//전체체크
					$('input:checkbox[name=check]').prop('checked', true);

				} else {
					//전체체크해제
					$('input:checkbox[name=check]').prop('checked', false);
				}
			});

			$('.check').click(function() {
				for (var i = 0; i < rowCnt; i++) {
					if (chkObj[i].checked == false) {
						ck = false;
						break;
					} else {
						ck = true;
					}
				}
				if (ck) {
					$('#checkAll').prop('checked', true);
				} else {
					$('#checkAll').prop('checked', false);
				}
			});

		})
	</script>
</body>
</html>