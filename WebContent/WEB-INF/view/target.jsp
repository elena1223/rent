<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
	<h2 id="t"></h2>
	
				<div>
				<h2 style="margin-bottom: 50px;">회원탈퇴</h2>
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
					<button type="button" class="btn" style="width: 100%" onclick="test()">탈퇴하기</button>
				</div>
			</div>
	
	
	<script>
	
	function test() {
		var id = $("#id").val();
		var password = $("#password").val();
    	
		$.ajax({
			url: "/outMember",
			type: "POST",
			async:false,
			data : {
				"id" : id ,
				"password" : password
			},
			success: function(rst){
				if(rst != null){
					opener.location.href = "/";
					window.close();
				}
			}
		});    	
    	
	}
	</script>
	
</body>
</html>