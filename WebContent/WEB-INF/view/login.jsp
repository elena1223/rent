<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login</title>
</head>
<body>
	<div class="container" align="center">
		<form action="/session" method="post">
			<div>
				<h2>Login</h2>
			</div>
			<div class="">
				<div class="input-group" style="width: 50%">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="id" type="text"
						class="form-control" name="id" placeholder="Email">
				</div>
				<div class="input-group" style="width: 50%">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="password"
						type="password" class="form-control" name="password"
						placeholder="Password">
				</div>
				<c:if test="${!empty err }">
					<span style="color: red;">${err }</span>
				</c:if>
				<div class="input-group" style="width: 100%">
					<button type="submit" class="btn" style="width: 50%">Login</button>
				</div>
			</div>
		</form>
		아이디가 없습니까? <a href="/join">회원가입</a>
	</div>
</body>
</html>
