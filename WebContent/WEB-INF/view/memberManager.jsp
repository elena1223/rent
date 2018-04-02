<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
th, td {
	text-align: center;
}
</style>

<div align="center">
	<h2 style="color: #2E64FE">회원 관리</h2>
	<form>
		<div align="right">
			<span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp; <input
				style="height: 30px" name="key" value="${key }"
				placeholder="아이디 or 이메일" />
		</div>
	</form>
	<form id="del" action="/manager/delete" method="post">
		<table class="table table-bordered table-hover" style="width: 100%">
			<thead>
				<tr>
					<th width="10%">번호</th>
					<th width="15%">이름</th>
					<th>이메일</th>
					<th width="15%">비밀번호</th>
					<th width="23%">연락처</th>
					<th width="7%">권한</th>
					<th width="7%">선택</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${member }" varStatus="vs">
					<c:choose>
						<c:when test="${m.LV eq '2'}">
							<tr class="success trr">
						</c:when>
						<c:when test="${m.LV eq '1' }">
							<tr class="info trr">
						</c:when>
						<c:otherwise>
							<tr class="active trr">
						</c:otherwise>
					</c:choose>
					<td>${vs.count }</td>
					<td>${m.NAME }</td>
					<td>${m.ID}</td>
					<td>${m.PASSWORD }</td>
					<td>${m.PHONE }</td>
					<td>${m.LV }</td>
					<c:choose>
						<c:when test="${m.LV eq '2'}"><<td></td>
						</c:when>
						<c:otherwise>
							<td><input type="checkbox" name="no" value="${m.NO }" /></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<form>
		<p align="right">
			<button type="button" id="b" class="btn btn-danger">
				<small>회원 강퇴</small>
			</button>
		</p>
	</form>
</div>
<script>
	$(".trr").click(function() {
		var old = $(this).find("input:checkbox").prop("checked");
		$(this).find("input:checkbox").trigger("click");
	});

	$("#b").click(function() {
		if (window.confirm("정말로 선택한 회원들을 강퇴시키겠습니까?")) {
			$("#del").submit()
		}

	})
</script>