<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login</title>
</head>
<body>
	<div align="center">
		<form action="/session" method="post">
			<div>
				<h2 style="margin-bottom: 50px;">Login</h2>
			</div>
			<div class="">
				<div class="input-group" style="width: 50%">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="id" type="text"
						class="form-control" name="id" placeholder="Email" autocomplete="off">
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
				<div class="input-group" style="width: 50%">
					<button type="submit" class="btn" style="width: 100%">Login</button>
				</div>
			</div>
		</form>
		<p style="margin-top: 50px;">
		아이디가 없으신가요? &nbsp;<a href="/join" style="text-decoration: none;">회원가입</a>
		</p>
		<p style="margin-top: 10px;">
		비밀번호를 잊으셨나요? &nbsp;<a href="#" style="text-decoration: none;" onclick="find()">비밀번호 찾기</a>
		</p>		
	</div>
	
	
	<script>
	
    function find() {
		 
		var t= window.open("/mypass", "p", "width=500, height=500");
		t.resizeTo(500,500);  
    }
		
	
	
	
	
	
	
	</script>
	
	
</body>
</html>
