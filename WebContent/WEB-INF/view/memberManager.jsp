<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div>
	<h2 style="color: #2E64FE" align="center">회원 관리</h2>
	<form>
		<div align="right">
			<span class="glyphicon glyphicon-search"></span> <input
				style="height: 30px" name="key" value="${key }"
				placeholder="아이디 or 이메일" />
		</div>
	</form>
	<form id="del" action="/manager/delete" method="post">
		<table class="table table-bordered table-hover" style="width: 100%">
			<thead>
				<tr align="center">
					<td width="7%"><b>번호</b></td>
					<td width="13%"><b>이름</b></td>
					<td><b>이메일</b></td>
					<td width="15%"><b>비밀번호</b></td>
					<td width="23%"><b>연락처</b></td>
					<td><b>권한</b></td>
					<td width="7%"><b>선택</b></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${member }">
					<c:choose>
						<c:when test="${m.LV eq '2'}">
							<tr class="success">
						</c:when>
						<c:when test="${m.LV eq '1' }">
							<tr class="info trr">
						</c:when>
						<c:otherwise>
							<tr class="active trr">
						</c:otherwise>
					</c:choose>
					<td align="right">${m.NO }&nbsp;</td>
					<td align="center">${m.NAME }</td>
					<td>${m.ID}</td>
					<td align="center">${m.PASSWORD }</td>
					<td align="center">${m.PHONE }</td>
					<td align="center">${m.LV }</td>
					<c:choose>
						<c:when test="${m.LV eq '2'}"><<td></td>
						</c:when>
						<c:otherwise>
							<td align="center"><input type="checkbox" name="no"
								value="${m.NO }" /></td>
						</c:otherwise>
					</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<form>
		<p align="right">
			<button type="button" id="b" class="btn btn-danger">선택한 회원
				강퇴</button>
		</p>
	</form>
</div>
<script>
	$(".trr").click(function() {
		var old = $(this).find("input:checkbox").prop("checked");
		$(this).find("input:checkbox").prop("checked", !old);
	});

	$("#b").click(function() {
		if (window.confirm("정말로 선택한 회원들을 강퇴시키겠습니까?")) {
			$("#del").submit()
		}

	})
</script>