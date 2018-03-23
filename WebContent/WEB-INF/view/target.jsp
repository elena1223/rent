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
		<h2 style="margin-bottom: 50px;">회원탈퇴</h2>
			<div align="left">
			<small>탈퇴할 경우 <span style="color: red;">복구가 불가능하니</span> <b>신중하게 선택하시기 바랍니다.</b><br/>
			회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.<br/>
			탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.<br/>
			게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다. <br/>
			삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다. <br/>
			탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어,<br/>
			게시글을 임의로 삭제해드릴 수 없습니다. <br/>
			</small>
			</div>
			<div class="" >
				<div class="input-group" style="width: 50%; margin-top: 20px;">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="id" type="text"
						class="form-control" name="id" placeholder="Email" autocomplete="off">
				</div>
				<div class="input-group" style="width: 50% margin-top: 20px;">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="password"
						type="password" class="form-control" name="password"
						placeholder="Password">
				</div>
					<input type="checkbox" id="outAgree" name="outAgree" onclick="clickcr();" style="margin-top: 20px;" >
					<small><label for="outAgree" ><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong></label></small>				
				<div class="input-group" style="width: 20%; margin-top: 20px;" >
					<button type="button" id="bye" class="btn" style="width: 100%" onclick="test()">확인</button>
				</div>
			</div>
	</div>
	
	<script>
	
	function test() {
		var id = $("#id").val();
		var password = $("#password").val();
    	
		if( !$("#outAgree").is(":checked")){

			alert("탈퇴 안내를 확인하고 동의해 주세요.");
			$("#outAgree").focus();
		}else{
		
		
		
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
    	
	}
	</script>
	
</body>
</html>