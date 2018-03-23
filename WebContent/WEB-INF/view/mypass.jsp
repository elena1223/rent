<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
	<h2 id="t"></h2>
	
	<div align="center">
		<h2 style="margin-bottom: 50px;">비밀번호 찾기</h2>
			<small><span style="color: red; font: bold;">사용하시는 아이디(E-mail)와 휴대폰번호를 입력해주세요</span> </small>
			<div class="" >
				<div class="input-group" style="width: 50%; margin-top: 20px;">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="id" type="text"
						class="form-control" name="id" placeholder="Email" autocomplete="off">
				</div>
				<div class="input-group" style="width: 50% margin-top: 20px;">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-lock"></i></span> 
				<input type="text" name= "phone" id="phone" autocomplete="off" maxlength="13"
						placeholder="xxx-xxxx-xxxx" style="padding: 2px;" />
				</div>
						
				<div class="input-group" style="width: 20%; margin-top: 20px;" >
					<button type="button" id="findpass" class="btn" style="width: 100%" onclick="findpass()">찾기</button>
				</div>
			</div>
	</div>
	
	<script>
	
	function findpass() {
		var id = $("#id").val();
		var phone = $("#phone").val();
		
		$.ajax({
			url: "/findpass",
			type: "POST",
			async:false,
			data : {
				"id" : id,
				"phone" : phone
			},
			success: function(rst){
				if(rst!=null){
					alert("비밀번호가 고객님 이메일로 전송되었습니다.");
					window.close();
				} 
			}
		});    
    	
	}
	</script>
	
</body>
</html>