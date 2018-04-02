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
<style>
th{
	text-align: center;
}
</style>
</head>
<body>
	<div align="center">
		<h2 style="color: #2E64FE">차량 목록</h2>
		<form name="form" method="post" id="form" onsubmit="return update();">
		<table class="table table-condensed table-hover">
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAll" /></th>
					<th>이름</th>
					<th>타입</th>
					<th>가격<small>(1일)</small></th>
					<th>유종</th>
					<th>연비</th>
					<th>옵션</th>
					<th>정원</th>
					<th>보유</th>
				</tr>
			</thead>
			<c:forEach var="li" items="${car }">
				<tbody>
					<tr class="trr">
						<td align="center"><input type="checkbox" name="no" class="check" value="${li.NO }"/></td>
						<td>${li.CNAME }</td>
						<td>${li.TYPE }</td>
						<td align="center"><fmt:formatNumber pattern="#,###">${li.PRICE }</fmt:formatNumber>원</td>
						<td align="center">${li.OIL }</td>
						<td align="center">${li.KILO }</td>
						<td>${li.OPT }</td> 
						<td align="center">${li.MAX }</td>
						<td align="center">${li.CNT }</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<button type="submit" class="btn btn-success" 
		style="width: 20%; margin-bottom: 30px;" formaction="/manager/update">수정</button>
		<button type="submit" class="btn btn-danger" 
		style="width: 20%; margin-bottom: 30px;" formaction="/manager/remove" onclick="remove()">삭제</button>
		</form>
	</div>
	<br/>
	<script>
		// 테이블 선택시 해당 라인 체크/해제
		$(".trr").click(function(){
			var old = $(this).find("input:checkbox").prop("checked");
			$(this).find("input:checkbox").prop("checked", !old);
		});
	
		var chkObj = document.getElementsByName("no");
		var rowCnt = chkObj.length;
		var ck;
		$(document).ready(function() {
			$('#checkAll').click(function() {
				if ($('#checkAll').is(':checked')) {
					//전체체크
					$('input:checkbox[name=no]').prop('checked', true);

				} else {
					//전체체크해제
					$('input:checkbox[name=no]').prop('checked', false);
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
		function remove(){
			window.alert("삭제가 완료되었습니다.");
		}
		function update(){
			var cnt = 0;
			for (var i = 0; i < rowCnt; i++) {
				if (chkObj[i].checked) {
					cnt++;
				}
			}
			if(cnt >= 2){
				window.alert("수정 항복은 하나만 선택해주세요.");
				return false;
			}else{
				return true;
			}
		}
	</script>
</body>
</html>